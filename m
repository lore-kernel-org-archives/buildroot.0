Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C6DD6AAF8
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66EBF6075B;
	Thu,  2 Apr 2026 19:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58uEdQ03QZYm; Thu,  2 Apr 2026 19:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B9A6076D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775157667;
	bh=CdYhG2tyTdSG0AWXHhW6p1BWiYE86qOnJmM8K4MNDdE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aJbbiasjryETso6sstbFXbnz67kGFpVYZZ2qsWsMpOjs1ImfKAV2yUbKesVsyayy9
	 vD9k0bB6uxAfYlUfOyDCwyME7C4nv+TI7sSwto3kIg7XCsBBuL5n/8GK11SAOg3E8+
	 BW2jxcCZ0C8vzx4sZVw1AfCe58r4O7y5S9AY63fvThP2jJk/vpjBK//99bLPygKRe3
	 qigDa5MOTV+o9mY8BizJCTXso4CVZTk2Rmkd4+e9G7pYAKmO2+X3+b/GVI8udbVcMZ
	 +8K35hP9xJ0nWiJ7xj4ftLKGYSJWZ6B/GmzKkxAxSzL6IwsDKyEMECQjwfgtSY8wU9
	 1v4jB1WyA6B9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B9A6076D;
	Thu,  2 Apr 2026 19:21:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38BC32D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A39D401E0
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id va98poJ1b4Wt for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E09C400B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E09C400B3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:21:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3DEC7FF1A; Thu,  2 Apr 2026 19:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Apr 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5388405cfd6df463ec01643d371ec9eef95360a7
X-Git-Newrev: f42f5f4dbcc21d3119799d61112fcb4de0d24a68
X-Patchwork-Hint: ignore
Message-Id: <20260402192104.A3DEC7FF1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump to version
 9.18.48
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f42f5f4dbcc21d3119799d61112fcb4de0d24a68
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/changelog.html

Fixes bugs:
GL #5817
https://gitlab.isc.org/isc-projects/bind9/-/issues/5817
GL #5800
https://gitlab.isc.org/isc-projects/bind9/-/issues/5800
GL #5826
https://gitlab.isc.org/isc-projects/bind9/-/issues/5826

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 09d35a3698..7b268a49b4 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.47/bind-9.18.47.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.48/bind-9.18.48.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  9d544ba013decd1ee60e3c99d5548dd21aaaf5db96205dfc8623f39f061f14be  bind-9.18.47.tar.xz
+sha256  c742a69bff2561c23099d7c70c6984c145bcca1c1e3c67fac1f68a8132e8e7c5  bind-9.18.48.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b889f922b6..17ea50c5f4 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.47
+BIND_VERSION = 9.18.48
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4274EC54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8780260B78;
	Fri, 31 Jul 2026 12:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcMhIgvzOtpe; Fri, 31 Jul 2026 12:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4697D60B6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500454;
	bh=/LlugZtfffhkX5ktHZDH/RZyhWVTZH1u9pvcxdMFz7E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NWsBe5cOGo6ABa7aZBW9TTnDlXQ5YPlm1XzEXKVJ7L9ftlY60o7OJVNhq2TnHB/GE
	 zP4Unz3+uq/UAQy1obFNQQDSU2XYYDOQG4XVKeYCSZpYG01CtS+gyG44M0qib28KRx
	 RrQozGrTCmf2jURwmNM+ldppn4GLz4Av2CIBfqCQZOeZS4PqqMX/lUmStty9dU3loR
	 I/v7lX5J8W6QAjJcKO7nBcFVtz/Qby5dzpebPFdRs4Vrcw1c/UE7Py7qOzT+0GIgbo
	 qAAAwd53sL9UWqW6KWri5zs4XhrPGKm8nm5u124VvaPkITus6CiNcxc2e5ruYay1BO
	 fPuPktqoYb6rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4697D60B6F;
	Fri, 31 Jul 2026 12:20:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AB8536E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A99B400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWAViyWpwVXo for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E523440463
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E523440463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C57AB8B747; Fri, 31 Jul 2026 12:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:13:46 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e46a64a5face0d1ae73c8ac8100defa09b092de8
X-Git-Newrev: 01beb2c14d05ca78d6d47992535cf14fb5fb1202
X-Patchwork-Hint: ignore
Message-Id: <20260731122002.C57AB8B747@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/bind: security
 bump version to 9.20.26
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01beb2c14d05ca78d6d47992535cf14fb5fb1202
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/notes.html#notes-for-bind-9-20-26
https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/changelog.html
https://seclists.org/oss-sec/2026/q3/208

Fixes

CVE-2026-10723: Incorrect acceptance of NSEC3 records
CVE-2026-10822: Key Record using PRIVATEDNS algorithm may lead to unexpected exit
CVE-2026-11331: Potential wildcard CNAME RPZ policy bypass
CVE-2026-11605: Unnecessary validation of DNSSEC signed records
CVE-2026-11622: Potential memory usage beyond configured limits
CVE-2026-11721: Cache poisoning possible with label count discrepancy, RRSIG, and wildcards
CVE-2026-12617: Record ordering based unexpected exit with CNAME or DNAME
CVE-2026-13204: Unexpected exit in certain situations with NSEC and NSEC3 both present
CVE-2026-13321: DNSSEC Validation Bypass via Out-of-Zone NSEC Next Field

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: update pgp key id in hash file comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8c96a8981f40689c352910372404216ab0d9482e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index a1ff3c6101..36ff7b2d0a 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz.asc
-# with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08  bind-9.20.24.tar.xz
+# Verified from https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz.asc
+# with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
+sha256  55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350  bind-9.20.26.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2b8156d0d0..172bbf79b5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.24
+BIND_VERSION = 9.20.26
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

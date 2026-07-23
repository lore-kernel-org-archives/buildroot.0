Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3197C531CC
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 21:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FA860AF3;
	Thu, 23 Jul 2026 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2Wey_n_Oy7B; Thu, 23 Jul 2026 21:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B65E60AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784841029;
	bh=gXBSS7ZBMXuFBn21FJATG07g0PmluVeKn6iBjn5b1cw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LpWRpiHn03kMj6F8ESh7OaNSOpFQDIZyvdKkgnFYHQv4aJco9biEvrLMIN9S7Pzg5
	 8hSDwUm87eUECbcqafPPNzTwoeSSGa6zZZaVEu+W7Njd9M/6oMSZEo/J5fHSKy7qVf
	 8AAXYJaBkCGKH3wtmmXZEifMb1tIGJNlxF08WX7OabG0bNvDX+VDphW6CYIFjVDaGJ
	 R5KMzzMAWQ79tQq5RfE8oFcv+qVBWc9bdQPwmSp7qlbvFMvo9kmyvn3s6BcN/PMvzQ
	 O5KSVbUVrc/0qSNJA3fWaSK3838w6189OsbIBeUku5r7apmbZSOAEii+RHgYzbGWdz
	 /js42KnwKUYPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B65E60AA4;
	Thu, 23 Jul 2026 21:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6AE0707
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 21:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACCEC40AD2
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SriaPimZURe for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 21:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBAD640AD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBAD640AD1
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 21:10:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93A1D8A43D; Thu, 23 Jul 2026 21:09:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 23:01:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cda55b2237194cef51008b2a6d0f9637095be18
X-Git-Newrev: 8c96a8981f40689c352910372404216ab0d9482e
X-Patchwork-Hint: ignore
Message-Id: <20260723210947.93A1D8A43D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump version to
 9.20.26
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c96a8981f40689c352910372404216ab0d9482e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

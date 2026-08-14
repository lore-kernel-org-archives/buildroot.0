Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A12C5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF43A40D21;
	Fri, 14 Aug 2026 13:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLoUdN9tltSs; Fri, 14 Aug 2026 13:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF0740D2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713617;
	bh=122QQmXVCa5hEcGDi51sJolMw+xLYDVF1/Wte5WXo4Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EbFFPDX4py9tAOvHap17sYVkRFbaCKRkpS3PMhWc7Rq9pm3lWOYPMRDWf2AbCW5Kp
	 oVROf0t7BZGfDXB6TtFJXyajiHM+rAd8Mp7a7jjouS15XX5lZVJORz0zGTwZ9syKpg
	 dr76tN/OCR5nfFeGZfOkUsh69UlQd6m5QbSnrzm1XooTkb1K0GoN0qpR0C6Ehcf3tJ
	 PKf60FcYPnk/j6Mi6F/MabzWtv4oGLT/vRwtL+HOQGRL1UaAqLER9WxsatKHwhJTAF
	 klj0q0dm/IQr1+GNG4APM39xl34m+9QBCV7GebIVz+2WJcAvYecultUMoVu7yG6F13
	 BKeghnCpI64pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF0740D2C;
	Fri, 14 Aug 2026 13:20:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 183EC139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14AFD40C39
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRjmpBLGUeZB for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B4C40C3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55B4C40C3C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A5388D66A; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4865b8c67604c59fcf13ae3daecbe6b64a1ac0a6
X-Git-Newrev: 7ec90ca53a1a6a52488aa685a70058125b7e7a3d
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.5A5388D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/stunnel: security
 bump to 5.80
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ec90ca53a1a6a52488aa685a70058125b7e7a3d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes following CVE's:

CVE-2026-70368: Fixed an out-of-bounds memory
access triggered by logging attacker-controlled protocol messages longer
than 1,024 bytes (thanks to AISLE Research and Clemens Lang).

CVE-2026-70367: Fixed a SOCKS server mode bypass of the localhost
destination filter using alternate local-address encodings and
interface-scoped IPv6 destinations (thanks to AISLE Research and Clemens
Lang).

Complete Changelog is here:
https://www.stunnel.org/NEWS.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8b6eea299b3e519a6dac908e5ceed49cc43c4698)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/stunnel/stunnel.hash | 4 ++--
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index 572f226861..f966e19f05 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/archive/5.x/stunnel-5.78.tar.gz.sha256
-sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
+# From https://www.stunnel.org/archive/5.x/stunnel-5.80.tar.gz.sha256
+sha256  6d0841d48de07cbbaf4a055919065bf7bb5ebc63cc15c97a2c76caa2bf285513  stunnel-5.80.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 6c8ddc3359..1421b706b7 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).78
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).80
 STUNNEL_SITE = https://www.stunnel.org/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

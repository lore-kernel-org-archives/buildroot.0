Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52D9FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886AA8364F;
	Tue, 28 Apr 2026 18:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO1FMjWjFw75; Tue, 28 Apr 2026 18:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72E2835A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402635;
	bh=/53uV9b5n2IlWaPvtgW0uy6Xv28xj4p96E78Tdk4ldY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WLjSo1XCw8wsfLXPoXjGrP3lj7Y+dJ8A/QpF6DqjOrFB8pVhY20PsYJv2F2ad3p6D
	 RKz6NC3naRFRZUsMIf3+SrFQ7AT4W3JVFjMq+1iAk0pBpQlUnkR/7/lza4hBp6IshB
	 vtENvPvWJILnPHyb0olSZQteyPiJFcXNch5ZKM50WHjYIKSjWHdRZOEc2xQK64YLPZ
	 bMrMDkE/XvFEPB9kYyP7jpqmQLZuwG2Raod+IreE3I+D6/RG9S3DS69v8HDfTVSW/Z
	 gR+7XfGuUiPVstzFS1pbAwqMymw4/2HgcArdpmjNYLpVlonryB9+Y3Trbz54jCgS2C
	 TpraWFTOvzteg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72E2835A7;
	Tue, 28 Apr 2026 18:57:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE209231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0117835A7
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ud2JzOJQH3dQ for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D39E083542
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D39E083542
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:57:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 863DF8396B; Tue, 28 Apr 2026 18:57:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:55:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8772eb193d83242a5f679fc74bff27b4586f6d3f
X-Git-Newrev: 09ce45ded6b1190dfcf675ff4f15420495194c18
X-Patchwork-Hint: ignore
Message-Id: <20260428185713.863DF8396B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunibreak: bump version to 7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09ce45ded6b1190dfcf675ff4f15420495194c18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/adah1972/libunibreak/blob/libunibreak_7_0/NEWS

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libunibreak/libunibreak.hash | 3 ++-
 package/libunibreak/libunibreak.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
index 8f1e7d292a..ce3cdfd8a5 100644
--- a/package/libunibreak/libunibreak.hash
+++ b/package/libunibreak/libunibreak.hash
@@ -1,3 +1,4 @@
+# From https://github.com/adah1972/libunibreak/releases/tag/libunibreak_7_0
+sha256  8c9a6e121736cd0d5c890ae3ae96f3f4010a19aa040f1dbded833a62a87717d3  libunibreak-7.0.tar.gz
 # Locally computed
-sha256  cc4de0099cf7ff05005ceabff4afed4c582a736abc38033e70fdac86335ce93f  libunibreak-6.1.tar.gz
 sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
index de3ea0fefc..d508f19eec 100644
--- a/package/libunibreak/libunibreak.mk
+++ b/package/libunibreak/libunibreak.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNIBREAK_VERSION = 6.1
+LIBUNIBREAK_VERSION = 7.0
 LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
 LIBUNIBREAK_INSTALL_STAGING = YES
 LIBUNIBREAK_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

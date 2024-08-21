Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C28C52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 17:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E044066D;
	Wed, 21 Aug 2024 17:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XNvaSVUv0ew; Wed, 21 Aug 2024 17:22:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8147B4065B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8147B4065B;
	Wed, 21 Aug 2024 17:22:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC771BF3A6
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 17:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8913A80DBA
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 17:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXhnTSVEDGDK for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 17:22:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 782E780DAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 782E780DAB
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 782E780DAB
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 17:22:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1F2FD3536378; Wed, 21 Aug 2024 19:22:38 +0200 (CEST)
Date: Wed, 21 Aug 2024 19:22:38 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsYiXqsy7E86O/4q@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724260958; bh=mavIJ0R4cbI+PQUwf1Mdya0OFGbEl2delYs3sECsTYg=;
 h=Date:From:To:Subject:From;
 b=XqqhuZr2+sG+ICfZb8ZD231fF1zVbgiM+qJ6QUB9p0YlqRxUJyXPSW1AQhmtA4gmA
 cTYpRTTv6l/H3lmQOMbkT3oQ0uA9n1rF9sRG1xMMsIaIRnApBCUPhNjUUQmk1s4NVa
 J7r2SjNLRFFVe1dXP3jllBFDfoDrEYq3p5QbkiPInkFCfyJuI2pBtriIYCQBNGAeJy
 XvjaEHt+o2c/BJMXKWsFX97mvaDvuPA1AkVyk95OKFTf+O73XkwoQamwBxMCQs9NQo
 1EYT7x3jjYmt0hpu0bAN5p269dBzVsxO15PXRUo0WnJt4F9uhnJEFhal9kNjb+h/h4
 Ktp/C8L5Nmmrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=XqqhuZr2
Subject: [Buildroot] [PATCH next] package/coreutils: update to 9.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for the release announcement:
https://lists.gnu.org/archive/html/info-gnu/2024-03/msg00006.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index 7df1048afa..3455c95c58 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843f8d199a904bbaa  coreutils-9.3.tar.xz
+sha256  cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a  coreutils-9.5.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 89f494310e..a6d193b49e 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.3
+COREUTILS_VERSION = 9.5
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D280C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 07:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B647581344;
	Sun, 11 Aug 2024 07:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WHfbEzsliy9; Sun, 11 Aug 2024 07:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E1DD81337
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E1DD81337;
	Sun, 11 Aug 2024 07:16:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 840731BF31A
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 07:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C8C881337
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 07:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3i7fb-Tq5K7t for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 07:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADF318132F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF318132F
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADF318132F
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 07:16:34 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 272A735282F0; Sun, 11 Aug 2024 09:16:31 +0200 (CEST)
Date: Sun, 11 Aug 2024 09:16:31 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrhlT1NAkvCmXNAS@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723360591; bh=o4S2p67NEF7HIbQQa3s8witmJdAWGJOSpWkNnXvdiCw=;
 h=Date:From:To:Subject:From;
 b=WgpCkueSCdzv0+1FXTrknSoLqeal4XFZ9bDktvZIZzqpL98dnGlPCddLyxivH714x
 2Wk7wztDP8v1Pn4w4K58LC4LAYUVnKaH3IEjSJW3bC3XhZV3JhJW+CZD0qhiVqEmlG
 aimpRqG4yn1nvIguNVkcwKn4DqDQvWDPuTqa633G0vVfH1IdOfVXccfxtcrzfFw9dc
 J0Djv2WOJaIwET1x/Nc2/fi8X3rw7fNfsHA1j65XA0wkceLXslvmLBM0ymoKGttgfq
 y2rTOXpDm4ZG/T3dWz4zUOAC5rpv0JnCdZDFox+4N+3JDSY5KaV8SmDCyh2EoeoF2p
 ReznfvuUvftZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=WgpCkueS
Subject: [Buildroot] [PATCH next] package/bird: update to 2.15.1
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

See here for a changelog:
https://gitlab.nic.cz/labs/bird/-/blob/master/NEWS

An uClibc-ng based system needs _GNU_SOURCE in the CFLAGS to
provide getrandom().

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index a62fbba630..a781e314df 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  3ec462a237d06d1f4455d6ec00a42f0b1686061fc988e5c89a841d01dd753b53  bird-2.0.12.tar.gz
+sha256  48e85c622de164756c132ea77ad1a8a95cc9fd0137ffd0d882746589ce75c75d  bird-2.15.1.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index f1b2ee6c5e..34d7912954 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.12
+BIRD_VERSION = 2.15.1
 BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
@@ -12,6 +12,8 @@ BIRD_CPE_ID_VENDOR = nic
 BIRD_SELINUX_MODULES = bird
 BIRD_DEPENDENCIES = host-flex host-bison
 
+BIRD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 # 0001-configure.ac-fix-build-with-autoconf-2.70.patch
 BIRD_AUTORECONF = YES
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

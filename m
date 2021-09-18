Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7942C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 14:56:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2016127B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 14:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F2016127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D583183F8C;
	Sat, 18 Sep 2021 14:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7CTm5IrsfiR; Sat, 18 Sep 2021 14:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EF3E83F89;
	Sat, 18 Sep 2021 14:56:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6341BF5A3
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 14:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B9356060A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 14:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sm_-m-QAix5L for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 14:56:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A44B8605E5
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 14:56:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 40344878D5; Sat, 18 Sep 2021 14:54:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 16:55:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c54f85ca0d2ba7b73c899a27e62c67d3389617b8
X-Git-Newrev: 30479788f18d4a625687b3228a3b527dab63c239
X-Patchwork-Hint: ignore
Message-Id: <20210918145431.40344878D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: bump to version 4.4.26
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30479788f18d4a625687b3228a3b527dab63c239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump contains a single change to fix the following build failure
with Microblaze raised since bump to version 4.4.25 in commit
a071bec0a0cd928443223132d47564c90bc64713:

lib/crypt-gensalt-static.c:33:1: error: symver is only supported on ELF platforms
   33 | SYMVER_crypt_gensalt;
      | ^~~~~~~~~~~~~~~~~~~~

Update hash of LICENSING due to new file being added with
https://github.com/besser82/libxcrypt/commit/4ab5f672eb6fb43c9bd83060ef48f90decd4989c

https://github.com/besser82/libxcrypt/blob/v4.4.26/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/4766bfce9813b7f321369ec45298d16cd6dc251a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index e0b96406cc..b47f470020 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  caea3d032a46c4855ff818637884c7f5719ad228b79387b62ee023c8fbef17b4  libxcrypt-4.4.25.tar.gz
-sha256  3c1ff7a7c9da111853ada463c54b65b42b7b1d3d6592dd527281db0827331d77  LICENSING
+sha256  e8a544dd19171c1e6191a6044c96cc31496d781ba08b5a00f53310d001d58114  libxcrypt-4.4.26.tar.gz
+sha256  cead8b3d94a143f64ccb571ada1cea47a70a0b847c8d95306e8d78ed68951f3d  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 4627d21b62..3c98b30dd5 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.25
+LIBXCRYPT_VERSION = 4.4.26
 LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

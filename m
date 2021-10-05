Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29961C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:19:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B88161506
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B88161506
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3823E405B8;
	Tue,  5 Oct 2021 15:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnC1FQolazcx; Tue,  5 Oct 2021 15:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E2C40724;
	Tue,  5 Oct 2021 15:19:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FC6E1BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABD3260B38
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TpyJV9AkZgg8 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 15:18:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7085660B54
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 15:18:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A5DFF91118; Tue,  5 Oct 2021 15:15:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 16:50:58 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: e5b1c6dd877643833949637864ab6ee3553beb20
X-Git-Newrev: d2e36fd1fe4ecf056d2cb1bece95d77a68cf3520
X-Patchwork-Hint: ignore
Message-Id: <20211005151559.A5DFF91118@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/cryptopp:
 security bump to version 8.6.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2e36fd1fe4ecf056d2cb1bece95d77a68cf3520
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

This release clears CVE-2021-40530 and fixes a problem with ChaCha20
AVX2 implementation. The CVE was due to ElGamal encryption using a work
estimate to size encryption exponents instead subgroup order. The
ChaCha20 issue was due to mishandling a carry in the AVX2 code path. The
ChaCha20 issue was difficult to duplicate, so most users should not
experience it.

https://github.com/weidai11/cryptopp/releases/tag/CRYPTOPP_8_6_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d714137722eb68273bc736fd4543e768aeaa5dc7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/cryptopp.hash | 4 ++--
 package/cryptopp/cryptopp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 404d8a41ae..9a113b8f04 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release850.html:
-sha512  090472545c74bbf0579b56b09e8b5dcd777b38f29f7199a2e68f45d4a8c687acc82f105ba8b2a38f9aa65e5997a3d846aaf2341ab74d58b4bbfd1f5f03823b93  cryptopp850.zip
+# Hash from: https://www.cryptopp.com/release860.html:
+sha512  e7773f5e4a7dc7e8e735b1702524bee56ba38e5211544c9c9778bc51ed8dc7b376c17f2e406410043b636312336f26f76dc963f298872f8c13933e88c232fc03  cryptopp860.zip
 
 # Hash for license file:
 sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 1d303a67a0..6711a37fbc 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.5.0
+CRYPTOPP_VERSION = 8.6.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

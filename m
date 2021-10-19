Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9197C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2956137D
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B2956137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FE0406DD;
	Tue, 19 Oct 2021 19:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GXWIRFRd2HQ; Tue, 19 Oct 2021 19:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554F8406E3;
	Tue, 19 Oct 2021 19:30:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7B691BF9AC
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7E94608A2
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fb5qGLa6c0na for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 19:30:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3E6960816
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 19:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 44BA887A34; Tue, 19 Oct 2021 19:27:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 21:28:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe6767f7cd4b078f1e0c6699b75291810c16c150
X-Git-Newrev: cbe1b46155b637d695dad1ce060638f23e5f183d
X-Patchwork-Hint: ignore
Message-Id: <20211019192732.44BA887A34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning: don't ignore unrelated
 CVE-2020-7747
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbe1b46155b637d695dad1ce060638f23e5f183d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new CPE ID was assigned by NIST and this whitelist can be
dropped as the package is setup to use the correct CPE (Not
to be confused with the other lightning-* packages which show
up when a free txt search is used to find the CVE.)

This reverts commit 613953f8217bf5b27489e0a939147ef7c74c3f7a.

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lightning/lightning.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index c0036e5cd1..da8c07e61f 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -13,10 +13,6 @@ LIGHTNING_CPE_ID_VENDOR = gnu
 # We're patching include/Makefile.am
 LIGHTNING_AUTORECONF = YES
 
-# CVE-2020-7747 is for the Javascript lightning-server project, and not for
-# GNU Lightning.
-LIGHTNING_IGNORE_CVES = CVE-2020-7747
-
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

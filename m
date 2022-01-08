Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFACC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274C98174C;
	Sat,  8 Jan 2022 18:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNMGWnL5qoC8; Sat,  8 Jan 2022 18:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAA08161D;
	Sat,  8 Jan 2022 18:05:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 384361BF95E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D9C24014C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcw4b2SwH3kF for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58BEC4011F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 938CC832C8; Sat,  8 Jan 2022 17:58:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:04:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3ecd9ea4a40d601317f3b7195be4f5d1bdb3146
X-Git-Newrev: 203f0a917d2f726f7af241025c10663c01ae5c53
X-Patchwork-Hint: ignore
Message-Id: <20220108175845.938CC832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ti-sgx-um: add missing _PROVIDES
 variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=203f0a917d2f726f7af241025c10663c01ae5c53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ti-sgx-um package provides 3 virtual packages, but doesn't have
the TI_SGX_UM_PROVIDES variable. This commit fixes that by adding the
missing variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ti-sgx-um/ti-sgx-um.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index 83dbc6804c..0a1d46c384 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -11,6 +11,7 @@ TI_SGX_UM_SITE_METHOD = git
 TI_SGX_UM_LICENSE = TI TSPA License
 TI_SGX_UM_LICENSE_FILES = TI-Linux-Graphics-DDK-UM-Manifest.doc
 TI_SGX_UM_INSTALL_STAGING = YES
+TI_SGX_UM_PROVIDES = libegl libgles powervr
 TI_SGX_UM_TARGET=ti335x
 
 # ti-sgx-um is a egl/gles provider only if libdrm is installed
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

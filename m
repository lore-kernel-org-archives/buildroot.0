Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE318C77B7F
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 13:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 806AE8476C;
	Thu, 11 May 2023 13:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 806AE8476C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkm8CIdJVaJP; Thu, 11 May 2023 13:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A01678476A;
	Thu, 11 May 2023 13:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A01678476A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 429831BF86C
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BCAB83F4C
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 13:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BCAB83F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsdxbK6azdYI for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 13:11:18 +0000 (UTC)
X-Greylist: delayed 00:06:26 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CC3983CCA
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CC3983CCA
 for <buildroot@buildroot.org>; Thu, 11 May 2023 13:11:18 +0000 (UTC)
Received: from harderbit ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1Mi27T-1qS3AS2BUn-00e1Gj; Thu, 11 May 2023 15:06:13 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 15:06:04 +0200
Message-Id: <20230511130605.60604-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:nCqpDr+W7pO1wZXD0Fvb6uLf08zFR9pFpkvkHJ9rypwwNiCIPlv
 Sl+axDet7EnCRCkAd5UpUSOnQ7acBS2QRiLyRrduKnqbyFBRdNxb3+67ZqDmcPCoSIf2ffO
 59zWAfPP1mJu4h6dVjlqS6R9MzoeKGbwr9zLXBPMWprOvwc34h7MYqkoS5k56a3P7B2Xxbp
 BWKWTBNYlUQS4GlksN8Tw==
UI-OutboundReport: notjunk:1;M01:P0:uxtzkNmGMjo=;bKd3nvlEwSyy+ChBK86Q5mzOtYn
 iqP/Qb2M14f5l1ntH42HlrBvXIBkbovpCR8VF6B/nOYM7/oODjVu0CTQdtl4JBeciwcw0ZagT
 lN2nx0DiklzrK0mTGSlosy9+lgO6HBxCkPL8l/3aPAkfIv5Jhh3kpkQ8lRL7DXGDvwpRpY+hB
 C9//SRr2mpDfk9GXlu5wxyzdBcga8zrfAhqrQX+pj3E3zzd55LJfFqEZV1Mv4YfDpCp+zLQVJ
 /oM8/ZsLllUQRIyk2UUPSgp8gyMnl9gT4pCxX5/VAgUIPtxGcQrPW2L+X60jbm/WBfVRlLMrB
 5lnuZtDT3HT8PR+6aGwHr8OEa7gLuDmSthFPzv77ggK/kF4HAebKGFLFqPnbmne/oRbSLQ0ka
 ZFsq0C5KxwRXiLMDCPTBgR3fg1sAk3L1iodfN5Pz/1cEraEqgAi2zF4U5axtW4+3kuIsLDWBS
 V7tl8+L6/BrUzXUsGZQL30m5qA9WIMhvOqtquM721KOIZp98/nglUA5BRvjzJzWVMD7lKsYK+
 gXh2gcXFaY/AstppmMZghgTwIjwum3l+xrJ06E33TbnX4tb83uKJTR568jW7Eg/gKdWER+3ky
 bIeDXuaiicvMyybVNgKRBJKDHw9fKLe5k8Cs+FwrpMAA0delImtSoHEM3QBCNUcTVJuCjQnxg
 ord7U9MNtBRjC/AhFh5w83d1vTQMQDDQYwCz6+44Nw==
Subject: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.3.1
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index e66bee06d3..7960b594ce 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  968e71a707a4a1961faa6e513b6bba162ef04c3413d7edaba0abc1a5996ae71b  vue-3.2.45.tgz
+sha256  c2e4197818c64d6ad9f344141a8adee354cbc321f63be7eef6802b4b02cf19f3  vue-3.3.1.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index 8f7d0cd3d4..a9058b0d44 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.2.45
+VUEJS_VERSION = 3.3.1
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

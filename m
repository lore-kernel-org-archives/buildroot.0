Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B739FC001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 19:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA238143B;
	Wed, 26 Jul 2023 19:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA238143B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iZN4rE3a_pV; Wed, 26 Jul 2023 19:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 916AF80F00;
	Wed, 26 Jul 2023 19:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 916AF80F00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50AF11BF336
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FE90405DD
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FE90405DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2W5y104kQZO4 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 19:13:31 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4664A4036E
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 19:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4664A4036E
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.165.148]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N6sn7-1pokcw0bUd-018Jsp for <buildroot@buildroot.org>; Wed, 26 Jul 2023
 21:13:29 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 21:11:58 +0200
Message-ID: <20230726191158.24460-2-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:yMWTtanIeIIF/4kwhPqr5l9mbYK7T7bUY2W0CPhkbIhRdnYHIVd
 iDkE1tsqhsC73GRjAjBW46H6iesyk973+BOoCW3jxHefmtYS5J90z24JNF1p88aTqIqm3z4
 C7M6WSnOmbXQPXFbmHPt0fVdEYU3mKzLvbO37Qkp0qoxOAd2pdNfD3CUGvu8EZ/IK0zrpYp
 6iGlnViR5J/NLnM3a2tkg==
UI-OutboundReport: notjunk:1;M01:P0:NMj8ppwv+Zw=;yuYGr5PoHMs3YHrZ5ZMuq968Xb9
 JPrB1/2m8TVt6w4tFiDbVHEZIy6zTz2pHcPuihXOZ6Ix6swOWy6lGT/ckdRBkOlKH2Ri7NDlD
 guclckleHPNt1+0xz2jD6ZliGJHrUo0/nZnaFBjVVIrfv3RUTPOiArtqOyW57K2TqFqZioBCI
 cXP+AVMSTp4mCyyhRuJhAzilzIUdAX3r35E3yuCnJv45nWvCe81tgEwXSDnKG3QL/KgsScjOe
 T7IkwR7tO4+sBtb8sfXBbZF8K+YEkoyzBF2LMz1sMTJd3E5mohAR1kHvcwRY0Pu18Kj3x/GzZ
 oOPs1DgDq8ccIMSnTdb4h3R+vIgfV1jwryuZDc9dahcnvxUYtsqnDnrdrUIHxueX642aS5vHi
 0jjyOwETSclVZfLgVVFdN+AF1/n1cpOylE+21kOprUzTRka/yU/ORDKeyLuhkJZbjqNqH/sY/
 AXileywdFa66nw35AWkbP7sfziefYnJbhCF0IYYViIvnAH6Jmq3RJ/LSuMpxWor/z/gpsuM1Q
 hk6ZJSzQn24gOeHOprk4t7eQHMyMRMRh+JP1w1/kM6xHhLRTGg9/Yh/n7QUhyZWgdt6CBSvSx
 H3sIbrjgrWLSdp/o4XzEJCJxk8SIzEmwlHLFxxpmEuUXIwZ53ueFWUEAG+JBhwmwszMz1pYFA
 MH6leQoWu+JuY34tCXxisuGzT/LBZoURjGxuNNrYrDVt4aEPaCwFQ5dmclZ59cYCDfHZRZzoZ
 Gnl0CNNaC9y/2Q/JQbXx65wFWsecKKIV3e0pYmH5zra9DwjlTXknhj9MPivzpGdYpoWphcXTp
 UzF85e4lQ7zQ/bpSTuHCKf628220/wYPtTPQ6eKJ/pkK2JzXRXm3/B8FAExNcTloqqWN3PuiY
 oXLlGCUPkfj5pmOJuh4lH2tZEKU3X64BmiDsPZ3RuIdSvsCnxzLu2bbxjLnmQpz931SRi8zUv
 1j5egRKotGYvErfGhcNg+3Mvgq4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1690398809; x=1691003609; i=dalang@gmx.at;
 bh=kLVxwoAU9v8+KczyvIwugj9KbeR3rGjTnPNwmj5Ff1s=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=qePm2Ehkw3+nPHxRTWTq5CP2jnQxmNWjWJgNjpzhA9WcyYALruy4obXQQg/8FtmlAlX1q0q
 ETl0Oy0FOYsnwwypp2bhS+wOsUZjIfIexOllwyZC8NJOB4h8/f7rw+vA2T2Brsvr7yMhQnRLx
 h74ozHfDSzEcP/HxqXhru07C3DN7VwfB5ot1/ndsfo3o1wxFxMKu3rFHRMkjaAVOjH1pq2eD9
 vTzOfL+wL369Ih2D6y4xO1R+irwypgPqn65ev5IFKA1MmU2s0e7u5KMpjVZKmNc+gahrd5OO/
 Ip80O2MGnrjubeWjdUUb18W6DQ6VlTFd11SLdYzt+qX7mxPPfZnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=qePm2Ehk
Subject: [Buildroot] [PATCH] package/llvm-project/llvm-libunwind: depends on
 host-llvm-cmake
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

Fixes:
- http://autobuild.buildroot.net/results/e3efaa66f1719db48780f7436f66b56c1f76fd82

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/llvm-project/llvm-libunwind/llvm-libunwind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
index be9965a49a..b293c7ccc2 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -11,6 +11,7 @@ LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
 LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
 LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
 
+HOST_LLVM_LIBUNWIND_DEPENDENCIES = host-llvm-cmake
 HOST_LLVM_LIBUNWIND_CONF_OPTS += \
 	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm" \
 	-DLIBUNWIND_INSTALL_HEADERS=ON
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

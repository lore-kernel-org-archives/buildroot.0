Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5520DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 055AB610CE
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 20:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 055AB610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA93260C2E;
	Tue,  5 Oct 2021 20:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xej-bkRHQSl3; Tue,  5 Oct 2021 20:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A5860C03;
	Tue,  5 Oct 2021 20:06:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11CC81BF2CC
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D2083B91
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 20:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id woaH_diO1WeJ for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 20:06:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D8C683B87
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 20:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633464404;
 bh=bTKe2+IKPn8k1mhKqcTPqm2KqcGGnCS+/umF/lZUOOw=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=H/+aObKwMPU6fNblz+DpEIsF/OIiqMmFm05dlzlK7Jr5MrWR3J4vzubKPSNWwiq9P
 P8SbVi5G96gLIaLMkIcgsMnuL1P2UxNkZ1z0/nK3p2esnE7uH46mAO2yihtoV08daK
 15HrWXTj7fjbLIpsQRaP6xKw76iNhisQJHp25wQo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MDhhX-1mgLZL2wHn-00AoFE for <buildroot@buildroot.org>; Tue, 05 Oct 2021
 22:06:44 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 22:06:44 +0200
Message-Id: <20211005200644.8006-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:JlF25etaBcYKdwCYLTEu66b83q8EWo7jkU6mW8vMWbi4nkOBy8s
 Lxq8Ennfjje468GfFYNMnrkxxENr3t7kuh06Z/l4JqT++6JNACmd4C2cW0lLyBkYtTythZz
 QoIT7PdM+sz/NeaRh9J0dHfXPtPFTl5adNO46McgJUJndygX5coiJJPbxpKgrobBnI6ZxAd
 BYq8L34i1M/KMb6JCjt8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cr+bg5uFKfE=:oys7H4uSqugLBXlrx5K57S
 9MHT5Qjrr8FKfPSSDApMs/I0VpcEBF5hdj8t2K58R5Np1gi9mlgeImIdQEMCYvwFAtRtUoQ41
 lfZbksOZGneGd7CA4qCx6OOGPLdUcmQtEh2mirZoe00urjP23/ZKz8j8CsYVNHwy7YPnSmZYM
 vbIYai2RB2iU2dtOO1IP99IcLWST/qXq8oiTTImZxa++HZD6hZ+DB8H3EVd2rtGlobOlAWMul
 h+0ynHpkCic3cgkXcV9p0yCRIfn4rtgrekDRQAG9Vewp9E0kVuAHbNcnuqGXceo5wgMljkwyN
 Z/2jzgNfYRUV/3FLlsHjPb8nO+qjkWKz9gbaI5EeTMOO8Lb2MkFVWnLDLsFctqE1tnTaLVgoL
 Jv2uCEF6+5955/5C3MczWdecS9OGYx+fT2FpA/LCr4vASVCcgWtw4CmcwiOaDyrMewUPYZMB3
 5HzqPeF1SJUoWUGFR+U8NZo+1wFsdMNhYdp0kZtybyOecYrAQa+9XCQJkWEohWwY10+fRj1Ro
 rG48TDiHRPdsYisyp2F+EMDEQvlj8QA4rEUlFyhTyWdEtxmcrCgp7JteZVKCKU9js0uF3tGI6
 DhNiMaJq22Qw7MjDp53U44biLgcH6FFs1iPTYryEuX9RKvGr/BlChQpoQV7VQBncmMLmE84hB
 5eLpsrDGYKJethRsTvn6wxmlfhDeIJ6InGeb+8dnfymlhPCYPzqNslnHzEdXlIy8d2ymeTOGF
 KJ7mWrOQhKhjL/z1dapV2H9te7J9vnhNSE2PyqBV9Cb+Yv420NRFVFJTnR7cdFsC1jhI0wigG
 o5L02k7iMGVg22Y6VXv6cWtpGb5PP8MFIZbq3+BDVSVPIjC341T/jFv9YKQ9Vhn0cazTFvZbE
 WYCpavj/06/pL5WZdGentXyhA3CFqVu3dzKH7+HQQ5ZleINQ24UdPbfRO9NouvF42c0f4AeG4
 JyB9wdAEjpbb4YeEMWN0Q2AZav3OcxQCLoTIJlIJTGzFfVT8TCGj9R/WXneacAnvP5BOA1hbZ
 sQ6wzS5un6wycTz0qrJ5BQwLlquP2dhcqf9G6tJxFQv8Y/Q9rPdotl6JcNfLgV9QMyot/ovU/
 /GtWlRpXl1y9Yw=
Subject: [Buildroot] [PATCH v1] package/gst1-interpipe: bump version to 1.1.6
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

Changelog (for details see [1]):

  - Fix for memory corruption issue when listening to same node (#99)

[1] https://github.com/RidgeRun/gst-interpipe/releases/tag/1.1.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index a84be7a085..b3fc8ef018 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  4543b2872ee5985679375aa4e588b2dcf8b8c4f61f106655989c89f4aab0d736  gst1-interpipe-1.1.5-br1.tar.gz
+sha256  00d3a91625f6cc5d263f35b9330b4ba6eb40781be2e823231e5b2be9281e1fb4  gst1-interpipe-1.1.6-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index 8d1da080a1..80e5b577f6 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 1.1.5
+GST1_INTERPIPE_VERSION = 1.1.6
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

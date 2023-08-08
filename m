Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B23C04A94
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD8C982062;
	Tue,  8 Aug 2023 18:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD8C982062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WB9EDH_E9N8d; Tue,  8 Aug 2023 18:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB098204E;
	Tue,  8 Aug 2023 18:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CB098204E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D3A31BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75E0A402D4
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E0A402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtfU88kaQdXS for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:46:36 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2AF1401AD
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:46:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2AF1401AD
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MRCOE-1q8d5g2O8K-00N7De; Tue, 08 Aug 2023 20:46:32 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:45:55 +0200
Message-ID: <20230808184555.3787-2-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:VBGHIXW57MPcVdcgPZ2Z6oCaWlJny0bf8p9FeGzeJIOYp7G5vYl
 Rn3Zb7llypfCzRl5sd0cQG4FpRBCik2cpo9KkMOM2QNUv/4FPPFKg1QCqMjShaZmIV1+BuU
 ika2D2IIm3ycNCq7zo3NU9Bzhpvsx5NZzFXRMR3WOFflzvQ8oxWHmRur2ZUr8pr8NhjWVr/
 Z4Q6shXYQ5v0BTCbD8NjA==
UI-OutboundReport: notjunk:1;M01:P0:EBa0gj8NVao=;bXQMRIj+5U0R9WFAwudt0rroBga
 hlT0wsDfPI9NvxtY/3rTMqPKaNHweOqTywmHWGWE2ggF8P1QLHDFbz4wH1qTrA6jIew2XbCg4
 pomjZLE/AbbVOvZpOnpK+pQcBX26T1ndy2h+rwQj+gq9fT5OycTu778yandYTr0zRRtG8scxn
 KcrUuVgLtOVAowgVXRw0VPmi/l1aM90e9NARcHz7DjD0nEDtWZuciZ3pESn+oGDKrJXKKHfZQ
 7VVzXNVgOdQDMGD6dnABG5Cyx7PZV3BdyeNxqycj8ENMAcTnDAXI9bdQC/rzxEVoNg2gVnT+g
 tg9xoZaQ9BIDo5enyDDqkd7GSYWYLWwJe1MytcZNhz/uRENPC0fSy4/q4YdPEmLq6r3eGJUNA
 GjqL27hhFQobxtvhzprmi/ajkeRNuipHku2v7DYp1SskbQjRSx2hQtlAYsJuoXk5taoJGkLd0
 7tUF1c/MRvvJjQMd2NhwZYr2WjGiBlBQ5nxwdNKrSvfTHEXpVP4Iu/5+tCR//lsLyjRn/8ALC
 FaUoldmdqaS57xq5LzyxUrxxtc2O3Z6HVhwpnj98LRM2l/ANgpz0BrkqPVX4tTs7Mh5A1Hh3l
 p7/6y8aZk/u66pSiamc4GPM2rMg9iUOnXhm4sftm4SiiZqJJ7q+jxOzVcIEGCbVVyDk5fFnVL
 5d7DI41BZXbw9F9PaRtDV1F1i2Jvxd4j0IpGKEwSjjQzAnsKbJibSp8d/MOa0hG02p/vndOCL
 PFxypdwTMgN6h0y+iFyngsPagBj6UqOi3dae2H2Y0zH9D3LEEP1vo7KDSqc1QLFBTCh/Z9miQ
 5zIQaFo+cTuGPhuTGpvQeEREAbRCgiHhrSAf13aYoTpLhRSHQthTsS7wwemrhW/VoiNw7xlDC
 PFINqu9kfNp4HyqIhkjtmxaLNkvg3dvBGVUd7PAHqJS1fUdcFYP227BAy0WNFRwp2g8ik9e9W
 2GChqjTeABC5V9ReMxZa8VnGbGw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691520392; x=1692125192; i=dalang@gmx.at;
 bh=VWjeReU2E4/BHLOXSFDXnasuOTfJ7hj9WIyhgdxadQY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=qvSuxy2D55Hn1Td5YVpjd01VVLaOlVPxhSVE997bnV0LxnlBr9puvikt+FqZuVdR9FzEDV5
 SUZpBAjefIylrniyWJzhlKdyQwoE2n9Z+a688inG5LBUT8hsXaQWs2N/J0Z8Ibw7aZVpmSMXz
 zVTqgN07H6dWNiW12k3I6vru0yd6U4ghA5a974No8EWMX0Dzz26H+JqNqKQ6bZsYPjCaxIZ/j
 hDolp6T85rF3dkm7QLf79O43+uBGldO64sK1yTJwy3q6ynnSqSAlmo4x3UAxljJhAX0xVg4c0
 g33327b49MC0cKvfhv9ObhRoK13HYvIR4MDZ0rrieXDz6FquRg2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=qvSuxy2D
Subject: [Buildroot] [PATCH] package/bwm-ng: add CPE ID
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

bwm-ng_project:bwm-ng is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/DBF33404-2CC8-41FD-B0FF-039B27A19871?namingFormat=2.3&orderBy=CPEURI&keyword=bwm-ng&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/bwm-ng/bwm-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index de09eafae5..bf3ed74afc 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -9,6 +9,7 @@ BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPL-2.0+
 BWM_NG_LICENSE_FILES = COPYING
+BWM_NG_CPE_ID_VENDOR = bwm-ng_project
 BWM_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

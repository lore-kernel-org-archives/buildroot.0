Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C16C6FD20
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 19:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B87B140C6C;
	Tue, 21 Mar 2023 19:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B87B140C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1RQ2xHeJcyy; Tue, 21 Mar 2023 19:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DABD40C20;
	Tue, 21 Mar 2023 19:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DABD40C20
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B808B1BF955
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93786400F2
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 19:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93786400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFcxTvIVog9G for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 19:03:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0BA340C6C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0BA340C6C
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 19:03:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.182]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MrhQ6-1qJCXT3U5U-00niRq for <buildroot@buildroot.org>; Tue, 21 Mar 2023
 20:03:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 20:03:03 +0100
Message-Id: <20230321190303.18814-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:a9SGtKWFxaQ+qvNXXzO7jTlDjJom5VK4LsaU3oXjwIRNBqX6Jkz
 paWx4t6IbwjnGqMd+xz7SdsWQmE+De1pbI/gmSej7aVXSoXWRnzx4/aIKvTPMg2BCaqBPMp
 VcYZlz20DOFIPJgMTnYwCcQQJOeLaRo5a4PoyJjZqIHcWDtsjfqwUWKwHT/l+fiAN+EJvLS
 Ty9BsB6UVGTqyE8EDW1uA==
UI-OutboundReport: notjunk:1;M01:P0:9uNKF92lDDE=;ciP5rEL3HEjtT0Jv/cB9qcc1Zz1
 4+EDUmy3oGK/P1NfiBU15ZdpWhFzUUSKogm4HY7I80Eptz17IoHQ7xSkOLRY6GVO5ObFghH+Q
 tBa3yKwR2+Plj6FSpYvlUdc61DGuv5fwS4mzO/PCsidw9pNsOaDaGpouONgCjmJlqLmvhQ1AH
 CXoDVhNANii/j2jlM0r2Zy5mYc/V/pPXlGnnPUzaLke3A557F81Extp+Dk9NSrmK8rfl3lnk/
 1MnbWVZ1LVazK/qqSnBqF05NR0usdZiaP5rSCW4VOw1dL0nPiKXqefrcHzmQCPFBRYGrz+uxM
 bGNA4taVIhbmg9morYyCQ3c3qHgZdKLnsjJ1QI5KZJaQZRwix2c4uv+CO2YhbtbZIMR8jcOp1
 N0kwQSWZROlLNlXmOES8KadKyKKqh8fvrVMh4jC3j7S801906qMIatWxliY6Z2HwDoyiI2GgP
 qlg2KauzXJzYOeLgHJ5Nivo2AoZVTlpvStgVNdu2AacaIGpfgaHV4jhMz2JsPagyQTu6TrFi7
 7u1ivF/ABBZtohPkRgimXpPGoJQcv0+l7v3nkEsVcNDotLFkz2KPc1OESzkoM7+m/7x00dBfA
 Xq7UNGzOZsKAc8gJHdJLhcI5a29GhFLdXr8b0HS/NDrdTutAWIOO0DtBEo6jsm8AZUlt8yoRI
 Pv3YlZ9c9WTpU+NOZP9rKUh+I0lbX+3h6Exg+dkJ9JxPbXK3TQ+shg5WeszpqRmSRSePru8T+
 o0/2uN1OLHPG23MGiLmpAp/Nh17+JjARoI0yGTo5fL0lF7/xBV6jDjMMo0sG3Wlk1yu2Cc2eM
 78MV0Uq8nvUP94LxUDI++2wsz5Jpwrigg0QEfuDQa5uWvwjRkg/xgHi7K6W52o3W4WK1aVf24
 I3AYuCC8xZZKDXxY+0U3tTm624goY/xzJqopNwTB4PNWdp76zawkLzbSL+zw8qUP3TovG6tts
 8tpO9yg2sls5ir5rD3SUwKEfi8s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679425384; i=ps.report@gmx.net;
 bh=qmOtbdDgjZtal4vby7qU7y93/g3G2f49wuz5j4JxPEk=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Jpqu35zXP+hPXif9JGBi1CabOdjZTd/4LUV64okd3P32TvurI8wRpMPEtXsHb/Xyp
 4RgWOCuDwlDIZ/EvlzK4OxxkQZQdAvHmDkWgBhc3K6kVdlc7tsDzR17LUE7Zras00P
 1eemElIBFx7o2Fqo6Z+fTyFjANDqVgNMo5qyq4X4xdzTIWwRpWjwpS8oMf/14tWudo
 GuGZhexRZNrM0YXtq8xRxKPr8hQeWjq2iXzGh0HeBGMcPgc8sttq/YBfnwEi6WVKaq
 R/sqLKGT6dRqf2Lqh+SSEKoWmL9LSaBmYh+HwYZGiGQ4pGaorWum7/bSGQ+HQyNneD
 2Msppw/BKbv5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Jpqu35zX
Subject: [Buildroot] [PATCH v1] package/coreutils: bump version to 9.2
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

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00005.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index eb9a5744c6..72f63b242d 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  61a1f410d78ba7e7f37a5a4f50e6d1320aca33375484a3255eddf17a38580423  coreutils-9.1.tar.xz
+sha256  6885ff47b9cdb211de47d368c17853f406daaf98b148aaecdf10de29cc04b0b3  coreutils-9.2.tar.xz
 # Locally computed
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 931859b0ac..9b07bb31d2 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.1
+COREUTILS_VERSION = 9.2
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

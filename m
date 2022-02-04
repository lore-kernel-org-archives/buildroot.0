Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CCEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9A44177B;
	Fri,  4 Feb 2022 15:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrLZyx1gXflo; Fri,  4 Feb 2022 15:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B130441781;
	Fri,  4 Feb 2022 15:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2477D1C1162
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 129CA404CC
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BurMMuht_sV for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C55F40529
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989593;
 bh=ElrTaDTyKWDZBAK5tnEkPAmnAKMh+WvSS8GVrbKDMnE=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=hcaskQjt7EyPXiYgCj+eHaMNWnpxETPbKi6nliEe4O2HwJIsu1Rlz2vEpxyew6Ix+
 VZqscgSABo0uO4FoDkYpLvlAIYOeDVYDAo47djaM0Tj5iFhqQl0iIGD62Kg0jBX8KO
 t97iTAyzATfurP5/a9MNkdUqr5nsVZ0ZJRpUP0ZY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MPGRp-1mqNpE2U85-00PdoU for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:27 +0100
Message-Id: <20220204154631.17814-9-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bm3LvJ7H9qgohwKq7GH1izWEsQgU5fJzCJWgTdR+TzhxPIpXGFb
 lrnNMtCeWlHnuSUzzTnkg82L93QWnyyEgPvCC5vJq0san1OU6ulHATy23XRt8BxNGhEHATM
 0jJ6zVc3fkQUeoRCy1xqR5pzNhZG+nlMzkTOtdWwF8r5tVG75rUwruxkb63aWgn9301hul8
 rb1fXLFxMC7xDYa8ZRkog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u5uRMQFJVRM=:6AktzjwutVdwjBBJfv4/Sm
 O6Mtmden9kQPRHgBBDH35t2NZFXcHfDCCRAxUBWdIuUMJomdEXt/I9psIIiKAvdRAeUXmR5VM
 us1L4QXeMYmYBnRYHHX23j3Q5aeAizCReynCktqYkkGBJqHsq0hZs3SWDiAnRWM4anHPiOESe
 G3NNn8xn0qNCVWNGiHcpIYaBFiKxXDCzOnt0MCp89xRoToB3Q4s3xqqVzIEt1gJcKhsAix1b8
 Ujb+EAO+pA58wsKC+8TRSYXHe9AdmlnxF4Ww+50wOKzr+ZYntlDCAJQY8yOiCCZWn9kST47CY
 yj/17P5jDqE5hkxMCLVorYSZ24JqNBJS5vytXWC4bzXYPl5MrgOWZFwdqeakTWHC6Tq25IlTM
 XpAFwjMmv9l0Zad6Bk0svELWj4jropJ8zZmPWXODAwLtIY01JSDZ3E64DT5wxg/kq74dELJCS
 U/guVWfUTBKJfmPSJdbT+TKXDeMEqgiTLBqyz0xow9yfUxWcn432ER/4K4c6bSXsnQeJcE+rS
 Q1Lx1Hk5ZrBdrHZn9I97fq8MIPNhaEwQOM+KWheegIu7Rq2p2RliQqY/+jSyNPclee04uWTBK
 oekFn7Mdo/3yeStpl4GVqJ6oEk0Ozq1uad3weUVZV6cjyLlsGTfB/wv0L9FGGpwd2Yy/4oX57
 bUUCJIV0p0iUSSUg1nm1vsC2HFNRoZL4IqoG5eIsear3bfu3C+9nU5zq0t9IXXzz5MV25LDXt
 R6SWdCO6A9JclU3j7F10PJUviA7FcJpJeWFVBHXgTbBrOSNuYg0G6EzLLGVQ+BzYj3UkL1UGp
 8hdlkMz6k4CrlhlNnc7k+UG3kOmPFksLFZ+q7xeEBBmScT0/KAyj2ixk2a8TvZOl0iT4/aDZK
 Y2wYPwx4UVdra2DTAa1iScqoZcy/+I1im1grOGKpeAKfI1VdjHurpGEo8RaXSolpQPy8q1z/G
 n0MnzPRQgRRWxwxWr75OK+5pRDLyb6tSbQ/yTlw/zDF2A1KeAEb18Hpzx2U7zUOnb59/3q4xb
 O5hAR71C1jBiGtqB9PxfJ2hD2XpuFFC8YWn1JSceLu1zOjH84lhsUuaXJuSQ3DkDWttx7wUcx
 X+glx1kZ8KLrvk=
Subject: [Buildroot] [PATCH v1 08/12] package/gst1-vaapi: bump version to
 1.18.6
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
index b0c19fc600..7e22774c11 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.5.tar.xz.sha256sum
-sha256  4a460fb95559f41444eb24864ad2d9e37922b6eea941510310319fc3e0ba727b  gstreamer-vaapi-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.18.6.tar.xz.sha256sum
+sha256  ab6270f1e5e4546fbe6f5ea246d86ca3d196282eb863d46e6cdcc96f867449e0  gstreamer-vaapi-1.18.6.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 9810b12cf7..6af851602f 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VAAPI_VERSION = 1.18.5
+GST1_VAAPI_VERSION = 1.18.6
 GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
 GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
 GST1_VAAPI_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF764C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975D7408F1;
	Thu, 10 Feb 2022 19:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpvK8iICdZ2o; Thu, 10 Feb 2022 19:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF1A40873;
	Thu, 10 Feb 2022 19:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE52E1BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D4C4038E
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3S0WZfHeruUa for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76B14402BC
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521347;
 bh=FkFnXp3J25z0Z3sHc7Svlw7Ayv+eJ6n+kIfNRv5ETMk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=X6RoLirG4cjCk2JVbrfprWdscxDsPAlXJH1asFT+580pnQudgkg6PkOv+Pj7sdm4G
 mG8KGJ6bF5N/ZZpdNMhZnIoOLxtK6mPb1T+kIuOwYUVYAWX5OPRVhiwpekse6fcNKN
 jaZdoMkTx0e96pUVOLkg+YF10vaGrnc+kz2Bld1o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ygO-1nM6Tt1s9O-006AkZ; Thu, 10
 Feb 2022 20:29:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:59 +0100
Message-Id: <20220210192905.4500-8-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4Qb6JAU9roJE6L7UnfwoeBRiZPDNI0OmI5RPtJzUb7UOqXrEJ20
 jBoMUyB2+zYcWlVqH8V7/jK7/tQ7rDcyPQjNpDdV3e0kK7hBw36RjylDlchG8RSwYeOCQwk
 Nvl5J0IPsgBgz+aCsoI1lhKDqu+ihkBMsmCa4iHpYTjUc19VAnhGq94ulQJuRPiFs20R0+c
 Pn56vmGkpT9o6wp2US7fA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zrklLt/q1x0=:dkT4NJpUUD6e2dAB6mXMKm
 YelPDEMS5aoyo4Mfdg+D/8e+tibAVSUnAOMq9vX3fSe0PNlOGjhWa9peWsmA3fyv6GHnvO/e9
 S5YP/kqx7esH5vK419cqINEOHtg7XSl3M5VHOVrASzL6zpfD3hJ3RdcRpV18Cfm3HTYsg9lGU
 g+xOzWpYgBJOkgBQOysFWYFfAsqXOCIziPB4kBdIpjYOxDoyb1VlO+Pj3Dg5IrumCZ7iGSLjS
 yj5us1S1l8VJIBqrO2NyESZXywN5JvS3sTNVfO9tlw0KIV2GzZTC69cIV+FZo+AaeMuB+2XmX
 oJ/btafVmpBr6RcBghsoJRvwXPVOKhC1VbSsSdpG9sPW6+Ejf8iIrL9nxOrasxKKFkClfmFyj
 89wVmCOhsaAIQ6I64FyI0U7p+glRIqfpjBS3JOyuQPzTDwv8tdg1eVMCJWfMD4/gdtSLWvMiB
 xYXDeGZjHcXJa4eyd+ds8s/4pf2pqzRxU8hnQ2tbFksqEWAStH1fUSMH0SmC0gn6juG/OoI+b
 h7sRhp232iiGsAdsOMQbE4ijsHZFo9T0TWNXIRiwCD+oqS2TTqTo6mzM7zDAYybJGWoSxT5zf
 H+bYnutAMmqzXHESorDlRAmQLRLs4OP7vhU9nkOlsuYoxdRDcpgmI7AilXejDbsbH6cTxHb0b
 1X9QD9M1i/N1PjkO9YeP304AJgCOf8m4uhams8a4cNwcCxyNsrRgmeTM5qrD0Gf+f9bCYDaKG
 XWeQNjXyKTPhJ4d7S1osYyARP1ASg88aGYLwpCQXafm+TWTrD72Bq4k5ltID8Xa9vG2vff8Y5
 xwzUA5UtfXLZbzbDKfFO0v/n6Ss0fKDodOjWJsLPFJEhg8g43hC4jgJtHQIR0jK41K25TF80/
 C+gPl0lQFQVrlVJrNdLcmI24HT7W55CmGvPsjQAcF6P/93F1ZfOSQ/jJ0egMyuqpVBl05Wrr1
 rsFzNS4TB/CYWEZ3Ff9wB53/IELzm4rgwWf+7srisTIPQYtvkMvBPkHE/Wnx9XOQVXTYgdOIm
 qlzllaDR2D7B1vDAE0AsyFsKTlb2lQdU+yQA6ESlhg4g1U2BGsmhpMACGPJOnLhsVUa1vNIBc
 tUCSqUy0ErFE8k=
Subject: [Buildroot] [PATCH v2 07/13] package/gst1-libav: bump version to
 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- update COPYING hash (license text update from LGPL-2.0+ to LGPL-2.1+,
  see [1]) and adjust GST1_LIBAV_LICENSE accordingly

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 6 +++---
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 5fb39a0b3e..3204de3c14 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.6.tar.xz.sha256sum
-sha256  e4e50dcd5a29441ae34de60d2221057e8064ed824bb6ca4dc0fd9ee88fbe9b81  gst-libav-1.18.6.tar.xz
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.0.tar.xz.sha256sum
+sha256  5eee5ed8d5082a31b500448e41535c722ee30cd5f8224f32982bbaba2eedef17  gst-libav-1.20.0.tar.xz
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 55c6e06e0e..f07e5061b4 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.18.6
+GST1_LIBAV_VERSION = 1.20.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
-GST1_LIBAV_LICENSE = LGPL-2.0+
+GST1_LIBAV_LICENSE = LGPL-2.1+
 GST1_LIBAV_LICENSE_FILES = COPYING
 GST1_LIBAV_DEPENDENCIES =  host-pkgconf ffmpeg gstreamer1 gst1-plugins-base
 GST1_LIBAV_CONF_OPTS = -Ddoc=disabled
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

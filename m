Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD7AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4A660E63;
	Fri,  4 Feb 2022 15:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6AhZiQ5itqr; Fri,  4 Feb 2022 15:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E8B60E5F;
	Fri,  4 Feb 2022 15:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A94881BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4CB681CEF
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeqE_F5H00Zx for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7734C81CE1
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989593;
 bh=pqNDwUvQ55vkom2zBJg0Qjbc4sHpHdPb4qrOsSc/K0g=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=D4kBA1LtK+8CIl5nJh+VG83TvFWgVhhi7GdC9mTrrYiSGycLANiHvt2xNUTp2IxQF
 EU1HaCnHNqmWgtBg9Uzk9wCB2DlnpZy9A1zHVetZP4DSp4jp/bZxBGZOj0azwtD3F+
 gYtAzlSwH5ZMUBSxXz/BAM/q19E7aUOcofJ36Y7Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MmUHp-1mXugK1jf7-00iTSM for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:26 +0100
Message-Id: <20220204154631.17814-8-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:30lIOkpJ5bg9wQM8Fzo/kwr/0ElVwpYzmRLf8m0dzb6BAehmN2h
 xEXFeqyKYZJZLHKFh7IVHHUn6azziUKCFd9iAQg9SgviqCJNkZnf8QX/F9iSaq3srh5P9ni
 jx+jRVSpIxiexbq11h7IUq8787cn1oJ5Fz3Pr/Wy8Rp967jc3mkQcCcr1wVTr1CuxIkgsbB
 u5FZ8gErRYIrKmPRyT4Rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ypnPzjXS584=:m+qO3Je2/jwMtPNellOK89
 5Hlz6QVXvm757RY9N05F6ra0ULqLAnKQn9JwUOuEdEpxgoAcFvYwy0ae0FoxnbZ52jBrQToic
 E1hDmuWpdiqn+OKdSbyT2gH3IdcILzeS5adU+PyF6E1kpoz0GD8Y0Qdnhl007Zafeeu9lBnh/
 jhqD+7Y4JMdXPlRFmapsxbQiMvO0Cla1Ntd4b2COQTbPgKB+HGq2IOln5NzLZx0NU8NX8Hk54
 b1mXNJiP9kJ4cewcD6mT90Pvoi8GE0dWrWan2+ohg89EaetYe2pIU5w7+y8t0gaEoZWsdhNmM
 xG4GcY+mbhDKA9Z0Mo4/fKVFIvXtAto+om2uXhquyGFH/ZlAkR5N1tDkGIxoMc7Z+ouaRUy/r
 c+4uElcflWnVNN6hPzqKVs3Tv6hT4/9d7pa4PeqKqWthbM8WNdYXfsQWT7kcbo1jKQNUDwX9G
 4TCRsLx/cF3ZIjv3p/frAqKbivscHHEtbcbdVAF5U3b+m+o+CAehHRM+tUMgcN62C9v36zfei
 30ffEsJdGAvJWQdCZzruNjGcKBTxtl/hqu0TnfV+yzCrkMT/hRSvBCqHjVEaZF9SrTWoBjdhX
 tAMDe2PpV9SPj9SKf1YxgaCGHy1vvxSdPYRMcfq52wCmYY+6QzOW42QvWx8oHQo6rp6awcu9D
 JgpHZ8pE3PPgRAPrKQaP6xy9XSXJqlxNZVz5gBZsboddiotk4I4dQ5rT9vzPoOF9I8K8N6h9e
 +i8YKf9m691D3S5UMP0ONMkLOASvMQuzew5s0solu6uZPK7kiRmj9DJYoFcipn4TDRslwR335
 jdKaFtTAamSzDWz/Z45HP39bW8SrUPd3c4wdYB4l1mSAeCv0j3ONSKyuRjMP7QZvkk6Jf9Tvh
 ddcM4NX8TqMbNBL4HPqYcvxVbbmQbOpXrGNNczlCxojC6suxPRhx9zAlk9G7k8vyYKPDcUPMR
 0yNMG/cDZrY4LHxnCo227SfdErI1UdRjJUe/ExfX5GGgPjIsEaHVMGnRDxNMi6XFV0MDRyrKx
 PfbEjqdUSUBcHL2QQNlicINCpNOEp7fzonyg1UE0YaqrSKdizv1w8/nCnF9fMVhVEx3PqB7FC
 W5YQfro/13jnBU=
Subject: [Buildroot] [PATCH v1 07/12] package/gst1-libav: bump version to
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
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 040a6e33f3..5fb39a0b3e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.5.tar.xz.sha256sum
-sha256  822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548  gst-libav-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.18.6.tar.xz.sha256sum
+sha256  e4e50dcd5a29441ae34de60d2221057e8064ed824bb6ca4dc0fd9ee88fbe9b81  gst-libav-1.18.6.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 01ec4d2c98..55c6e06e0e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.18.5
+GST1_LIBAV_VERSION = 1.18.6
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

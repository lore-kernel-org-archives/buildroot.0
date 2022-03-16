Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15467C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4ED840204;
	Wed, 16 Mar 2022 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFYz8ySKL0NV; Wed, 16 Mar 2022 21:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC0940177;
	Wed, 16 Mar 2022 21:36:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0BF01BF9C6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF7D441729
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtC_ZBEkyzES for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF5204171A
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466575;
 bh=NZlwfJLbYpC4lJ1LcVQnBpiVwTwu5TFdFaRx3zGBJEc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=PtAJ+7NCbBRen6comh5iExliQ+9tTz+I/MZHIkcXt42mUaDZKG1/4hP/qa88MEzmf
 V5iTwMVv0IMSBStvPUF06RgyD+FI6spZ/QdqCowBJzVULmZTaRHHFydENMvjEsHmLo
 aoY4WKpWxdrUwiDIkcwZb5RgPSbxOqIfvkrdOWOY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M1psI-1nWnAd2b6G-002EcE for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:15 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:05 +0100
Message-Id: <20220316213614.16878-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:B2iOtwsfuFTorNbgN8GesX0r8aZwyrtnxCgRr0Y8QcVkykV99jc
 pBl62IscrE+dYfZmychKHq1je3rPfLn6iV/NOFHF1tEuTYNvzeeaHPzIGzrGUlJu8kIGK66
 kwQn0kdwaYUYhmioe+Sr65s5P7q6X3DhB4v9zKczlubIzgRl/tt+LL95VcHSVDEltheqEXf
 HLVYVDfrzI/MI3sxKAajQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JJs/Gryrdzo=:cpS5VU/1c10aVf2J3t8XGt
 bbFVfqPRQwS0kItSwVnG2+fjiTsIUMViiZvXVidwZq4UdquC6ik2nLhDj77mnmairTqXoKYq4
 eOpzjFqMP3RJa2l6tWdzbvb+KnZYk6MNUPG5j7P2E2mkPnN2Y+JKIPmKfz7iOFoZMW6VZdKAJ
 vJLw/1UZtaDZ6KcoCa0Wbq/r9XrVWil6Iq1wZpoUp+UMbBQQS1G4U03I16fp76AciCps9mr4B
 ip3IUNaZBjtk8MZ0xv/14e99NnBmjsDZ5qwWCEqETZ2BsiID1FJZt7yUjfQV4UnSdWZfPtRjy
 TgKyIXr0WBL02eh36OBqSgFhLqexiSh7pUhv0CNz0Xl26PhyunRU8UVS53a0h+8oiSJvxzHfw
 /z6STf/C3wzANPVMnas4+dU/k5XEBtg5qxVdw9NSDjswGBU7q1uj+ZnjIKRHTxEthbKr+kK/+
 rH7W8Ci/6edNhcof53ynAp5oywTg4CNTj3DEpdUSEF9YoOm9KsUfEUuZ1YU7v2wf7Z8BZ5M0x
 DFZonFkN326K/5BfRNbu/Ho02U3WXnb8/o126M0fNXwCtR2q3tQTDjWus7dbtPPqDH+4eMBt2
 umNInCnfc7/6QLZMWD0A6u3pF5Se1EjSsBCh1/YUXk370Ztw8HgJ5om8KhkpIIlEGhqrVO+0+
 5j3+GC3zPKHrIvQjIMkDo87cvUt1JaD79vub5zmBn6/IM5tAaDrbGkl2UWhoVLHHp5Bh+W6ww
 n30Amq8bxSMvWnTo+cf1Uxl/gdjv6VJIU0CUXXig3DqXGEqwjztGhJh2sFRMJROaWCD75aUxW
 sVp7aYwVJSaWFv0UTFsDEruCkEolxQCpMvJhmc8ajUaw5+JoJcpEPMS/oxwzP9qtbxMk5q2+h
 Qa+4vzrRGaEY9JsWMi41iMkaNxJns6JIcm0BM1hbPwQ3GNsYd6P07yi7nNtOR0djmb6LnrPHR
 VAB2sXWDP/7srMPDr4irj3DASp/akzm5Xlns4k6GFdhUUOQ3xI6iHumyhm41dECEELIISxCTy
 qcJY6jFC2g7YWI2RiYQr3m8gAfe7z5C/p5G5KYxUtFzOzlAGngxxcJS/URnLOsUI8TTB66gtf
 /JOYu/su6mb8OQ=
Subject: [Buildroot] [PATCH v1 03/12] package/gst1-plugins-good: bump
 version to 1.20.1
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
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 9ad1d7bf46..cccd07dd2d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.0.tar.xz.sha256sum
-sha256  2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a1464991659c  gst-plugins-good-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.1.tar.xz.sha256sum
+sha256  3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa  gst-plugins-good-1.20.1.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 6298d578ed..1168feb293 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.20.0
+GST1_PLUGINS_GOOD_VERSION = 1.20.1
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

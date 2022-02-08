Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF02C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB8460F27;
	Tue,  8 Feb 2022 21:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtHnJHF6c-R0; Tue,  8 Feb 2022 21:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B55D760F29;
	Tue,  8 Feb 2022 21:25:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CA0F1BF9AF
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 336CE81350
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 21:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhXaWgYX16AX for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 21:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E70E38134C
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644355448;
 bh=FkFnXp3J25z0Z3sHc7Svlw7Ayv+eJ6n+kIfNRv5ETMk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DtJFdo0KYopZp6scYL42qYrmjs61DhumzGqJ5UVUV1kgt37Ai7B4VXFdmnvzM3vyh
 sudxNYVL9AsuY4OPCRgBwFb7SHUTzzMUU1TcDQjkXfvUDlCCvfDi9qrvmBOUt4Q2yW
 VmDBLvduv5rjv/CiERKgYJ+E6Gn9VTHKJrnS7IRs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKKX-1nXED83vE9-00Fj9I; Tue, 08
 Feb 2022 22:24:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Feb 2022 22:23:59 +0100
Message-Id: <20220208212405.19243-8-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208212405.19243-1-ps.report@gmx.net>
References: <20220208212405.19243-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ij5ERl4vPSh6gMyvpBlI6jjbKz4kPXUNb5reLYNkKhVjKFIaijX
 GUpEIx0oAT/KwchchU3LNFF8RcCX3aSK82pXUHQfSrs8S0wJAHyOnEa7au7VK5RnaeNqQ8B
 YamSVTwk42lea016KG+2ZQmHb1Wi0sB/72ob7woYu/qXC+dVuJhW+AlMc+QG56eZterluBe
 Pxu+UIHu5FDyINhFsFIDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jHixlC/UvQw=:fivkK7W0DRsyWUULVQY7Iq
 hdi+caXB7QBpaLk35hatTe2PlsmxYHTVrfc5MrLbmAJdRexfC5yHjCwpoKaY7sAUHWMRB1xwG
 v8riy+FeagEqGGOBgsQCgNHaD/lBuNha/1GMr7N4J6x55JlyN0BO816A60z/Mlok2fCoRaVw9
 mLVnymgj3TznwLXyACzEc2ZUqN224DEucL6AZ75QTTIjircOYQX5FFYauv3GykYvPhETyny5R
 MRv/rR9mT2KFVavTeVJ2LNq73rNSnM9dqf1PKoa2Y74vsGksQnzZixGgIyYzBC8/JbF3OeQvP
 nKEXgkNYy++UgF74C7lXZ57wwD00vIio5ggawB2e3ze2hkXA9jN0WsgxodKs4AYRnrU7Y4vSe
 uLEy4eGMkXIUUJiy2sncdEBXAm/1Qh5wz/2gjupDc9Flob7I4N0tHpoICpnTzbgeSWbMj2F/E
 F28Kl3QnGLocWHIRlQ7hUgUreYdt2LcLCLyUi5uN5QYBHG3MndNIXxgqwEtM+yVvzJlFDPqPI
 x2gPKcioceOEq4NLum9hkzb353tx3i8jCvTnScjFAKDOJxKu5HhlH7VfeVO5EMQoabltGEBXW
 6PPYqx2iodNMOVv/cMXn3DndHiAQHNlgsnZLpdpV3asUS7hu2s/J6Tlr76Y8luooZ4Ja3Lte6
 PqokpjVkQYRWhC/yTVNOKl7m3kWcq0PCeOcEDuc6YNBMSfJ6SRPawknsI3qRD1TwNW52rcAf5
 iM+XvKn/CwscW1a2ry8D1fWcRRktopjSdUUZMJcMK/UAhSShdtqRpyJbReNKU+3erfgmTy4nV
 blLXBQnfIkJ2hW4mFTbdyBf14rUvoRbCQxF4bD7ROi+Mou/1tu3iUux6q0jk4hge/X+NBX4Sj
 R62ZFOTXuYg93EFv8LQJyeIYJEGkhRrkARXMLVAlI0hC2NdvDuBKDuPYCI0zVlSq5hYeJIK3/
 5BAng3AGWxYh5KL6TM3nBHWhPIn2mlv0vibxaFhLO45wbtT2NqJG2+5S9AmaMC5I40q8eEfYg
 2Mpf2w4Rqxpa6vR0OUvTDzYXnyi5aukKWlsaAPt9g0WrMxIXEFWX8G0i1DFwSLYbz1qZJwLDN
 CuVRMNAg98mcw8=
Subject: [Buildroot] [PATCH v1 07/13] package/gst1-libav: bump version to
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

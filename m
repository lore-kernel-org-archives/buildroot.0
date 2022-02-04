Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C05C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBFC60AC0;
	Fri,  4 Feb 2022 15:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O368o-wR4FD6; Fri,  4 Feb 2022 15:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC318600B4;
	Fri,  4 Feb 2022 15:48:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9291C116E
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5732B404CC
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJlp1xNof807 for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFF3E405C7
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989593;
 bh=xEk1LHQNyrW9LrvKEorXsjVuuWfYXv7wTL/SkZN4Otk=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=C9dx9M8xFy4NUXi+Jjc+T2T1SyyOdXguPmRoVgm0VV/8VblqbL0HiDhuSOC6yv1DH
 lSAXhlm3ipEMB1X/+kZBMe9jNvw0CsKCXX/2gPMHAFqJ0klPm4IGn+zpTvo5Cn2hbx
 OXYydyd9xAOz3pt9wRg4IbgVFBh3YfW/sugxJvHA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MatRT-1mf19814dH-00cNqK for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:25 +0100
Message-Id: <20220204154631.17814-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xp05PMDpZAi/yJfeFznlHw17xuxGz1rWlZerLg2fZGKx2XIPS44
 0aCQzqQcoDjeM81SPpKplujes+TMU9B7TBM/4snIe+eupSoO9XzEYwEfOGuLCatmfRCu+qe
 O0xSzz/KnIw/ifz4zUQTHEqIwnUbQkriYcbddtmIE4sdGzefWhCmY3QgSadghW6YyqB9fwt
 GBWO+U8PSuZChvs9k8qNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qemd0qGftgc=:Rv1rct3p+C97++TUsxQS2W
 y3KKrUReGUs+wMw+t21woNd5dN2BTSNHnoH2czROYV0tbS8TcHu1W9x9a2G7v0C6AFE//Er0N
 0cr4KtKnBtw4JLDzUS1wEhKa6tnrm0/43DX/c80fYGY/MZIZWtcWkc4bapNfYOw58Jy4ufHXF
 j1/kMnRja9wQl3Nvtkrtq6O+nrjEzKIs2wMtPVmo6VfR3U6TeV3VS+ckap59q0LZuzfRR5G5A
 u3ZP6PCWN7aftAZe1kQgIvUiZMW5V26y6hbltiKdQF6hyIcZ92nNel8G9NkDP1meZwQNg/JCj
 5PLsjIgme0ackWtU/uzxYgfJnWHDYRfQL6Bn78j4kBNX4d0nICJ77lSZrSIembs0Lazu5w0Au
 ZEb1HNXLYBDEsY2gKMJZbazl5MazakMBL9vrlzYJEIZJRVLiDfUvpIZOEd5hbBvXO/pI4cq8E
 Ul4sxewZgYno+TuiUqEQ7XjecRybxERotKDBMOeJCNvThMo5uzivzBM8/P7v3Qri1dyEA/HXx
 Anfy5XYu6KMzGHJ3g8uAyuvczednYwqL3J7rzcrNglgU4oss61bzt1zLwbHH5VMbI4zqzOjuT
 UWFxMQ3spY/zyahEeIWOQd7v4N/qXhgYqWfPc70kEV8BruSSi4N0AR0vNfxvWePX4Yy9W8evw
 Jd7Upoe7Y26r1sSQ4UENyIatqk/+yl2CSxOV2F/SiP6M4+fak2GKz7YE6dtOmEFA8hiXA3V/f
 e5kyOqOgGQPLEro0Zi280lgm/4uDMOk07zzGyHdqyRM5KJpZ2HCrxb8CeJ8QOQW+LqS17UpRD
 H8OU8PXW/O3frAejzRbTo3jvkcFitOJWeH7i60xGXkd5ofFWzP6HhLKlMfgh90st3X05L/dlq
 QeM2dP4itQYWKs0qb5L3sM6EpIbLrnel90K8cCMmZts8J1nIeTv4lYLDId+sxsI3DSszLq1pg
 pC5y+XHs8t+0oZnrifD3WKzPU3kl4EEtYMJbObKZQNZRVusDiLWb974zyPL12+199ZOTzg62B
 UE7yW3sZc1/T7imV3EbQjgKK0l1O1j+/Y7dtcGXucrw5By7Co0O3+5MSSkT4EIyZQK0i+zQj3
 UaAYCGHVmJTXHE=
Subject: [Buildroot] [PATCH v1 06/12] package/gst1-devtools: bump version to
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
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index c19254c195..011385e757 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.5.tar.xz.sha256sum
-sha256  fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079  gst-devtools-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.6.tar.xz.sha256sum
+sha256  3725622c740a635452e54b79d065f963ab7706ca2403de6c43072ae7610a0de4  gst-devtools-1.18.6.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 1c25823953..66b509ae2c 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.5
+GST1_DEVTOOLS_VERSION = 1.18.6
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

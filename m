Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D96DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D320640257;
	Fri,  4 Feb 2022 15:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xM9TR4bTEOKV; Fri,  4 Feb 2022 15:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26C3B40236;
	Fri,  4 Feb 2022 15:48:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 749AB1BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF8A81CFE
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oe8Jyv1Cym_i for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39BE581CD0
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989594;
 bh=Co4KEaY0A+AipsW4bEMLTqFuRdUl3ZralNqbxZXDbFc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=LhpAcvoKDQF69uHyki+b0FKHdNFI6Z7of/gq71qZyeLHtjCfZu0YhMQidcc5IVult
 EwLtjc3ylwcm6iTtIvL8aYStVQDU+fElXCwb3ftIhGiXspldi/WCl1JWraJAfnB2k7
 qDB0rMcujX0z2mTHJnu2a9MbFO1Yt9Cu69lee2bw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MCbEp-1n7WLh13PH-009grw for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:34 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:31 +0100
Message-Id: <20220204154631.17814-13-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xkH3yBb5BgXFkfuiTx6AfmdNfdiR35o5y1d7/dKMf9KdFy7xG+L
 2WjO7bEGtqWcN4d8F4n6FtQCDzA+5gHdGPl9QmAph72o1+CdRW7yHR1+kjjYBjOVOk+zbHZ
 U7UFWlfnP9fj3GcNzNFl0hCoOAKVTMmXdQSAmw7QzA25MJj4EYM4wgP0Hw21OFWBrIe8B68
 RPQYOihSeVwySrJAUNQhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MWn6wLJytOM=:w6skUs2lhV93K9kWv6p+zZ
 UIKccJEbLKrJnR3knJjFT9BbFibQ2IgLrAUFDf2o5X0tWudP8G6w5sY5fmV5l32vGWA0P6rRC
 M5l08FB1TR2KZ+lO+cHWH/vnqYY/H2jn1TL3Ugp3JtRK5Ei/cAU/w82B9bV0bIGwqNoktRJ1m
 jub6vbWGyTfM4MP5HifyTvRxvX0rDbY3h7BP2mRkzTiHTIh3G5ex2WFvnohdWtxagJZLZjJJc
 o8x7/LhJFR/cs34JB0BiBel1m+F0XD6iL5xdLnZU10EDgtzAR54OxNpXUOL+CbgLJe3DtAQRt
 I3rA7/O+z9avA93kZygP3+3QwPkK7Xt0bTLdNsjNZXCeq8DppkrN3vGfGzD/XCoW3bbnEe06w
 /aCEpzlHtZURKmUPwdyo5s+CyiYUuTDJaklxmbTsSxEystyf/rQxj1aDwk7mx20tc80dCLzBV
 yvoDk7lPeo0QPitwww0Zjp5lPu+wYbX7USmgIMX7xGHyPtJ0tVyRAWr645SVSK4QRU5JDIkOT
 45oQQp9piIZVbqaWFbLPMbDwWmi5mulE7zRiHYRPoK5jdD8j2GyevCUkuRkrFoyXKMufjJlJh
 6+89IfQoNoYdMmGQu94PToqk1DWWYhuPO7jamCpZw1ep9s7teg+ox87W4Sm6UmOLhE5cBOVh6
 /KhMiO6lXn1fA9dEcKz2wd7qqeeIuQXJVZ/SMvkgy6oCFxcEqnWm/yLW+GQUPMoX+f7tiNfv/
 uB7enlZPH9frm+GtPIifaQGMNb0lqpPdzDTaUBJOgbcFppb9o3qXOJFeo90CTibNqfl9W7W98
 B3VRVR4+KLKMdx/eUhAnF6J+Ws0SrGbHhgKc0qSXy3qxAaHB7lUo/zF+fD6eZndMBebN3C3A6
 I79kUxnSKw3dPyFkf7HbLWGk6MwSOQv1y5k5pTG2VWnEood0uH7mtgkvCgZZTmoD/HN1DSoOw
 n474bh3tCHPuL/J99Q+cjugPV+tWXkqCvGna3julppFqn2nOn73OrRESfqf9595EZdZuxuBaE
 G9TNcV7Hdtd5PooYO63m/WdumVlvpYz9xP2lUhbs44j/7FfRQuISHN9pYmBefPrjQGUxKUa3G
 R6wYfvfcO/v0/0=
Subject: [Buildroot] [PATCH v1 12/12] package/gst1-python: bump version to
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
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 2035c81fea..a760e53e7d 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.5.tar.xz.sha256sum
-sha256  533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52  gst-python-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.6.tar.xz.sha256sum
+sha256  bdc0ea22fbd7335ad9decc151561aacc53c51206a9735b81eac700ce5b0bbd4a  gst-python-1.18.6.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 614cb22396..7faab752cd 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.18.5
+GST1_PYTHON_VERSION = 1.18.6
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

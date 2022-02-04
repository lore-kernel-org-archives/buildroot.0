Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB41C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 15:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59EE0817AC;
	Fri,  4 Feb 2022 15:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQ0-p0V7Hsze; Fri,  4 Feb 2022 15:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD82181779;
	Fri,  4 Feb 2022 15:47:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 046121BF2A6
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 019174177B
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00dgZ_BvC3dD for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 15:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8C6D41778
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643989593;
 bh=rgK1uFk6cmNHjGa77OWKrxL0v+ajqfKFiw8jtxxLn9M=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=SaQxQmaZvW5S44GYH/S+HZTY4yGWtmDPc1OF64MiQu8T3BgJebF7XoxrKKleESOG/
 krFQL1J/6gQfMMD3LHAAmRrUlxn4PIeO3h61bNR2rT5IMaiNPXIhbYg/pz5aImm6sb
 j3AJ+cL+Uqdfk4lXDE0ilhRznS7Gc//ZUBJUF4Rw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MRmjq-1mnuzr39UQ-00TH7h for <buildroot@buildroot.org>; Fri, 04 Feb 2022
 16:46:33 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 16:46:28 +0100
Message-Id: <20220204154631.17814-10-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204154631.17814-1-ps.report@gmx.net>
References: <20220204154631.17814-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:u4P1p0u4vyxit7I2+8AjpWhwDnLeMSONNDfV++alyfHc6gxt8c6
 L28vaf9SiCUFJM8hRLoqCDsY1RsFVjox227Awx2F+vY4z/QY3mTKlTbaXGrqmfGBcPdjnk7
 ZmdF0rBzkGp1EQ2aeqXz1dzHOaUqfRXYgLH9Hk96U7RXXfjx7BvmYp9FhhL9RCO5acUPyEq
 lwtraFnszgYuxRkAfOUSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6PKr3Uc0dA0=:x+IHv1GheFUsPNb9yd46Tg
 AW+JXnDA8OHrEad2rDAD/olLTGUvHRkfa0+7uV/OiO1JNXWUNFilUMtelwPJ9VyUyfTz+PhgO
 l8FW2S4gqiskMLGCv6ucPxLriWr9vwUnaIfXnib9+Nt9wSRNDIYYdQbFb0bOulPuyIJMrikwy
 XBfClFv05DqxsmcUWyQBSrU9anj3jpnVOmPr5Q4MEsNRS+Q9sqMH1yI4vs77TP0WtZz00Es/1
 N14z0BP7aCqf6h3hXwCndRcERMs3O2HgrVUs+GADl8l7WFNEnzBZbR9wpSrbe6FS8XU1gTxFV
 OX6cbsSaeFAjlIWPqs9Io77PXGZjn7jtKPusFrkfXSY0eS1OOXQK+RE0H/rEWxp0+loBsathW
 +0mxPuLrejdoqPbXb4yEOClHO4nTfanlfSlVsDW67jKfidbEL7mHhwdu+bu9wtVBvEvHs3ijp
 RI0en6/ulhi2GWkrJTltVIJAyxRe4YLr3XmH62sqUWUYIQpBVq9jibQX3JKBbqZBCw4zP5TAN
 Oz3SXAGmnl/yLckiW+vNY7b3JJJw2Yd6PVjaFQHh0mPlTek21RA7dvN8wyOfJgJzrUMQ4ij/V
 KvbbqHI6LEP2NsRHVegQ+5Lyu1n+Aj7FCQoreuXh46wowW/ze6DjoGCv1Ujg2mEVPjtf9BIVx
 UqfPQ1KY1olJ/XCNJXmmwxSoRS+Jn8q2GNH7YridhJg8eAS9VwMUDQX8gJlxi+ZXSYVmNH+a7
 ZLCXZERlJSqxIJv15vvY/DgsYkcz+RNw6aWkiIIZ4ZclvfgqPWxxAsJjppvlAzXq2PC+/wv33
 XLzRFtDW11pmyTFk9wMlD+xbyPhtd9mnaOtKtFNz1RiINqKB1Q9AMQKKeDKzP4V9Ss3kLhqM1
 hyWjicaGaFTMi6Us8e+aJFXhKEw37L6YDwdIB9a08aU8ElBWJgbvsoMX3e2G2+FsCj0smp2vx
 oTYzaau8wjIoDmGZIqXTOLoPcpvIhv7Ia0C6enaZzCgs0Hfuef7dRq56+ftHscBxc3gAdKkb7
 iOXXHkTWf693FzQVRofvH+4rWIDQyJaZjvjTHzv3eO1AY9Xf0WwQQuOAs2/7+SxVEdhKr3elb
 CL/RVz/BjB6MA0=
Subject: [Buildroot] [PATCH v1 09/12] package/gst1-rtsp-server: bump version
 to 1.18.6
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
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 627a451d04..fadef41351 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.5.tar.xz.sha256sum
-sha256  04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f  gst-rtsp-server-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.18.6.tar.xz.sha256sum
+sha256  826f32afbcf94b823541efcac4a0dacdb62f6145ef58f363095749f440262be9  gst-rtsp-server-1.18.6.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 37942423a5..55403754f3 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.18.5
+GST1_RTSP_SERVER_VERSION = 1.18.6
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

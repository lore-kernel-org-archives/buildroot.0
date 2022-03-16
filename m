Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF04C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9298433D;
	Wed, 16 Mar 2022 21:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLkj7c6VRLOe; Wed, 16 Mar 2022 21:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5131C84336;
	Wed, 16 Mar 2022 21:37:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 052F21BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E834A84329
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xcm_0boo6Nz for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF0268433C
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466576;
 bh=5IxhnC+1hO0w7+gHSJwLw9iAIhDjNEc78hRuwjBPM9o=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=LD1yUd17UBDzSMuA+KUxaboP6GAZXGi1G4sB6QrGsqzfEQLrtbAy6T0yAa0Vs3e5t
 AZXKDxi0CRe7Y3kgZElhbtjSAI6WEHABIW1/ifyol2Lwhs2QnULft39BImMh3557J1
 d8A8skLYPueYkEQDKWIU1pvo9jpnOa7FnK7Spcb4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MbAh0-1o67zc2nqy-00bZQw for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:11 +0100
Message-Id: <20220316213614.16878-10-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1aczbVf0xl3qbFPsgBHw2tZ0tfQy5BiNX48vss24qZgoLMn5MDw
 CRPfP/R2nH+o1QYDO2B6hOjqfTV8nem7ZidYfM2wTfSDDpntEbOaYnhrZ3H2hVwNCwjkTow
 Nfh7MdJS/vWKSxUclXaJ0WKbW2jUHZ0dpL1TUzIVDCWhopYn3L7daon71vPfxsqlO6X6AP/
 Gc4/PXgl9eXzX/81Lp/Kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j6jB/m951u0=:yMvXZq4TgGsi5Cc1xpe4vF
 NN/CnnisXThpSY1P988IEViN0OplZqdhn0glDrgwHm7cYu/IDTamtjapeAzZcK44ioKKaURFA
 hMfb1N1P0d1CQW6yUdHxuzYKzmU3ok4cf16NCfBgAtcGBwyjJn5122M3IHHE6Xe0xsiQSyl7E
 r6ASFLpxZGX9aFf885tBUqz5ZhhY09akTQp+3g8DdU59Hiz1I6LVtTgw8s5DauBq6dEarkGpt
 10hymqibPWkqPq3cB7BeH8ceI+rexUjm3ODUW2f2c0hRzplnJoQWCRTk2bCem2oIDu1iMOMTZ
 b+Mxr/VwfTxryF5VwG6VhUxoVeb3WehGjvBM0NcqKLit8Nf1YZODDe7gAx/gFE4+cnxQVTvxf
 mdfNj2rtnDZbpVa6YE8xPS06Czmy6jpFsKWWDrKrglAD7dDDOC3CSPJX2/c493+pjlAK4FG+h
 k5ZlfIUo8JGWrD4exRZu1c+i8aUqjuJYksxjtq0RTN88+63AB3wZEgU6aFC/4IEUVTpQFtqMg
 SqAEYrZpXnXM2OEDTvtsxkXlglxb+WdBnehiOO+WWN2gZDj78yJO6Ho870Uc+22m/40jVgil1
 mv/osnesVYN96PCXWGvYZu6rDkHUMQy9MQhVNMPlHzN4V5tdICG58ma8aO0eXxsOqXMMSR9qO
 sdNFV/O6jId20sp8A1J7AOkomp9G4GoaJRpvt0gfTbs8ugnytzM42OWCD4lszFnMpw878QHF4
 Q5dKQEhy0DxVBnd03mK76fmft/Mx9STE47Cyi+qpQrcHkh0l8TBPK7kT+cPPqoL7/rjhqp7YP
 gwIScvAPkTrw1XFJvQ9NhmLbx7ARpTCWfUelddrIU2VDsVUM4HI/Bvc+35e+XNgOGdrHBugWe
 uLCVetEa7elpF1Gq/RsKpTiGCiP+sFMACPtdfJa7OT2ho8rBW9G6avpc7iNWCQgcFqYy+b44c
 er2HYucczjCj0yxkWcQ/ax3G4ZOie9PdxrCFAaiyl0hIffea6ATSvCRyD6TrZMwseHu5ovVzq
 gfJNFTnqpaPJuITWuepGgWJvfer9tv7pb5cIgijf6U+k97QKQk+tJMr7YxZNgkSsBLoXARpD4
 4qUeGE1Tj1QINA=
Subject: [Buildroot] [PATCH v1 09/12] package/gst1-rtsp-server: bump version
 to 1.20.1
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
index 00ff974c6e..1e66ed7246 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.0.tar.xz.sha256sum
-sha256  c209f5ed906da713fdd44a8844e909aa6c8af3dfb630259b092cfb77a7755843  gst-rtsp-server-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.1.tar.xz.sha256sum
+sha256  4745bc528ad7de711a41d576ddce7412266e66d05c4cfcc636c9ba4da5521509  gst-rtsp-server-1.20.1.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index d22dd5e7cc..978f7b4491 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.20.0
+GST1_RTSP_SERVER_VERSION = 1.20.1
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

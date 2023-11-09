Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747E1C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BDA6420E3;
	Thu,  9 Nov 2023 21:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BDA6420E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJ0P93yDeTgy; Thu,  9 Nov 2023 21:29:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC8B420A1;
	Thu,  9 Nov 2023 21:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC8B420A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03A8B1BF990
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1724614BB
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1724614BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VIIACHtAyoAE for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:29:05 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 052EF61499
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 052EF61499
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.114]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MfYPi-1rckJq0tNg-00g0V5; Thu, 09 Nov 2023 22:29:02 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 22:29:00 +0100
Message-ID: <20231109212901.5596-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231109212901.5596-1-ps.report@gmx.net>
References: <20231109212901.5596-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZQFGOzJBX7Poayy1ikOsbFR08oH1p1qz9m/6lmfpnxOwbNR/gC9
 jbdKYLK1B4faO9dIZxgEk6suRqE+hu559Jh6SVHR1xqJGMcVP+pTGCaa2wNdAwMiFXaY2Fq
 UKHYU0I3KjIdgluKEWkiD5t34Np5T7dUV7M0iEJg9ISWwHWLP2PWXITrMoRPRECs9glwm+s
 LOMgyJTVuJvb98P8q85fg==
UI-OutboundReport: notjunk:1;M01:P0:CdgMGJr6ABQ=;M5tkRdsLLlv5Mv91G2KXZRfv96h
 S3wYtLCNMS/kcpiX+jTvUiw106j8fx4kediyktGPBoAwbbwrFvbHJ5JbbLxEOpkulkhSXkp9I
 XOfOpytGxPAUi0ACaEgExNNi3QcCIx1umxEXY1SugPCImZAOaUK2RPehmVbLpa1KDcYq3vfZh
 3l732/rKtczolIeJxG1TKdIgSDHUcIZ9cV2l0+zgQl9uNMRGiF8xpqU2hVttt66jhwnKFffTm
 m0c5mIBe4P/vxSLsDTr2vq1/IPR9QpZHSZkkkEHSfZ5BbUiIjuSbLt5SODEnTJ1QQxkd2k7FZ
 +0cvvr6Aey6kXz4dv105aElVOX1gSE7t445mcVKAEmtCXdsxoQPfYMRks91JOjdcQTXC7lDf3
 kIlivRHkZh+g2OI8OKUV3RJiiC2WIJ7/ENg6opxE4RFvlZUbDAzQBrDtxPmcd9xVrhykuHR0S
 EFhgiDYp+FzZBKn/WPGAClgLkTp91VC7ND/llI2sn8Fhk/5vxPKjfPGdBwqGoQLWm0gOVVf+d
 TO96qVXsDDUAHp6/54XnwevfFeGbuGX6uXjn7ObRltg0hygz4w6VRXLUOmA/xcYa8sq2fAMBR
 QE8C9UiMh+87p+hSxoSGlhfxAA8IB3QDf4Ves+nNGZlPmJIV0c8RSbcnsiOMS745nshKXe5Tx
 zaDpj9Pl66Untpw3jTptk74lgtKMZyAMgZe9yVG2f5ZPMyGpmR6p4hsRCqfVvxHVDLGOvxdMR
 CmUmUBrG5qnteJDfBy64BmkwWs79sD30C1ET8Ddo322VhBu+niudHUB7+IjIpusNRf3H5ties
 q91Jo7WKM+corwCoe5M9DA4g2F+ihmZdJIfQvqYY2IpdeXSCtgW9mAa54O/8i93aGfloiFpR5
 i29gDViPHFR5x9xT0ahR+zbeSk9xNZvTdhUXCABiS15cG74VA0rFKjHO4MkDGXHqLNkk5xjAa
 LN1v1vLfDI+/rMcRaoGKxLSOEb4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1699565342; x=1700170142; i=ps.report@gmx.net;
 bh=bkKEgwTi1Mq2rhdf48PK+vWV3EeiumMn/obff9fhDzI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=Mr+n6dLbR4YTkP+QOZ53s37jEgTvytOKiMu7VJlhjr3kI0TQGhD3jVAPx0yte8OF
 OIqPAJI0gzmNASGSg0MLvYwLYJCDMQuoLRRbOJpB09BOgF2NZQPbhtL+iq0SjC2YI
 5DvWgOl7d/Be5YwgGJ6GaqFtd8OSlsKfHgBKHGbrOJ4+eoKj2TY2DQ8Vih/4YLv31
 FtGZlMWpHUknkfJpCMtNBQ3Mj3SdISAv1hzeDP5uNh8AFSGk+ozpB+j0Q2GSgsNIZ
 J/yiezwWaZTvOhW02N7D1Wd/6cQbtaWJUTK3s7ru66tjYgr+gNs1NiBmIOMgkYS9Q
 zmQBC4sYwyGsunfnvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Mr+n6dLb
Subject: [Buildroot] [PATCH v1 3/4] package/libcamera: use udev configure
 option
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the udev configure option introduced with upstream commit [1] (since
version v0.1.0).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=d314d3b98b86dec9a25ce7b829e72a790b7ead1b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/libcamera.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8b33b9e708..dd31d90e98 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -98,7 +98,10 @@ LIBCAMERA_DEPENDENCIES += tiff
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBCAMERA_CONF_OPTS += -Dudev=enabled
 LIBCAMERA_DEPENDENCIES += udev
+else
+LIBCAMERA_CONF_OPTS += -Dudev=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

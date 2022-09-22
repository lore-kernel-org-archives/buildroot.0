Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F2FC54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 19:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2443825B9;
	Thu, 22 Sep 2022 19:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2443825B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HY2eyvnbznTI; Thu, 22 Sep 2022 19:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 539C5815CA;
	Thu, 22 Sep 2022 19:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 539C5815CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC3571BF319
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 19:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4BAC400C7
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 19:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4BAC400C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6GZsySAiXde for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 19:13:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90098400A6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90098400A6
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 19:13:54 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.45]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKDU-1pTGeR0HVM-00ykSh
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 21:13:51 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 21:13:50 +0200
Message-Id: <20220922191350.29423-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y9K/TUBNeS38evj3M7099NZ7XDOksmAAJTAJvnlNeH6/xuWB2fJ
 sEHV40fIbSfiAMvwdcrMJFE4+tw+jOu3KUSTtIjTwAmRwfOMNJc7lpgZPbix5vMmIwmfX06
 U9mHqt9tmHa2eP3xlJ30axJj3tAoCz8UvFrCcSoQhXJSNrd/GDWF4ZE0U1sxmScA+/44G2e
 JJFZts4gUBYMp5AbrC+FQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kYWfdPgfv4g=:PvVTpB6opWZWc872ZFyu9d
 DfGKaENm0+CozpKGn6k3MBN2/pIOAxXw4K5s7W2Dy+f8SBIMu0YjBrMR97c2dQowgCmJplrEM
 vwzuB/ew9nQgYFb3I96+tAVNcxQ4zviZr7Wnuoptlib4cCr6gXjPQBDOY8QBg9WPm6YZA6Y1C
 y1KhT+eAzQZKSseXNz/LDmg6eEDzKq1i/is+LsMa1yE0g5MlIg2S5yPIY69hiH57UGT1pnvMz
 cQA/JCs86scD+2zw6QCPdaNLMWNqr1N1Zpxos1gU6QMFhXjNmM3Iu749ISI5F2KvgNHjChiEc
 lxwNwTSGS/Zc6fo0ZSUeCeXwsks2ZGPigK5fVuQOI6nnzoLC52fEEqVgZsiBpLmh23I/0+1v8
 +64qyn25NJyAn0KRBYi0OumP7VCRfCc4PvTZ6G46lEBtHlk7WxAe1Fmz7rH24pV5B3Le357rm
 mncpZQecI2dV3XYzwqQmMDf7RfMa/IFm1CF1YfFxDzh7crGDUiIustuoEu8q2jlIonYRT2RsY
 Lrkeca2nk5MW5E93W3e8NS6LYJREXRu3l7R7AMwyExM2kVqgSpOuJ41Bgps9k/4RZn81NlM5Q
 gpFh4xLaOATVPj71Fc0YyyHbYhwiEz0Sg8Fb0KlbtdReqrS6S/+odP3V4qX65cDsYUQ1sISqV
 TtBhA9ThPpI3f/L5N3ER8Zuqgs5vcDq7ZHhKkojNCW5uk1wGZr5FH+i3r67sYPFvYZIeaJx35
 4HkUjtFySAZFdNz+L7lS72DE9FvyHdSUBT5MVJn0wzGfsBH8K3vodc6/ZC2fCs4T2b5Sd5wEv
 lkV4mnxD+ossITOkKL+qDZQT4JE2lxihhEotKsfYzCvWxWrswGHwBVNt8G9FEumBZxoNX6gJY
 VC1phd8/cdesn0/mDYL1vB5ohaUmnp0Gm9wUp9vZLC+kzrk/8EEosJ8mWwK1FP2mb0+Ps38UH
 TsdugvYj4qZ7/imPNwD9sEGWuYDS091elAAff4oFF+acsrKtpuCb25hi1D/wdoOSIL9PTHo8j
 xNIRloJXs3K1i+K2AiT0BddMQBBB8hwPY+BtdmZj7ixeIEdZhy/yD/8Ral8ePsjXq5tHm3P40
 Zij2i2gPrISvLTUXOwTyH5/8LRxyXxb3XucLF2zdt0BUa6k/AHyXyrRXryQrRTrj7Q4UxGSUy
 a+UVnM7YLSBdyWuH8CzW/elI0o
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1663874031;
 bh=/xrMIDgrzaNr5uaGvVlM5fGRTmFdSbS6z+U3BuWEzxI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=My3yVWFNR6f/G580QvsKOTHLAKxoyn7ZEO1l1md+FC0lEtRXQ/4k3riJLVEQUVZOM
 lfPGS2n/cnodDgwO8pYz+bREt0w00fxWWnLcThj+geJ54dxtepiiTcfOrZGmAB8jue
 w1tUTk/XrjuPqJ9uYt9aHjWbDSGxzYoN6WwTTeTU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=badeba3b8450 header.b=My3yVWFN
Subject: [Buildroot] [PATCH v1] DEVELOPERS: remove Peter Seiderer
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

No review/patches from my side the last few months, so drop my
DEVELOPERS entry.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3de63ea72f..8d0e1282f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2375,41 +2375,6 @@ F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
 
-N:	Peter Seiderer <ps.report@gmx.net>
-F:	board/raspberrypi/
-F:	configs/raspberrypi*_defconfig
-F:	package/assimp/
-F:	package/bcm2835/
-F:	package/ddrescue/
-F:	package/dejavu/
-F:	package/dillo/
-F:	package/double-conversion/
-F:	package/edid-decode/
-F:	package/ell/
-F:	package/ghostscript-fonts/
-F:	package/gstreamer1/gst1-devtools/
-F:	package/gstreamer1/gst1-interpipe/
-F:	package/gstreamer1/gstreamer1-editing-services/
-F:	package/iwd/
-F:	package/libb2/
-F:	package/libcamera-apps/
-F:	package/libevdev/
-F:	package/libuev/
-F:	package/log4cplus/
-F:	package/ntpsec/
-F:	package/postgresql/
-F:	package/python-colorzero/
-F:	package/python-flask-wtf/
-F:	package/python-gpiozero/
-F:	package/qt5/
-F:	package/quotatool/
-F:	package/racehound/
-F:	package/redir/
-F:	package/rtl8812au-aircrack-ng/
-F:	package/uredir/
-F:	package/uqmi/
-F:	package/wayland-utils/
-
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
 F:	package/sdl2_image/
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

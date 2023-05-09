Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C3BC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E99842BA7;
	Tue,  9 May 2023 21:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E99842BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ktbp0o6gcYfP; Tue,  9 May 2023 21:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E578429CA;
	Tue,  9 May 2023 21:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E578429CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF0751BF335
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4EB9429CA
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4EB9429CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AgMor8enf9o7 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 21:08:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B61E14047C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B61E14047C
 for <buildroot@buildroot.org>; Tue,  9 May 2023 21:08:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.90]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MORAU-1pYthY2Ziw-00Pvy1
 for <buildroot@buildroot.org>; Tue, 09 May 2023 23:08:06 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 23:08:05 +0200
Message-Id: <20230509210805.7969-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:1rcymmC1kvGmzoKolqku7W94oQ2cN91pBwVyUhKQpF62o8PAAT/
 +bHd5Hkvda2q3filB74l3zEUQGbuqN4dEukAowLz+pOPswXpJITifApajSeITySRYtD3EP/
 sZoQkb3cdWN9FOuZOm0kT4/SH7U3cwjC7zPRN0fEq8Y8lPxnlE79YOpoIYMmcelyKOQu2HV
 h7b5VkwZm7yqKLs94vgAw==
UI-OutboundReport: notjunk:1;M01:P0:EDQttYDE4Yw=;aIVhF8mGlyLLQaPMEZmRWAEgyRi
 gtMNsjgPLkLTPLSR0xkyd2w8FnNEmoblpA3barmpkcSizmxrTIDgCbDMU9fSjUOK5aHIrKrMw
 6ES97AmmLN3+wKHovSjegfAlv36lqXcWG70TOURDxSk9hUHWUJgIbWYRv/+40FeHWIpdr3I0y
 o8lUaYfJIdsk5+HrrGJxseuB1dZTQB+Kw5XNr5NrC1iz9hos5qL2Kb+rosX+CXjwIzHJ09Ubf
 l4KBFAGadMVuIPtCvVbFXgWHNUfmvmEO7H9RwzkIe+j/N8BHLfTWnVCAlA8emq2w3ACy/YKLQ
 b4+wcNjw5aegrwwSkkzonu6vk7YLd9b5JgRv8/bYEEIKsB+vBtOVcPiUx1d/XUCQEVaLFGIo5
 wk7JhxH71MBg3HaFAQVimQUm4UtK5PGMcc8Y6yuaxBgkhd/uY+sj4kkUWA6wDAoqzvbjhQHv+
 r2NNtBY527T/5wJZGBF4P5MIibe45HifkC2swp5/mpWKV3vOysxs8a/qTHHgn1QRIMiDxhKhE
 UX+PKydJVipEN/8ydTTGLS6NcMxpacdkjBJFCAK7m8aqXhlGO2+5eMeZk3arFeUHndcxE8f3u
 0PE/gboMakmgHwO5XxXSbZtLUvcPwaLFZLJb9PbuIwx2eDX07dI4aLIPnZclT+rm9bGg4OETm
 YTCZqa/S82J2tuSv0oqSY2nojymuMfHRLweTIct4BXjLeiOWQZgPTW476atsCf3RmWsp5nrzg
 iDPTMbBknEZz9df2pRSpu6s7srw5IkzJyx59uqjNsVbOyBKfALg2ur65Jorw3FRoq9W8eUB4X
 j779n0t+PeqFjcJDukteYABxHhk7BIeQxWLPAfAV8fPLyRuGwOV6gj5Aa6stv7QOaiY2m+kNM
 lB800K+4sR6ob05/1/8cHPquQDWcZQYmNi6sAIETQP7KerwtcKDNR1eOcdQlW3RYz9bPt/csT
 C8K027rqIrKV5OPo4Z8d4CMX5Ro=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683666486; i=ps.report@gmx.net;
 bh=RVzJ5B3H5D3L0lF4uXN0ymr16Teh9lkko0AqZIQNByc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=i73Wp0HSe4SfGpRuDG227ucJEFDc4oIO6TNm2Cayj/XUyjgWqWrbdAca5KqgGLz7w
 p1Hsc+lOyiEzqehlPRoG9kFjwbDEpOgMgwgLssDl2HPmGCCCIvy/nOqk3DAv7fyJLM
 T7CWhOs0U6e0E4Kw/kwfPNlTiE3F4hYwAHYn6fUaR2BWxDAaNdvKarfoMHi3E766jO
 sgYFLJ7LJsgUwLvoVTKfBHKCJ4wmwX6ZY92xUdIuDVrFUpKdeFnL8hSDNHfpkLgDH6
 qBHZzFJetRuTPVipkX7lAjuGj9ZF1ycb+Y1IshPs/UMj3akFpSGh6vEnTcP2Jkn2Ch
 mR2k7RgMovlQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=i73Wp0HS
Subject: [Buildroot] [PATCH v1] package/edid-decode: overwrite warning flags
 (fixes gcc-4.8 compile)
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

Overwrite default compiler warning flags to fix gcc-4.8 compile.

Fixes:

  http://autobuild.buildroot.net/results/fff2cadaee1fa8c028ac558e852f7e52b1c8317b

  .../bin/arm-none-linux-gnueabi-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -std=c++11  -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -Wimplicit-fallthrough -g -DSHA= -DDATE= -o edid-decode.o -c edid-decode.cpp
  arm-none-linux-gnueabi-g++: error: unrecognized command line option '-Wimplicit-fallthrough'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/edid-decode/edid-decode.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 247ed207d3..cc9f2c1629 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -12,7 +12,7 @@ EDID_DECODE_LICENSE_FILES = LICENSE
 
 define EDID_DECODE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11" WARN_FLAGS=
 endef
 
 define EDID_DECODE_INSTALL_TARGET_CMDS
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

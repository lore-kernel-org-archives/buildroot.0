Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF6CC10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C2C8608CD;
	Mon,  6 May 2024 14:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtGYXOzPWix6; Mon,  6 May 2024 14:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 186B3608E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 186B3608E7;
	Mon,  6 May 2024 14:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA6B21BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B564C81DEA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-y5JoeroIhL for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79D1F8202A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D1F8202A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79D1F8202A
 for <buildroot@busybox.net>; Mon,  6 May 2024 14:45:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPog5-1sHxzD2IXT-00MwzR
 for <buildroot@busybox.net>; Mon, 06 May 2024 16:45:56 +0200
To: buildroot@busybox.net
Date: Mon,  6 May 2024 16:45:48 +0200
Message-ID: <20240506144555.31709-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506144555.31709-1-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:82sMfeVngZ0p6oYNsM8pbpP9wkSlQiPLYWJik/14VfuUzL2NGom
 v6VqVNVe9CHpQz/s39yXDa3tiUdAFP2RR2MjFYhKW9JXxTou2319hyhrjYpknp8c/05MBPM
 YR4ZhsekMK4Ixo8/7J7N9eD+94eupOf39kD3uA0xKw20e2l7GwsfpXDEJd6jJcB0HIPnwQv
 F/AJR1gG9J5Lu78Fodzgg==
UI-OutboundReport: notjunk:1;M01:P0:K/2XShLupiA=;wA11vkNnGbVuok9nP6OdRTtNPIC
 rV0+di+yzn0/0gIa+g4klGDVaq0BI8KWfMNS6R1TYHDedHRVuAe6w1Iyjhmc7MsRgU1Gxsnxo
 8FV1IMfnx7BqaksvVbC4z6cdO8Ut4crsuDx1vYg32Pl6kKKvq6oBTRFKW9ccLF+ZZzUwzi3sp
 WtO9kgH3lNtGXucks1q2mEc53NFPixo+eSsq9iQZMc1osJ7MXuqPLmzvbA8gGUh1VlgAycRAy
 pOcaqW5LioLoEuKI2F06fwSZUjKyH/RKFJ3DtJqtD+ulDhsM8Q1V9voqUcON+da9LdP4STRf3
 H29Wugd/pqfgdlHoL4a0zJ2/HWvlvpzx4o0xdnCOJ10r2eP2WA3FkiKIHgoMqjHx1Q4K4o/V0
 gLIZePfTIXQrYvpqQQisoPVFz191y3G6FBGAKnAy2zfKZyQV3tkg6XRrIeQV4G5AfMBaRjbw6
 i6wtm9rwsBJsvsuvbTqeH3+rh4YzjWAxli5DRYHMJsxSPczQUK704RZwA0xWqlEDhUy6tlzqs
 EO7v3VIAo5JpZtMcpt5E47t4ytG+aOIvPpNnC4gnvrE1h8q0vncjIyD6SieHWl9osHCiFk3Ns
 AbgtzItwefy8jWgHZtuqMRbW4vHKX62ZmU5npGjIlu7Zu2k2ppl6THiYXzdCWOdTyH5pMtFDk
 vTuPUAjAX/HXYlu2btMOEb56L01YCuBUh1yBl3K5pgZRquxiN1l9ccH8dZCiQCtokSFV/nmMt
 +Y4Ic5LgLmpoIJGUwS3mhnPop6+jK8atpW9K2GUwlCSf5pq/zW+tI1rM33gwUsmhcAI+02bBT
 G4WTfxQNJkjz43tSBMpE98eqBcelHxR3dZKG9vEV2G5sc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715006756; x=1715611556; i=ps.report@gmx.net;
 bh=pTgF9T+hSoFs6Sy42zyKLz1n4bI9FIZ3xZLI+cWxgQY=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LMvC1E/kwjXnjowVcvCSYamssH2yxYPBNsgZd2QPmzNbyHuoLuzV3vY8x31Ma7co
 7bhZXgGtDczS2JKnyfo/NyifVUfRuKft64X8COej1X87Y0OTCPtp+FNMR72pZc2V+
 gAvZR7OPAEUcfub7f+mF/oiT+NjhPuBuJNi9VA5o7KI60tzlWrufFdLzUbV35pqJn
 lpgAW0dYvb7plkLEqgvcSLY1TFBbjrh6gz+QLkCkcuBA+x3z9G3UvaOAVZfC9rrdQ
 xYPMoFPIK54VGqtjtImEKMJkOjgPLlXadfUCFSUTJ7nuCbFc1UW0MDJA8dHNtsMvw
 1qV4dhhtKGHNu8n+Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=LMvC1E/k
Subject: [Buildroot] [PATCH v1 5/8] package/x11r7/Config.in: source argument
 needs quotation marks
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/x11r7/Config.in:14: syntax error
  package/x11r7/Config.in:14:warning: ignoring unsupported character '/'
  package/x11r7/Config.in:14:warning: ignoring unsupported character '/'
  package/x11r7/Config.in:14:warning: ignoring unsupported character '/'
  package/x11r7/Config.in:14:warning: ignoring unsupported character '.'
  package/x11r7/Config.in:14: invalid statement
  [...]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/x11r7/Config.in | 420 ++++++++++++++++++++--------------------
 1 file changed, 210 insertions(+), 210 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index b91f97bb34..0002dfe598 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -11,232 +11,232 @@ menuconfig BR2_PACKAGE_XORG7
 
 if BR2_PACKAGE_XORG7
 	menu "X11R7 Servers"
-		source package/x11r7/xserver_xorg-server/Config.in
-		source package/x11r7/xwayland/Config.in
+		source "package/x11r7/xserver_xorg-server/Config.in"
+		source "package/x11r7/xwayland/Config.in"
 	endmenu
 	menu "X11R7 Libraries"
-		source package/x11r7/libxcb/Config.in
-		source package/x11r7/xcb-util/Config.in
-		source package/x11r7/xcb-util-cursor/Config.in
-		source package/x11r7/xcb-util-image/Config.in
-		source package/x11r7/xcb-util-keysyms/Config.in
-		source package/x11r7/xcb-util-renderutil/Config.in
-		source package/x11r7/xcb-util-wm/Config.in
-		source package/x11r7/xlib_libFS/Config.in
-		source package/x11r7/xlib_libICE/Config.in
-		source package/x11r7/xlib_libSM/Config.in
-		source package/x11r7/xlib_libX11/Config.in
-		source package/x11r7/xlib_libXScrnSaver/Config.in
-		source package/x11r7/xlib_libXau/Config.in
-		source package/x11r7/xlib_libXaw/Config.in
-		source package/x11r7/xlib_libXcomposite/Config.in
-		source package/x11r7/xlib_libXcursor/Config.in
-		source package/x11r7/xlib_libXdamage/Config.in
-		source package/x11r7/xlib_libXdmcp/Config.in
-		source package/x11r7/xlib_libXext/Config.in
-		source package/x11r7/xlib_libXfixes/Config.in
-		source package/x11r7/xlib_libXfont/Config.in
-		source package/x11r7/xlib_libXfont2/Config.in
-		source package/x11r7/xlib_libXft/Config.in
-		source package/x11r7/xlib_libXi/Config.in
-		source package/x11r7/xlib_libXinerama/Config.in
-		source package/x11r7/xlib_libXmu/Config.in
-		source package/x11r7/xlib_libXpm/Config.in
-		source package/x11r7/xlib_libXpresent/Config.in
-		source package/x11r7/xlib_libXrandr/Config.in
-		source package/x11r7/xlib_libXrender/Config.in
-		source package/x11r7/xlib_libXres/Config.in
-		source package/x11r7/xlib_libXt/Config.in
-		source package/x11r7/xlib_libXtst/Config.in
-		source package/x11r7/xlib_libXv/Config.in
-		source package/x11r7/xlib_libXvMC/Config.in
-		source package/x11r7/xlib_libXxf86dga/Config.in
-		source package/x11r7/xlib_libXxf86vm/Config.in
-		source package/x11r7/xlib_libdmx/Config.in
-		source package/x11r7/xlib_libfontenc/Config.in
-		source package/x11r7/xlib_libxcvt/Config.in
-		source package/x11r7/xlib_libxkbfile/Config.in
-		source package/x11r7/xlib_libxshmfence/Config.in
-		source package/x11r7/xlib_xtrans/Config.in
+		source "package/x11r7/libxcb/Config.in"
+		source "package/x11r7/xcb-util/Config.in"
+		source "package/x11r7/xcb-util-cursor/Config.in"
+		source "package/x11r7/xcb-util-image/Config.in"
+		source "package/x11r7/xcb-util-keysyms/Config.in"
+		source "package/x11r7/xcb-util-renderutil/Config.in"
+		source "package/x11r7/xcb-util-wm/Config.in"
+		source "package/x11r7/xlib_libFS/Config.in"
+		source "package/x11r7/xlib_libICE/Config.in"
+		source "package/x11r7/xlib_libSM/Config.in"
+		source "package/x11r7/xlib_libX11/Config.in"
+		source "package/x11r7/xlib_libXScrnSaver/Config.in"
+		source "package/x11r7/xlib_libXau/Config.in"
+		source "package/x11r7/xlib_libXaw/Config.in"
+		source "package/x11r7/xlib_libXcomposite/Config.in"
+		source "package/x11r7/xlib_libXcursor/Config.in"
+		source "package/x11r7/xlib_libXdamage/Config.in"
+		source "package/x11r7/xlib_libXdmcp/Config.in"
+		source "package/x11r7/xlib_libXext/Config.in"
+		source "package/x11r7/xlib_libXfixes/Config.in"
+		source "package/x11r7/xlib_libXfont/Config.in"
+		source "package/x11r7/xlib_libXfont2/Config.in"
+		source "package/x11r7/xlib_libXft/Config.in"
+		source "package/x11r7/xlib_libXi/Config.in"
+		source "package/x11r7/xlib_libXinerama/Config.in"
+		source "package/x11r7/xlib_libXmu/Config.in"
+		source "package/x11r7/xlib_libXpm/Config.in"
+		source "package/x11r7/xlib_libXpresent/Config.in"
+		source "package/x11r7/xlib_libXrandr/Config.in"
+		source "package/x11r7/xlib_libXrender/Config.in"
+		source "package/x11r7/xlib_libXres/Config.in"
+		source "package/x11r7/xlib_libXt/Config.in"
+		source "package/x11r7/xlib_libXtst/Config.in"
+		source "package/x11r7/xlib_libXv/Config.in"
+		source "package/x11r7/xlib_libXvMC/Config.in"
+		source "package/x11r7/xlib_libXxf86dga/Config.in"
+		source "package/x11r7/xlib_libXxf86vm/Config.in"
+		source "package/x11r7/xlib_libdmx/Config.in"
+		source "package/x11r7/xlib_libfontenc/Config.in"
+		source "package/x11r7/xlib_libxcvt/Config.in"
+		source "package/x11r7/xlib_libxkbfile/Config.in"
+		source "package/x11r7/xlib_libxshmfence/Config.in"
+		source "package/x11r7/xlib_xtrans/Config.in"
 	endmenu
 	menu "X11R7 Applications"
-		source package/x11r7/xapp_appres/Config.in
-		source package/x11r7/xapp_bdftopcf/Config.in
-		source package/x11r7/xapp_beforelight/Config.in
-		source package/x11r7/xapp_bitmap/Config.in
-		source package/x11r7/xapp_editres/Config.in
-		source package/x11r7/xapp_fonttosfnt/Config.in
-		source package/x11r7/xapp_fslsfonts/Config.in
-		source package/x11r7/xapp_fstobdf/Config.in
-		source package/x11r7/xapp_iceauth/Config.in
-		source package/x11r7/xapp_ico/Config.in
-		source package/x11r7/xapp_listres/Config.in
-		source package/x11r7/xapp_luit/Config.in
-		source package/x11r7/xapp_mkfontscale/Config.in
-		source package/x11r7/xapp_oclock/Config.in
-		source package/x11r7/xapp_rgb/Config.in
-		source package/x11r7/xapp_rstart/Config.in
-		source package/x11r7/xapp_scripts/Config.in
-		source package/x11r7/xapp_sessreg/Config.in
-		source package/x11r7/xapp_setxkbmap/Config.in
-		source package/x11r7/xapp_showfont/Config.in
-		source package/x11r7/xapp_smproxy/Config.in
-		source package/x11r7/xapp_twm/Config.in
-		source package/x11r7/xapp_viewres/Config.in
-		source package/x11r7/xapp_x11perf/Config.in
-		source package/x11r7/xapp_xauth/Config.in
-		source package/x11r7/xapp_xbacklight/Config.in
-		source package/x11r7/xapp_xbiff/Config.in
-		source package/x11r7/xapp_xcalc/Config.in
-		source package/x11r7/xapp_xclipboard/Config.in
-		source package/x11r7/xapp_xclock/Config.in
-		source package/x11r7/xapp_xcmsdb/Config.in
-		source package/x11r7/xapp_xcompmgr/Config.in
-		source package/x11r7/xapp_xconsole/Config.in
-		source package/x11r7/xapp_xcursorgen/Config.in
-		source package/x11r7/xapp_xdbedizzy/Config.in
-		source package/x11r7/xapp_xditview/Config.in
-		source package/x11r7/xapp_xdm/Config.in
-		source package/x11r7/xapp_xdpyinfo/Config.in
-		source package/x11r7/xapp_xdriinfo/Config.in
-		source package/x11r7/xapp_xedit/Config.in
-		source package/x11r7/xapp_xev/Config.in
-		source package/x11r7/xapp_xeyes/Config.in
-		source package/x11r7/xapp_xf86dga/Config.in
-		source package/x11r7/xapp_xfd/Config.in
-		source package/x11r7/xapp_xfindproxy/Config.in
-		source package/x11r7/xapp_xfontsel/Config.in
-		source package/x11r7/xapp_xfs/Config.in
-		source package/x11r7/xapp_xfsinfo/Config.in
-		source package/x11r7/xapp_xgamma/Config.in
-		source package/x11r7/xapp_xgc/Config.in
-		source package/x11r7/xapp_xhost/Config.in
-		source package/x11r7/xapp_xinit/Config.in
-		source package/x11r7/xapp_xinput/Config.in
-		source package/x11r7/xapp_xinput-calibrator/Config.in
-		source package/x11r7/xapp_xkbcomp/Config.in
-		source package/x11r7/xapp_xkbevd/Config.in
-		source package/x11r7/xapp_xkbprint/Config.in
-		source package/x11r7/xapp_xkbutils/Config.in
-		source package/x11r7/xapp_xkill/Config.in
-		source package/x11r7/xapp_xload/Config.in
-		source package/x11r7/xapp_xlogo/Config.in
-		source package/x11r7/xapp_xlsatoms/Config.in
-		source package/x11r7/xapp_xlsclients/Config.in
-		source package/x11r7/xapp_xlsfonts/Config.in
-		source package/x11r7/xapp_xmag/Config.in
-		source package/x11r7/xapp_xman/Config.in
-		source package/x11r7/xapp_xmessage/Config.in
-		source package/x11r7/xapp_xmh/Config.in
-		source package/x11r7/xapp_xmodmap/Config.in
-		source package/x11r7/xapp_xmore/Config.in
-		source package/x11r7/xapp_xpr/Config.in
-		source package/x11r7/xapp_xprop/Config.in
-		source package/x11r7/xapp_xrandr/Config.in
-		source package/x11r7/xapp_xrdb/Config.in
-		source package/x11r7/xapp_xrefresh/Config.in
-		source package/x11r7/xapp_xset/Config.in
-		source package/x11r7/xapp_xsetmode/Config.in
-		source package/x11r7/xapp_xsetpointer/Config.in
-		source package/x11r7/xapp_xsetroot/Config.in
-		source package/x11r7/xapp_xsm/Config.in
-		source package/x11r7/xapp_xstdcmap/Config.in
-		source package/x11r7/xapp_xvidtune/Config.in
-		source package/x11r7/xapp_xvinfo/Config.in
-		source package/x11r7/xapp_xwd/Config.in
-		source package/x11r7/xapp_xwininfo/Config.in
-		source package/x11r7/xapp_xwud/Config.in
+		source "package/x11r7/xapp_appres/Config.in"
+		source "package/x11r7/xapp_bdftopcf/Config.in"
+		source "package/x11r7/xapp_beforelight/Config.in"
+		source "package/x11r7/xapp_bitmap/Config.in"
+		source "package/x11r7/xapp_editres/Config.in"
+		source "package/x11r7/xapp_fonttosfnt/Config.in"
+		source "package/x11r7/xapp_fslsfonts/Config.in"
+		source "package/x11r7/xapp_fstobdf/Config.in"
+		source "package/x11r7/xapp_iceauth/Config.in"
+		source "package/x11r7/xapp_ico/Config.in"
+		source "package/x11r7/xapp_listres/Config.in"
+		source "package/x11r7/xapp_luit/Config.in"
+		source "package/x11r7/xapp_mkfontscale/Config.in"
+		source "package/x11r7/xapp_oclock/Config.in"
+		source "package/x11r7/xapp_rgb/Config.in"
+		source "package/x11r7/xapp_rstart/Config.in"
+		source "package/x11r7/xapp_scripts/Config.in"
+		source "package/x11r7/xapp_sessreg/Config.in"
+		source "package/x11r7/xapp_setxkbmap/Config.in"
+		source "package/x11r7/xapp_showfont/Config.in"
+		source "package/x11r7/xapp_smproxy/Config.in"
+		source "package/x11r7/xapp_twm/Config.in"
+		source "package/x11r7/xapp_viewres/Config.in"
+		source "package/x11r7/xapp_x11perf/Config.in"
+		source "package/x11r7/xapp_xauth/Config.in"
+		source "package/x11r7/xapp_xbacklight/Config.in"
+		source "package/x11r7/xapp_xbiff/Config.in"
+		source "package/x11r7/xapp_xcalc/Config.in"
+		source "package/x11r7/xapp_xclipboard/Config.in"
+		source "package/x11r7/xapp_xclock/Config.in"
+		source "package/x11r7/xapp_xcmsdb/Config.in"
+		source "package/x11r7/xapp_xcompmgr/Config.in"
+		source "package/x11r7/xapp_xconsole/Config.in"
+		source "package/x11r7/xapp_xcursorgen/Config.in"
+		source "package/x11r7/xapp_xdbedizzy/Config.in"
+		source "package/x11r7/xapp_xditview/Config.in"
+		source "package/x11r7/xapp_xdm/Config.in"
+		source "package/x11r7/xapp_xdpyinfo/Config.in"
+		source "package/x11r7/xapp_xdriinfo/Config.in"
+		source "package/x11r7/xapp_xedit/Config.in"
+		source "package/x11r7/xapp_xev/Config.in"
+		source "package/x11r7/xapp_xeyes/Config.in"
+		source "package/x11r7/xapp_xf86dga/Config.in"
+		source "package/x11r7/xapp_xfd/Config.in"
+		source "package/x11r7/xapp_xfindproxy/Config.in"
+		source "package/x11r7/xapp_xfontsel/Config.in"
+		source "package/x11r7/xapp_xfs/Config.in"
+		source "package/x11r7/xapp_xfsinfo/Config.in"
+		source "package/x11r7/xapp_xgamma/Config.in"
+		source "package/x11r7/xapp_xgc/Config.in"
+		source "package/x11r7/xapp_xhost/Config.in"
+		source "package/x11r7/xapp_xinit/Config.in"
+		source "package/x11r7/xapp_xinput/Config.in"
+		source "package/x11r7/xapp_xinput-calibrator/Config.in"
+		source "package/x11r7/xapp_xkbcomp/Config.in"
+		source "package/x11r7/xapp_xkbevd/Config.in"
+		source "package/x11r7/xapp_xkbprint/Config.in"
+		source "package/x11r7/xapp_xkbutils/Config.in"
+		source "package/x11r7/xapp_xkill/Config.in"
+		source "package/x11r7/xapp_xload/Config.in"
+		source "package/x11r7/xapp_xlogo/Config.in"
+		source "package/x11r7/xapp_xlsatoms/Config.in"
+		source "package/x11r7/xapp_xlsclients/Config.in"
+		source "package/x11r7/xapp_xlsfonts/Config.in"
+		source "package/x11r7/xapp_xmag/Config.in"
+		source "package/x11r7/xapp_xman/Config.in"
+		source "package/x11r7/xapp_xmessage/Config.in"
+		source "package/x11r7/xapp_xmh/Config.in"
+		source "package/x11r7/xapp_xmodmap/Config.in"
+		source "package/x11r7/xapp_xmore/Config.in"
+		source "package/x11r7/xapp_xpr/Config.in"
+		source "package/x11r7/xapp_xprop/Config.in"
+		source "package/x11r7/xapp_xrandr/Config.in"
+		source "package/x11r7/xapp_xrdb/Config.in"
+		source "package/x11r7/xapp_xrefresh/Config.in"
+		source "package/x11r7/xapp_xset/Config.in"
+		source "package/x11r7/xapp_xsetmode/Config.in"
+		source "package/x11r7/xapp_xsetpointer/Config.in"
+		source "package/x11r7/xapp_xsetroot/Config.in"
+		source "package/x11r7/xapp_xsm/Config.in"
+		source "package/x11r7/xapp_xstdcmap/Config.in"
+		source "package/x11r7/xapp_xvidtune/Config.in"
+		source "package/x11r7/xapp_xvinfo/Config.in"
+		source "package/x11r7/xapp_xwd/Config.in"
+		source "package/x11r7/xapp_xwininfo/Config.in"
+		source "package/x11r7/xapp_xwud/Config.in"
 	endmenu
 	if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	menu "X11R7 Drivers"
-		source package/x11r7/xdriver_xf86-input-evdev/Config.in
-		source package/x11r7/xdriver_xf86-input-joystick/Config.in
-		source package/x11r7/xdriver_xf86-input-libinput/Config.in
-		source package/x11r7/xdriver_xf86-input-mouse/Config.in
-		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
-		source package/x11r7/xdriver_xf86-input-tslib/Config.in
-		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
-		source package/x11r7/xdriver_xf86-video-amdgpu/Config.in
-		source package/x11r7/xdriver_xf86-video-ark/Config.in
-		source package/x11r7/xdriver_xf86-video-ast/Config.in
-		source package/x11r7/xdriver_xf86-video-ati/Config.in
-		source package/x11r7/xdriver_xf86-video-cirrus/Config.in
-		source package/x11r7/xdriver_xf86-video-dummy/Config.in
-		source package/x11r7/xdriver_xf86-video-fbdev/Config.in
-		source package/x11r7/xdriver_xf86-video-fbturbo/Config.in
-		source package/x11r7/xdriver_xf86-video-geode/Config.in
-		source package/x11r7/xdriver_xf86-video-i128/Config.in
-		source package/x11r7/xdriver_xf86-video-imx/Config.in
-		source package/x11r7/xdriver_xf86-video-intel/Config.in
-		source package/x11r7/xdriver_xf86-video-mach64/Config.in
-		source package/x11r7/xdriver_xf86-video-mga/Config.in
-		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
-		source package/x11r7/xdriver_xf86-video-nouveau/Config.in
-		source package/x11r7/xdriver_xf86-video-nv/Config.in
-		source package/x11r7/xdriver_xf86-video-openchrome/Config.in
-		source package/x11r7/xdriver_xf86-video-qxl/Config.in
-		source package/x11r7/xdriver_xf86-video-r128/Config.in
-		source package/x11r7/xdriver_xf86-video-savage/Config.in
-		source package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
-		source package/x11r7/xdriver_xf86-video-sis/Config.in
-		source package/x11r7/xdriver_xf86-video-tdfx/Config.in
-		source package/x11r7/xdriver_xf86-video-trident/Config.in
-		source package/x11r7/xdriver_xf86-video-vesa/Config.in
-		source package/x11r7/xdriver_xf86-video-vmware/Config.in
-		source package/x11r7/xdriver_xf86-video-voodoo/Config.in
+		source "package/x11r7/xdriver_xf86-input-evdev/Config.in"
+		source "package/x11r7/xdriver_xf86-input-joystick/Config.in"
+		source "package/x11r7/xdriver_xf86-input-libinput/Config.in"
+		source "package/x11r7/xdriver_xf86-input-mouse/Config.in"
+		source "package/x11r7/xdriver_xf86-input-synaptics/Config.in"
+		source "package/x11r7/xdriver_xf86-input-tslib/Config.in"
+		source "package/x11r7/xdriver_xf86-input-vmmouse/Config.in"
+		source "package/x11r7/xdriver_xf86-video-amdgpu/Config.in"
+		source "package/x11r7/xdriver_xf86-video-ark/Config.in"
+		source "package/x11r7/xdriver_xf86-video-ast/Config.in"
+		source "package/x11r7/xdriver_xf86-video-ati/Config.in"
+		source "package/x11r7/xdriver_xf86-video-cirrus/Config.in"
+		source "package/x11r7/xdriver_xf86-video-dummy/Config.in"
+		source "package/x11r7/xdriver_xf86-video-fbdev/Config.in"
+		source "package/x11r7/xdriver_xf86-video-fbturbo/Config.in"
+		source "package/x11r7/xdriver_xf86-video-geode/Config.in"
+		source "package/x11r7/xdriver_xf86-video-i128/Config.in"
+		source "package/x11r7/xdriver_xf86-video-imx/Config.in"
+		source "package/x11r7/xdriver_xf86-video-intel/Config.in"
+		source "package/x11r7/xdriver_xf86-video-mach64/Config.in"
+		source "package/x11r7/xdriver_xf86-video-mga/Config.in"
+		source "package/x11r7/xdriver_xf86-video-neomagic/Config.in"
+		source "package/x11r7/xdriver_xf86-video-nouveau/Config.in"
+		source "package/x11r7/xdriver_xf86-video-nv/Config.in"
+		source "package/x11r7/xdriver_xf86-video-openchrome/Config.in"
+		source "package/x11r7/xdriver_xf86-video-qxl/Config.in"
+		source "package/x11r7/xdriver_xf86-video-r128/Config.in"
+		source "package/x11r7/xdriver_xf86-video-savage/Config.in"
+		source "package/x11r7/xdriver_xf86-video-siliconmotion/Config.in"
+		source "package/x11r7/xdriver_xf86-video-sis/Config.in"
+		source "package/x11r7/xdriver_xf86-video-tdfx/Config.in"
+		source "package/x11r7/xdriver_xf86-video-trident/Config.in"
+		source "package/x11r7/xdriver_xf86-video-vesa/Config.in"
+		source "package/x11r7/xdriver_xf86-video-vmware/Config.in"
+		source "package/x11r7/xdriver_xf86-video-voodoo/Config.in"
 	endmenu
 	endif
 	menu "X11R7 Fonts"
-		source package/x11r7/xfont_font-util/Config.in
-		source package/x11r7/xfont_encodings/Config.in
-		source package/x11r7/xfont_font-adobe-100dpi/Config.in
-		source package/x11r7/xfont_font-adobe-75dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in
-		source package/x11r7/xfont_font-adobe-utopia-type1/Config.in
-		source package/x11r7/xfont_font-alias/Config.in
-		source package/x11r7/xfont_font-arabic-misc/Config.in
-		source package/x11r7/xfont_font-bh-100dpi/Config.in
-		source package/x11r7/xfont_font-bh-75dpi/Config.in
-		source package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in
-		source package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in
-		source package/x11r7/xfont_font-bh-ttf/Config.in
-		source package/x11r7/xfont_font-bh-type1/Config.in
-		source package/x11r7/xfont_font-bitstream-100dpi/Config.in
-		source package/x11r7/xfont_font-bitstream-75dpi/Config.in
-		source package/x11r7/xfont_font-bitstream-type1/Config.in
-		source package/x11r7/xfont_font-cronyx-cyrillic/Config.in
-		source package/x11r7/xfont_font-cursor-misc/Config.in
-		source package/x11r7/xfont_font-daewoo-misc/Config.in
-		source package/x11r7/xfont_font-dec-misc/Config.in
-		source package/x11r7/xfont_font-ibm-type1/Config.in
-		source package/x11r7/xfont_font-isas-misc/Config.in
-		source package/x11r7/xfont_font-jis-misc/Config.in
-		source package/x11r7/xfont_font-micro-misc/Config.in
-		source package/x11r7/xfont_font-misc-cyrillic/Config.in
-		source package/x11r7/xfont_font-misc-ethiopic/Config.in
-		source package/x11r7/xfont_font-misc-meltho/Config.in
-		source package/x11r7/xfont_font-misc-misc/Config.in
-		source package/x11r7/xfont_font-mutt-misc/Config.in
-		source package/x11r7/xfont_font-schumacher-misc/Config.in
-		source package/x11r7/xfont_font-screen-cyrillic/Config.in
-		source package/x11r7/xfont_font-sony-misc/Config.in
-		source package/x11r7/xfont_font-sun-misc/Config.in
-		source package/x11r7/xfont_font-winitzki-cyrillic/Config.in
-		source package/x11r7/xfont_font-xfree86-type1/Config.in
+		source "package/x11r7/xfont_font-util/Config.in"
+		source "package/x11r7/xfont_encodings/Config.in"
+		source "package/x11r7/xfont_font-adobe-100dpi/Config.in"
+		source "package/x11r7/xfont_font-adobe-75dpi/Config.in"
+		source "package/x11r7/xfont_font-adobe-utopia-100dpi/Config.in"
+		source "package/x11r7/xfont_font-adobe-utopia-75dpi/Config.in"
+		source "package/x11r7/xfont_font-adobe-utopia-type1/Config.in"
+		source "package/x11r7/xfont_font-alias/Config.in"
+		source "package/x11r7/xfont_font-arabic-misc/Config.in"
+		source "package/x11r7/xfont_font-bh-100dpi/Config.in"
+		source "package/x11r7/xfont_font-bh-75dpi/Config.in"
+		source "package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/Config.in"
+		source "package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/Config.in"
+		source "package/x11r7/xfont_font-bh-ttf/Config.in"
+		source "package/x11r7/xfont_font-bh-type1/Config.in"
+		source "package/x11r7/xfont_font-bitstream-100dpi/Config.in"
+		source "package/x11r7/xfont_font-bitstream-75dpi/Config.in"
+		source "package/x11r7/xfont_font-bitstream-type1/Config.in"
+		source "package/x11r7/xfont_font-cronyx-cyrillic/Config.in"
+		source "package/x11r7/xfont_font-cursor-misc/Config.in"
+		source "package/x11r7/xfont_font-daewoo-misc/Config.in"
+		source "package/x11r7/xfont_font-dec-misc/Config.in"
+		source "package/x11r7/xfont_font-ibm-type1/Config.in"
+		source "package/x11r7/xfont_font-isas-misc/Config.in"
+		source "package/x11r7/xfont_font-jis-misc/Config.in"
+		source "package/x11r7/xfont_font-micro-misc/Config.in"
+		source "package/x11r7/xfont_font-misc-cyrillic/Config.in"
+		source "package/x11r7/xfont_font-misc-ethiopic/Config.in"
+		source "package/x11r7/xfont_font-misc-meltho/Config.in"
+		source "package/x11r7/xfont_font-misc-misc/Config.in"
+		source "package/x11r7/xfont_font-mutt-misc/Config.in"
+		source "package/x11r7/xfont_font-schumacher-misc/Config.in"
+		source "package/x11r7/xfont_font-screen-cyrillic/Config.in"
+		source "package/x11r7/xfont_font-sony-misc/Config.in"
+		source "package/x11r7/xfont_font-sun-misc/Config.in"
+		source "package/x11r7/xfont_font-winitzki-cyrillic/Config.in"
+		source "package/x11r7/xfont_font-xfree86-type1/Config.in"
 	endmenu
 	menu "X11R7 X protocols"
-		source package/x11r7/xcb-proto/Config.in
-		source package/x11r7/xorgproto/Config.in
+		source "package/x11r7/xcb-proto/Config.in"
+		source "package/x11r7/xorgproto/Config.in"
 	endmenu
 	menu "X11R7 Utilities"
-		source package/x11r7/xutil_makedepend/Config.in
-		source package/x11r7/mcookie/Config.in
+		source "package/x11r7/xutil_makedepend/Config.in"
+		source "package/x11r7/mcookie/Config.in"
 	endmenu
 	menu "X11R7 Other data"
-		source package/x11r7/xdata_xbitmaps/Config.in
-		source package/x11r7/xdata_xcursor-themes/Config.in
-		source package/x11r7/xcursor-transparent-theme/Config.in
+		source "package/x11r7/xdata_xbitmaps/Config.in"
+		source "package/x11r7/xdata_xcursor-themes/Config.in"
+		source "package/x11r7/xcursor-transparent-theme/Config.in"
 	endmenu
 endif
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

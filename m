Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C89C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB2F60B4E;
	Thu,  8 Dec 2022 22:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CB2F60B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yChF8KghmYhF; Thu,  8 Dec 2022 22:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441BA60B2F;
	Thu,  8 Dec 2022 22:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441BA60B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 147391BF969
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A85C60B08
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A85C60B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDjHbnX-RRWF for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD13160A8D
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD13160A8D
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:25 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout08.t-online.de (Postfix) with SMTP id D45A913758
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PWz-0XYn570; Thu, 8 Dec 2022 23:38:17 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PWz-00048i-0h
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:37:07 +0100
Message-Id: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539097-E77DC07E-B2629B75/0/0 CLEAN NORMAL
X-TOI-MSGID: 781c4079-b5bf-478e-9dc3-ef2be80b9325
Subject: [Buildroot] [PATCH 00/70] package/x11r7: various version bumps
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

Hi,

this series bumps various X11 packages and, when needed, switches the
tarball to xz format and updates _SITE to https.

Also two broken X11 drivers for ancient hardware are removed.

Regards, Bernd

Bernd Kuhls (70):
  package/x11r7/xdriver_xf86-input-mouse: bump version to 1.9.4
  package/x11r7/xlib_libICE: bump version to 1.1.1
  package/x11r7/xlib_libxshmfence: bump version to 1.3.2
  package/x11r7/xlib_libxkbfile: bump version to 1.1.2
  package/x11r7/xlib_libfontenc: bump version to 1.1.7
  package/x11r7/xlib_libXau: bump version to 1.0.11
  package/x11r7/xapp_xkbcomp: bump version to 1.4.6
  package/x11r7/xlib_libXxf86dga: bump version to 1.1.6
  package/x11r7/xlib_libXv: bump version to 1.0.12
  package/x11r7/xlib_libXScrnSaver: bump version to 1.2.4
  package/x11r7/xlib_libXres: bump version to 1.2.2
  package/x11r7/xlib_libXdamage: bump version to 1.1.6
  package/x11r7/xlib_libXcomposite: bump version to 0.4.6
  package/x11r7/xdriver_xf86-video-r128: bump version to 6.12.1
  package/x11r7/xapp_xvinfo: bump version to 1.1.5
  package/x11r7/xapp_xstdcmap: bump version to 1.0.5
  package/x11r7/xapp_xset: bump version to 1.2.5
  package/x11r7/xapp_xrandr: bump version to 1.5.2
  package/x11r7/xapp_xprop: bump version to 1.2.6
  package/x11r7/xapp_xinit: bump version to 1.4.2
  package/x11r7/xapp_xgamma: bump version to 1.0.7
  package/x11r7/xapp_xfd: bump version to 1.1.4
  package/x11r7/xapp_xdm: bump version to 1.1.14
  package/x11r7/xapp_xcursorgen: bump version to 1.0.8
  package/x11r7/xlib_libXrandr: bump version to 1.5.3
  package/x11r7/xlib_libXpm: bump version to 3.5.14
  package/x11r7/xlib_libXdmcp: bump version to 1.1.4
  package/x11r7/xapp_xlsclients: bump version to 1.1.5
  package/x11r7/xapp_xlsatoms: bump version to 1.1.4
  package/x11r7/xapp_xlogo: bump version to 1.0.6
  package/x11r7/xapp_xkill: bump version to 1.0.6
  package/x11r7/xapp_xkbevd: bump version to 1.1.5
  package/x11r7/xapp_xcompmgr: bump version to 1.1.9
  package/x11r7/xlib_libX11: bump version to 1.8.2
  package/x11r7/xapp_sessreg: bump version to 1.1.3
  package/x11r7/xapp_rgb: bump version to 1.1.0
  package/x11r7/xlib_libXinerama: bump version to 1.1.5
  package/x11r7/xutil_makedepend: bump version to 1.0.7
  package/x11r7/xapp_x11perf: bump version to 1.6.2
  package/x11r7/xlib_libXext: bump version to 1.3.5
  package/x11r7/xapp_xsetroot: bump version to 1.1.3
  package/x11r7/xlib_libXrender: bump version to 0.9.11
  package/x11r7/xapp_xfsinfo: bump version to 1.0.7
  package/x11r7/xcb-util-wm: bump version to 0.4.2
  package/x11r7/xcb-util-renderutil: bump version to 0.3.10
  package/x11r7/xcb-util-keysyms: bump version to 0.4.1
  package/x11r7/xcb-util-image: bump version to 0.4.1
  package/x11r7/xcb-util-cursor: bump version to 0.1.4
  package/x11r7/xlib_libXmu: bump version to 1.1.4
  package/x11r7/xapp_bdftopcf: bump version to 1.1.1
  package/x11r7/xapp_xkbprint: bump version to 1.0.6
  package/x11r7/xapp_xgc: bump version to 1.0.6
  package/x11r7/xapp_xditview: bump version to 1.0.6
  package/x11r7/xapp_viewres: bump version to 1.0.7
  package/x11r7/xapp_smproxy: bump version to 1.0.7
  package/x11r7/xdriver_xf86-input-vmmouse: bump version to 13.2.0
  package/x11r7/xapp_fstobdf: bump version to 1.0.7
  package/x11r7/xlib_libXtst: bump version to 1.2.4
  package/x11r7/xlib_libXxf86vm: bump version to 1.1.5
  package/x11r7/xapp_fslsfonts: bump version to 1.0.6
  package/x11r7/xlib_libXft: bump version to 2.3.6
  package/x11r7/xapp_xmh: bump version to 1.0.4
  package/x11r7/xapp_showfont: bump version to 1.0.6
  package/x11r7/xapp_oclock: bump version to 1.0.5
  package/x11r7/xapp_ico: bump version to 1.0.6
  package/x11r7/xlib_libXfont2: bump version to 2.0.6
  package/x11r7/xlib_libFS: bump version to 1.0.9
  package/x11r7/xorgproto: bump version to 2022.2
  package/x11r7/xdriver_xf86-video-glint: remove package
  package/x11r7/xdriver_xf86-video-tga: remove package

 Config.in.legacy                              | 12 +++++
 package/x11r7/Config.in                       |  2 -
 .../x11r7/xapp_bdftopcf/xapp_bdftopcf.hash    |  9 ++--
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk  |  6 +--
 .../x11r7/xapp_fslsfonts/xapp_fslsfonts.hash  |  5 +-
 .../x11r7/xapp_fslsfonts/xapp_fslsfonts.mk    |  6 +--
 package/x11r7/xapp_fstobdf/xapp_fstobdf.hash  |  5 +-
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk    |  6 +--
 package/x11r7/xapp_ico/xapp_ico.hash          |  8 ++--
 package/x11r7/xapp_ico/xapp_ico.mk            |  6 +--
 package/x11r7/xapp_oclock/xapp_oclock.hash    |  8 ++--
 package/x11r7/xapp_oclock/xapp_oclock.mk      |  6 +--
 package/x11r7/xapp_rgb/xapp_rgb.hash          |  5 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk            |  6 +--
 package/x11r7/xapp_sessreg/xapp_sessreg.hash  |  8 ++--
 package/x11r7/xapp_sessreg/xapp_sessreg.mk    |  4 +-
 .../x11r7/xapp_showfont/xapp_showfont.hash    |  5 +-
 package/x11r7/xapp_showfont/xapp_showfont.mk  |  6 +--
 package/x11r7/xapp_smproxy/xapp_smproxy.hash  |  5 +-
 package/x11r7/xapp_smproxy/xapp_smproxy.mk    |  6 +--
 package/x11r7/xapp_viewres/xapp_viewres.hash  |  8 ++--
 package/x11r7/xapp_viewres/xapp_viewres.mk    |  6 +--
 package/x11r7/xapp_x11perf/xapp_x11perf.hash  |  8 ++--
 package/x11r7/xapp_x11perf/xapp_x11perf.mk    |  6 +--
 .../x11r7/xapp_xcompmgr/xapp_xcompmgr.hash    |  8 ++--
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk  |  6 +--
 .../xapp_xcursorgen/xapp_xcursorgen.hash      |  8 ++--
 .../x11r7/xapp_xcursorgen/xapp_xcursorgen.mk  |  6 +--
 .../x11r7/xapp_xditview/xapp_xditview.hash    |  8 ++--
 package/x11r7/xapp_xditview/xapp_xditview.mk  |  6 +--
 package/x11r7/xapp_xdm/Config.in              |  1 -
 package/x11r7/xapp_xdm/xapp_xdm.hash          |  6 +--
 package/x11r7/xapp_xdm/xapp_xdm.mk            | 12 +++--
 package/x11r7/xapp_xfd/xapp_xfd.hash          |  8 ++--
 package/x11r7/xapp_xfd/xapp_xfd.mk            |  6 +--
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.hash  |  8 ++--
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk    |  6 +--
 package/x11r7/xapp_xgamma/xapp_xgamma.hash    |  5 +-
 package/x11r7/xapp_xgamma/xapp_xgamma.mk      |  6 +--
 package/x11r7/xapp_xgc/xapp_xgc.hash          |  5 +-
 package/x11r7/xapp_xgc/xapp_xgc.mk            |  6 +--
 package/x11r7/xapp_xinit/xapp_xinit.hash      |  8 ++--
 package/x11r7/xapp_xinit/xapp_xinit.mk        |  6 +--
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash  |  7 ++-
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk    |  4 +-
 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash    |  5 +-
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk      |  6 +--
 .../x11r7/xapp_xkbprint/xapp_xkbprint.hash    |  8 ++--
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk  |  6 +--
 package/x11r7/xapp_xkill/xapp_xkill.hash      |  8 ++--
 package/x11r7/xapp_xkill/xapp_xkill.mk        |  6 +--
 package/x11r7/xapp_xlogo/xapp_xlogo.hash      |  8 ++--
 package/x11r7/xapp_xlogo/xapp_xlogo.mk        |  6 +--
 .../x11r7/xapp_xlsatoms/xapp_xlsatoms.hash    |  8 ++--
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk  |  6 +--
 .../xapp_xlsclients/xapp_xlsclients.hash      |  8 ++--
 .../x11r7/xapp_xlsclients/xapp_xlsclients.mk  |  6 +--
 package/x11r7/xapp_xmh/xapp_xmh.hash          |  5 +-
 package/x11r7/xapp_xmh/xapp_xmh.mk            |  6 +--
 package/x11r7/xapp_xprop/xapp_xprop.hash      |  6 +--
 package/x11r7/xapp_xprop/xapp_xprop.mk        |  6 +--
 package/x11r7/xapp_xrandr/xapp_xrandr.hash    |  8 ++--
 package/x11r7/xapp_xrandr/xapp_xrandr.mk      |  4 +-
 package/x11r7/xapp_xset/xapp_xset.hash        |  8 ++--
 package/x11r7/xapp_xset/xapp_xset.mk          |  6 +--
 .../x11r7/xapp_xsetroot/xapp_xsetroot.hash    |  8 ++--
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk  |  6 +--
 .../x11r7/xapp_xstdcmap/xapp_xstdcmap.hash    |  8 ++--
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk  |  6 +--
 package/x11r7/xapp_xvinfo/xapp_xvinfo.hash    |  8 ++--
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk      |  6 +--
 .../xcb-util-cursor/xcb-util-cursor.hash      |  5 +-
 .../x11r7/xcb-util-cursor/xcb-util-cursor.mk  |  6 +--
 .../x11r7/xcb-util-image/xcb-util-image.hash  |  5 +-
 .../x11r7/xcb-util-image/xcb-util-image.mk    |  6 +--
 .../xcb-util-keysyms/xcb-util-keysyms.hash    |  7 ++-
 .../xcb-util-keysyms/xcb-util-keysyms.mk      | 10 ++--
 .../xcb-util-renderutil.hash                  |  5 +-
 .../xcb-util-renderutil.mk                    |  6 +--
 package/x11r7/xcb-util-wm/xcb-util-wm.hash    |  5 +-
 package/x11r7/xcb-util-wm/xcb-util-wm.mk      |  6 +--
 .../xdriver_xf86-input-mouse.hash             |  8 ++--
 .../xdriver_xf86-input-mouse.mk               |  6 +--
 .../xdriver_xf86-input-vmmouse.hash           |  5 +-
 .../xdriver_xf86-input-vmmouse.mk             |  6 +--
 .../x11r7/xdriver_xf86-video-glint/Config.in  | 10 ----
 .../xdriver_xf86-video-glint.hash             |  4 --
 .../xdriver_xf86-video-glint.mk               | 14 ------
 .../xdriver_xf86-video-r128.hash              |  8 ++--
 .../xdriver_xf86-video-r128.mk                |  6 +--
 .../0001-mibstore.patch                       | 47 -------------------
 .../x11r7/xdriver_xf86-video-tga/Config.in    |  5 --
 .../xdriver_xf86-video-tga.hash               |  4 --
 .../xdriver_xf86-video-tga.mk                 | 14 ------
 package/x11r7/xlib_libFS/xlib_libFS.hash      |  8 ++--
 package/x11r7/xlib_libFS/xlib_libFS.mk        |  6 +--
 package/x11r7/xlib_libICE/xlib_libICE.hash    |  8 ++--
 package/x11r7/xlib_libICE/xlib_libICE.mk      |  4 +-
 package/x11r7/xlib_libX11/xlib_libX11.hash    |  8 ++--
 package/x11r7/xlib_libX11/xlib_libX11.mk      |  2 +-
 .../xlib_libXScrnSaver.hash                   |  8 ++--
 .../xlib_libXScrnSaver/xlib_libXScrnSaver.mk  |  6 +--
 package/x11r7/xlib_libXau/xlib_libXau.hash    |  8 ++--
 package/x11r7/xlib_libXau/xlib_libXau.mk      |  4 +-
 .../xlib_libXcomposite.hash                   |  8 ++--
 .../xlib_libXcomposite/xlib_libXcomposite.mk  |  6 +--
 .../xlib_libXdamage/xlib_libXdamage.hash      |  8 ++--
 .../x11r7/xlib_libXdamage/xlib_libXdamage.mk  |  6 +--
 .../x11r7/xlib_libXdmcp/xlib_libXdmcp.hash    |  8 ++--
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk  |  6 +--
 package/x11r7/xlib_libXext/xlib_libXext.hash  | 10 ++--
 package/x11r7/xlib_libXext/xlib_libXext.mk    |  6 +--
 .../x11r7/xlib_libXfont2/xlib_libXfont2.hash  |  6 +--
 .../x11r7/xlib_libXfont2/xlib_libXfont2.mk    |  4 +-
 package/x11r7/xlib_libXft/xlib_libXft.hash    |  6 +--
 package/x11r7/xlib_libXft/xlib_libXft.mk      |  4 +-
 .../xlib_libXinerama/xlib_libXinerama.hash    |  8 ++--
 .../xlib_libXinerama/xlib_libXinerama.mk      |  6 +--
 package/x11r7/xlib_libXmu/xlib_libXmu.hash    | 10 ++--
 package/x11r7/xlib_libXmu/xlib_libXmu.mk      |  6 +--
 package/x11r7/xlib_libXpm/xlib_libXpm.hash    |  8 ++--
 package/x11r7/xlib_libXpm/xlib_libXpm.mk      |  6 +--
 .../x11r7/xlib_libXrandr/xlib_libXrandr.hash  |  8 ++--
 .../x11r7/xlib_libXrandr/xlib_libXrandr.mk    |  6 +--
 .../xlib_libXrender/xlib_libXrender.hash      |  6 +--
 .../x11r7/xlib_libXrender/xlib_libXrender.mk  |  6 +--
 package/x11r7/xlib_libXres/xlib_libXres.hash  |  7 ++-
 package/x11r7/xlib_libXres/xlib_libXres.mk    |  6 +--
 package/x11r7/xlib_libXtst/xlib_libXtst.hash  |  5 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk    |  6 +--
 package/x11r7/xlib_libXv/xlib_libXv.hash      |  6 +--
 package/x11r7/xlib_libXv/xlib_libXv.mk        |  4 +-
 .../xlib_libXxf86dga/xlib_libXxf86dga.hash    |  8 ++--
 .../xlib_libXxf86dga/xlib_libXxf86dga.mk      |  4 +-
 .../xlib_libXxf86vm/xlib_libXxf86vm.hash      |  7 ++-
 .../x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk  |  6 +--
 .../xlib_libfontenc/xlib_libfontenc.hash      |  8 ++--
 .../x11r7/xlib_libfontenc/xlib_libfontenc.mk  |  4 +-
 .../xlib_libxkbfile/xlib_libxkbfile.hash      |  8 ++--
 .../x11r7/xlib_libxkbfile/xlib_libxkbfile.mk  |  4 +-
 .../xlib_libxshmfence/xlib_libxshmfence.hash  |  8 ++--
 .../xlib_libxshmfence/xlib_libxshmfence.mk    |  4 +-
 package/x11r7/xorgproto/xorgproto.hash        |  6 +--
 package/x11r7/xorgproto/xorgproto.mk          |  4 +-
 .../xutil_makedepend/xutil_makedepend.hash    |  8 ++--
 .../xutil_makedepend/xutil_makedepend.mk      |  6 +--
 146 files changed, 417 insertions(+), 570 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
 delete mode 100644 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/0001-mibstore.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

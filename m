Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A664C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCCCC60AF2;
	Sun, 24 Jul 2022 16:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCCCC60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRQ02pubr887; Sun, 24 Jul 2022 16:26:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DADE8611CE;
	Sun, 24 Jul 2022 16:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADE8611CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC581BF96B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FDF3424CD
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDF3424CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HliSuZWbTPW for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF87241605
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF87241605
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout01.t-online.de (Postfix) with SMTP id C811A50D
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:05 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePc-0f12IL0; Sun, 24 Jul 2022 18:25:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-0T;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:40 +0200
Message-Id: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679900-0144F70D-8153963E/0/0 CLEAN NORMAL
X-TOI-MSGID: ab5a61e8-5079-4cca-b779-ca146306f2c9
Subject: [Buildroot] [PATCH 00/20] package/x11r7: mass version bump
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this series follows the recent bump of many X.org packages which
adds, when needed, the following additional changes:

- switched tarball from bz2 to xz
- switched _SITE to https
- reformatted license hash

Regards, Bernd

Bernd Kuhls (20):
  package/x11r7/xapp_xclipboard: bump version to 1.1.4
  package/x11r7/xapp_xcmsdb: bump version to 1.0.6
  package/x11r7/xapp_xconsole: bump version to 1.0.8
  package/x11r7/xapp_xfontsel: bump version to 1.1.0
  package/x11r7/xapp_xfs: bump version to 1.2.1
  package/x11r7/xapp_xmodmap: bump version to 1.0.11
  package/x11r7/xapp_xpr: bump version to 1.1.0
  package/x11r7/xapp_xwud: bump version to 1.0.6
  package/x11r7/xdriver_xf86-input-synaptics: bump version to 1.9.2
  package/x11r7/xdriver_xf86-video-cirrus: bump version to 1.6.0
  package/x11r7/xapp_xev: bump version to 1.2.5
  package/x11r7/xapp_xkbutils: bump version to 1.0.5
  package/x11r7/xapp_xmessage: bump version to 1.0.6
  package/x11r7/xapp_xrefresh: bump version to 1.0.7
  package/x11r7/xfont_encodings: bump version to 1.0.6
  package/x11r7/xfont_font-util: bump version to 1.3.3
  package/x11r7/xapp_xmag: bump version to 1.0.7
  package/x11r7/xlib_libxcvt: bump version to 0.1.2
  package/x11r7/xdriver_xf86-video-mach64: bump version to 6.9.7
  package/x11r7/xdriver_xf86-video-mga: bump version to 2.0.1

 .../xapp_xclipboard/xapp_xclipboard.hash      |  5 +-
 .../x11r7/xapp_xclipboard/xapp_xclipboard.mk  |  6 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.hash    |  5 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk      |  6 +-
 .../x11r7/xapp_xconsole/xapp_xconsole.hash    |  5 +-
 package/x11r7/xapp_xconsole/xapp_xconsole.mk  |  6 +-
 package/x11r7/xapp_xev/xapp_xev.hash          |  6 +-
 package/x11r7/xapp_xev/xapp_xev.mk            |  6 +-
 .../x11r7/xapp_xfontsel/xapp_xfontsel.hash    | 10 +--
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk  |  6 +-
 package/x11r7/xapp_xfs/xapp_xfs.hash          | 10 +--
 package/x11r7/xapp_xfs/xapp_xfs.mk            |  6 +-
 .../x11r7/xapp_xkbutils/xapp_xkbutils.hash    |  5 +-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk  |  6 +-
 package/x11r7/xapp_xmag/xapp_xmag.hash        |  5 +-
 package/x11r7/xapp_xmag/xapp_xmag.mk          |  6 +-
 .../x11r7/xapp_xmessage/xapp_xmessage.hash    | 10 +--
 package/x11r7/xapp_xmessage/xapp_xmessage.mk  |  6 +-
 package/x11r7/xapp_xmodmap/xapp_xmodmap.hash  | 10 +--
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk    |  6 +-
 package/x11r7/xapp_xpr/xapp_xpr.hash          | 10 +--
 package/x11r7/xapp_xpr/xapp_xpr.mk            |  6 +-
 .../x11r7/xapp_xrefresh/xapp_xrefresh.hash    | 10 +--
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk  |  6 +-
 package/x11r7/xapp_xwud/xapp_xwud.hash        | 10 +--
 package/x11r7/xapp_xwud/xapp_xwud.mk          |  6 +-
 .../xdriver_xf86-input-synaptics.hash         | 10 +--
 .../xdriver_xf86-input-synaptics.mk           |  6 +-
 .../xdriver_xf86-video-cirrus.hash            |  5 +-
 .../xdriver_xf86-video-cirrus.mk              |  6 +-
 ...me-bool-to-boolean-for-OptionInfoRec.patch | 84 -------------------
 .../xdriver_xf86-video-mach64.hash            | 10 +--
 .../xdriver_xf86-video-mach64.mk              |  6 +-
 .../0001-misc-fixes.patch                     | 21 -----
 .../xdriver_xf86-video-mga.hash               | 10 +--
 .../xdriver_xf86-video-mga.mk                 |  7 +-
 .../xfont_encodings/xfont_encodings.hash      | 10 +--
 .../x11r7/xfont_encodings/xfont_encodings.mk  |  4 +-
 .../xfont_font-util/xfont_font-util.hash      | 11 +--
 .../x11r7/xfont_font-util/xfont_font-util.mk  |  6 +-
 package/x11r7/xlib_libxcvt/xlib_libxcvt.hash  |  6 +-
 package/x11r7/xlib_libxcvt/xlib_libxcvt.mk    |  2 +-
 42 files changed, 129 insertions(+), 254 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-mach64/0002-Rename-bool-to-boolean-for-OptionInfoRec.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-mga/0001-misc-fixes.patch

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

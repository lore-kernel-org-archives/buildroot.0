Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834E9C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D15AF60BDC;
	Sun, 11 Dec 2022 16:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D15AF60BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mrby7gS10LGr; Sun, 11 Dec 2022 16:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B1860BD8;
	Sun, 11 Dec 2022 16:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16B1860BD8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDB7F1BF3D6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C963860BDA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C963860BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BnYIZuIf0CK for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:03:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A8460BD8
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A8460BD8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:03:22 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout08.t-online.de (Postfix) with SMTP id D736C2C07F
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:03:19 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4OnP-1TSxcH0; Sun, 11 Dec 2022 17:03:19 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56504)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4OnP-0008VD-1K
 for buildroot@buildroot.org; Sun, 11 Dec 2022 17:03:19 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:03:15 +0100
Message-Id: <20221211160319.3470254-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670774599-EEFF2A26-CBB6F984/0/0 CLEAN NORMAL
X-TOI-MSGID: 366f6fee-af65-43c6-9181-eef6d1fac67c
Subject: [Buildroot] [PATCH 0/4] package/x11r7: various version bumps
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

Regards, Bernd

Bernd Kuhls (4):
  package/x11r7/xdriver_xf86-input-joystick: bump version to 1.6.4
  package/x11r7/xdriver_xf86-video-ast: bump version to 1.1.6
  package/x11r7/xdriver_xf86-video-vesa: bump version to 2.6.0
  package/x11r7/xdriver_xf86-video-voodoo: bump version to 1.2.6

 .../xdriver_xf86-input-joystick.hash                        | 5 +++--
 .../xdriver_xf86-input-joystick.mk                          | 6 +++---
 .../xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash      | 5 +++--
 .../x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk  | 6 +++---
 .../xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash    | 6 +++---
 .../xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk      | 6 +++---
 .../xdriver_xf86-video-voodoo.hash                          | 5 +++++
 .../xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk  | 6 +++---
 8 files changed, 26 insertions(+), 19 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.hash

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

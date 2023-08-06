Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF1C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E61400A8;
	Sun,  6 Aug 2023 14:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E61400A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJcsrb-DYikJ; Sun,  6 Aug 2023 14:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E077402A6;
	Sun,  6 Aug 2023 14:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E077402A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2F51BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 217E54021B
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217E54021B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCSdw5TMIVHQ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:02:45 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8549440322
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8549440322
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67C1FA4C00C6;
 Sun,  6 Aug 2023 16:02:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLB-0000Bn-2f;
 Sun, 06 Aug 2023 16:02:41 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:29 +0200
Message-Id: <20230806140241.4155773-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330562;
 bh=QLBlwqDj900gDiN9t1GcejoD1PU7qgg38mTf0tCR+PU=;
 h=From:To:Cc:Subject:Date:From;
 b=RPOle45jRfDho+mopCHD8Pi+XtcCN8HdZ39yvZ5M0q+oziyl1DM9cpYa1zAC4/l77
 soB5EPsU2vRL4EWv1CCgBNHyxa9FwWzQTipqlZvPTcl+SbLVIB8xt46WmNDO3+Xfja
 CjqwoHl+cdp6jmH7YdLLrls9M6zOLg1zOKSLbvEVOyYqBFeNRM9iRBe9MS8Oy3t2RA
 w1FuXEzV8ngyOAOK4CsFu8Wg6zHy6LAbRpnS2vEPK5jneSoDf+EGiWNKCGM4GKiclE
 dEN+jrhLVYdJ7Gvt0JeCOnZQFdIKZPdE48j17kkNl1Z8poQ/Htya8ntqy9Fnn5mfKQ
 M56LC1tpCVFHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RPOle45j
Subject: [Buildroot] [PATCH/next v9 00/12] Introduce libudev (branch
 yem/libudev-6)
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

quoting Yann from 2016:
https://lists.buildroot.org/pipermail/buildroot/2016-July/167371.html

"Hello All!

This series introduces the possibility to just build and install
libudev, without requiring that the /dev management be handled by
eudev or systemd.

A lot of packages that have a dependency on udev, in fact only require a
libudev, not a udev daemon. That's the case for e.g. libinput, libcec,
mesa3d...

During previous developers days, it was suggested that libudev was to be
made a virtual package that could be selected (like jpeg is). So I
eventually got some time to rework it (since the series was not adopted
by Peter as it was discussed during those DevDays:
https://lite5.framapad.org/p/buildrootfosdem15 ;-) ).

This series is a full rewrite from scratch, with very little caried over
from the previous attempts (far back in the past).

  - first come a few cleanup patches;

  - then eudev is split in two, virtually providing to different
    packages in one, with two different configure/build/install
    procedures, one for libudev only, one for the full package;

  - then the libudev virtual package is introduced, with eudev and
    systemd both declared as providers;

  - libudev is made selectable, so that packages can select it instead
    of depending (like is usual) on the virtual package;

  - eventually, two packages are converted over to using libudev:
    qt5base, as an optional implicit dependency, and libinput, as a
    mandatory dependency.

Not all packages that reference udev have been switched over to depend
on libudev, though, since it is unclear to me whether they require a
udev daemon, or would be happy with just libudev. This can be done in
follow up patches once libudev is eventually in the tree (for good this
time I hope! ;-) )"

This patch series was rebased on Yann's latest code from 2020:
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/libudev-6
as suggested in 2021:
https://lists.buildroot.org/pipermail/buildroot/2021-March/607988.html
"eudev now has had the ability to only build the library for a while
already"

and more packages were ported to make use of libudev.

Bernd Kuhls (4):
  package/kodi: only needs libudev, not udev daemon
  package/libv4l: optionally use libudev
  package/libcec: optionally use libudev
  package/usbutils: only needs libudev, not udev daemon

Yann E. MORIN (8):
  package/eudev: add option to enable the udev daemon
  package/eudev: allow building only the library
  package/libudev: new virtual package
  package/eudev: provides libudev
  package/systemd: provides libudev
  package/libudev: make it selectable
  package/qt5base: optionally use libudev
  package/libinput: only needs libudev, not udev daemon

 package/Config.in              |  1 +
 package/eudev/Config.in        | 45 +++++++++++++++++++++++++-------
 package/eudev/eudev.mk         | 47 ++++++++++++++++++++++++----------
 package/kodi/Config.in         |  4 +--
 package/kodi/kodi.mk           |  4 +--
 package/libcec/libcec.mk       |  4 +--
 package/libinput/Config.in     | 10 +++++---
 package/libinput/libinput.mk   |  2 +-
 package/libudev/Config.in      | 13 ++++++++++
 package/libudev/libudev.mk     |  7 +++++
 package/libv4l/libv4l.mk       |  4 +--
 package/qt5/qt5base/qt5base.mk |  4 +--
 package/systemd/Config.in      |  4 +++
 package/systemd/systemd.mk     |  2 +-
 package/usbutils/Config.in     | 12 ++++++---
 package/usbutils/usbutils.mk   |  2 +-
 system/Config.in               |  1 +
 17 files changed, 124 insertions(+), 42 deletions(-)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

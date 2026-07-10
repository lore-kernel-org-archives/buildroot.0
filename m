Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F46C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06DC4608D6;
	Fri, 10 Jul 2026 13:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDK176h2-Ajn; Fri, 10 Jul 2026 13:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55259608B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691004;
	bh=zR8YfgTMHkJNjm+O8hU8FymIS9cP1Sil/8pzzkTpGKE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fe5O8mH2My6PenbaaA/fxEqDUn1yITDOSEcTThGKyCUJiVJo9tiLht5RpglC2WR/S
	 Bf1ShOJYHyJVKBdt3Pxt3dToG+UWg1Nj8UPiJi1dXkWC70GcEF/VcYHjz2xaT806IE
	 2v5nmrYj/2h9b9d8E4rd2+SdakLbD/PYk51ESPunbPYuFH4DRvN2Pj2s+m3jWpVjOK
	 n1bvDuccszWdKBVAqazLnBEDeg/f7ZGr1mqgBoUy6VonLylSTF+KatESS+jblIQe0R
	 umvk1RkDSkUGwSjy4IEh9NpJWegYYlrWOBY0YZw2QToGgCjGMZmb5fDm+pB23l56EG
	 GsxgZVNr5pfAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55259608B5;
	Fri, 10 Jul 2026 13:43:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36DA0A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C9E24022E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJPSpudMCMoK for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2D7400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C2D7400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F4DC88660; Fri, 10 Jul 2026 13:42:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 11:32:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b47eb5a096ea364ddcbc5a52ced9d729f08b9801
X-Git-Newrev: 9e52961485534e92e407e3305a5df20fead02f6c
X-Patchwork-Hint: ignore
Message-Id: <20260710134218.4F4DC88660@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5: bump
 packages to latest 5.15 kde submodule version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e52961485534e92e407e3305a5df20fead02f6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Bump qt5 packages to latest submodule versions from
https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

qtbase repo is a few commits after a tag named v5.15.18-lts-lgpl so
assume it's now 5.15.18.

qt5base patches are updated to make them apply silently and cleanly.

For qt5webengine-chromium:
- 0001-Add-python3-build-support.patc is removed as commit 68302c9ea158
  ("Enable building with Python 3") contains similar changes,
- 0004-Migrate-presubmit-to-python3.patch is only partially kept as
  commit 68302c9ea158 ("Enable building with Python 3") contains similar
  changes,
- 0006-Fix-build-in-Python-3.11-invalid-mode-rU.patch is only partially
  kept as commit 68302c9ea158 ("Enable building with Python 3") contains
  similar changes,
- 0007-Replace-imp.load_source-with-importlib-equivalent.patch is
  removed as commit 68302c9ea158 ("Enable building with Python 3")
  contains similar changes,
- 0010-Fix-building-with-system-libxml2.patch is removed as commit
  c98d28f2f0f2 ("Fix building with system libxml2") contains similar
  changes,
- 0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch is renamed
  0009-Include-cstdint-for-uintptr_t-uint8_t-etc.patch and contains more
  file patching to make qt5webengine build again,

Also make sure that the patches that have an upstream reference use the
proper Upstream: tag, so we can remove them from checkpackageignore.

For qt5webengine:
- 0002-Add-python3-build-support.patch is removed as commit 2294cc4ed5fd
  ("Add option to chose python version for building 5.15 WebEngine")
  contains similar changes. It now supports both Python2 and Python3 and
  defaults to Python2 if found first. This can be overridden with
  -webengine-python-version python3 in QT5WEBENGINE_CONF_OPTS but this
  was unnecessary in my tests as Python3 was properly selected from
  $(HOST_DIR)/bin/.

qt5webengine-chromium is updated with qt5webengine following the logic
stated in Buildroot commit c53455ea4ffa
("package/qt5/qt5webengine-chromium: bump version after qtwebengine
bump").

I am unsure whether qt5webengine-chromium-catapult also requires an
update.

(cherry picked from commit ff4243147d54f37521b0af252695459f36d4350d)
[qt5webengine-chromium/0011-Shorted-printed-cmd-when-long-commands-fail.patch
 doesn't exist in 2025.02.x, file renaming not done]
[qt5webengine-chromium/0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
 is named 0011-Include-cstdint-for-uintptr_t-uint8_t-etc.patch in
 2025.02.x, adapt renaming]

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
[Arnout: fix Upstream: tags]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |    8 +-
 package/qt5/qt5.mk                                 |    2 +-
 package/qt5/qt53d/qt53d.hash                       |    2 +-
 package/qt5/qt53d/qt53d.mk                         |    2 +-
 .../0003-double-conversion-enable-for-nios2.patch  |    6 +-
 .../0004-double-conversion-enable-for-xtensa.patch |    2 +-
 .../qt5/qt5base/0006-Fix-build-on-riscv32.patch    |    7 +-
 ...b-configure.json-fix-atomicfptr-detection.patch |    3 +-
 package/qt5/qt5base/qt5base.hash                   |    2 +-
 package/qt5/qt5base/qt5base.mk                     |    4 +-
 package/qt5/qt5charts/qt5charts.hash               |    2 +-
 package/qt5/qt5charts/qt5charts.mk                 |    2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |    2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |    2 +-
 package/qt5/qt5declarative/qt5declarative.hash     |    2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |    2 +-
 package/qt5/qt5doc/qt5doc.hash                     |    2 +-
 package/qt5/qt5doc/qt5doc.mk                       |    2 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |    2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |    2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |    2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |    2 +-
 package/qt5/qt5location/qt5location.hash           |    2 +-
 package/qt5/qt5location/qt5location.mk             |    2 +-
 package/qt5/qt5lottie/qt5lottie.hash               |    2 +-
 package/qt5/qt5lottie/qt5lottie.mk                 |    2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |    2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |    2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |    2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |    2 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |    2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |    2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash |    2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk   |    2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.hash |    2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk   |    2 +-
 package/qt5/qt5script/qt5script.hash               |    2 +-
 package/qt5/qt5script/qt5script.mk                 |    2 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |    2 +-
 package/qt5/qt5scxml/qt5scxml.mk                   |    2 +-
 package/qt5/qt5sensors/qt5sensors.hash             |    2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |    2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |    2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk           |    2 +-
 package/qt5/qt5serialport/qt5serialport.hash       |    2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |    2 +-
 package/qt5/qt5speech/qt5speech.hash               |    2 +-
 package/qt5/qt5speech/qt5speech.mk                 |    2 +-
 package/qt5/qt5svg/qt5svg.hash                     |    2 +-
 package/qt5/qt5svg/qt5svg.mk                       |    2 +-
 package/qt5/qt5tools/qt5tools.hash                 |    2 +-
 package/qt5/qt5tools/qt5tools.mk                   |    2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |    2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |    2 +-
 package/qt5/qt5wayland/qt5wayland.hash             |    2 +-
 package/qt5/qt5wayland/qt5wayland.mk               |    2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |    2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |    2 +-
 .../0001-Add-python3-build-support.patch           | 1858 --------------------
 ....patch => 0001-Don-t-rebase-sysroot-path.patch} |    0
 ...atch => 0002-Remove-unused-python-import.patch} |    0
 .../0003-Migrate-presubmit-to-python3.patch        |   49 +
 .../0004-Migrate-presubmit-to-python3.patch        |  132 --
 ...grit-util.py-fix-Python-3.12-build-issue.patch} |    0
 ...Fix-build-in-Python-3.11-invalid-mode-rU.patch} |   19 +-
 ...hon-google-protobuf-internal-python_mess.patch} |    0
 ...imp.load_source-with-importlib-equivalent.patch |   55 -
 ...-command_buffer-service-program_manager..patch} |    0
 ...Include-cstdint-for-uintptr_t-uint8_t-etc.patch |  297 ++++
 .../0010-Fix-building-with-system-libxml2.patch    |   57 -
 ...Include-cstdint-for-uintptr_t-uint8_t-etc.patch |  101 --
 .../qt5webengine-chromium.hash                     |    2 +-
 .../qt5webengine-chromium/qt5webengine-chromium.mk |    2 +-
 .../0002-Add-python3-build-support.patch           |  168 --
 ...i-remove-some-of-the-thumb-detection-log.patch} |    4 +-
 package/qt5/qt5webengine/qt5webengine.hash         |    2 +-
 package/qt5/qt5websockets/qt5websockets.hash       |    2 +-
 package/qt5/qt5websockets/qt5websockets.mk         |    2 +-
 package/qt5/qt5webview/qt5webview.hash             |    2 +-
 package/qt5/qt5webview/qt5webview.mk               |    2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |    2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |    2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |    2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |    2 +-
 84 files changed, 423 insertions(+), 2473 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

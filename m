Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96BDCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A3B42EB5;
	Sat, 30 May 2026 17:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-rCNCq-bC8J; Sat, 30 May 2026 17:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6638742EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780163646;
	bh=rp3lGyZPPEkAp0PhbxySxC/8vPV/ZV0rhIPOjrxCAns=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QA+MM7c7R1XzZGiFkyWvglkGqbdMuSGEVJ/VpucNUq5VA8gE3MLaTgrq6jYyk7fM+
	 kX6b8ul+teCgFx3OVfWDKnVqkTf2YK2dKf0rZWce7eNUsbNqatbBMgm28v8vaGbQkc
	 4EQHBTTQOg2nwtq9JdIEJrzfhjaew80F7+R88A5hogYO5Jm6BWtcJFNCb7Nzov55Ej
	 7trSP3wa+pnDsw53wrKav5hqpIf1eijxDnezbxlidMiDBx7VfM/GqyEIiYKrdwpFbZ
	 jAFq8doXPZ8rfIwjv0nJHURWLpGQhXBvaNC7uQT8TY0S7GkTFqKhmmFcgHMhDGMOqk
	 1pKIcdTAqjAdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6638742EB6;
	Sat, 30 May 2026 17:54:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93593D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 799BB853F9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0FnLduyjB_A for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96301853F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96301853F8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F19187532; Sat, 30 May 2026 17:53:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:51:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7d466c7e4c2ae8c1b3a9f870f6ab92e0f7be0a13
X-Git-Newrev: ff4243147d54f37521b0af252695459f36d4350d
X-Patchwork-Hint: ignore
Message-Id: <20260530175351.7F19187532@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5: bump packages to
 latest 5.15 kde submodule version
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ff4243147d54f37521b0af252695459f36d4350d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
[Arnout: fix Upstream: tags]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
 ...rted-printed-cmd-when-long-commands-fail.patch} |    0
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
 85 files changed, 423 insertions(+), 2473 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

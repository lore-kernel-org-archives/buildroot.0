Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5FAC3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E41960AC3;
	Mon,  1 Jul 2024 19:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoK0zzZ7mohB; Mon,  1 Jul 2024 19:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6987F60AD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6987F60AD0;
	Mon,  1 Jul 2024 19:48:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 073D91BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E895360AD0
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7XEFYBJ-75s1 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:48:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75BAC60AC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75BAC60AC3
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75BAC60AC3
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:48:50 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ON15smTI6qLIyON15sbqSf; Mon, 01 Jul 2024 21:48:47 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 21:48:46 +0200
Message-Id: <20240701194846.3032793-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEMS5eOsiUDdDbQbwhbOxBq+/qgOXhssrX1fMD6wu0W4nQrpyhqq77e46wCA5UMFe6QYtReCYjom83GlYyIUC/foSwmJSwANqFhdnieasMlsxIUeHJX6
 ApXetpM7+VmTDbCRiXY0B6FBkIyoZONAvaJm4UFLp+7oVduhJNTZT844itKWppgb/tmFxX0DMN5ENWsdBp8MMZln6J8+2u3uXJlQuFRieHk3nmKGOAIOTaRz
 rf8Svk2eRqhTYPNS/BHCu8od3g3WOFmtNEPw/c3kW7k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1719863327; bh=nT0o80NpnTkY1ew4F6LwALUUlbiBb957HAtNujBsiNU=;
 h=From:To:Subject:Date:MIME-Version;
 b=iZ4YGQNeD5QdMhVnIEbPd3IXEWXfo/zBf5dmc5BpCdLdtAEgShTLOpwiBON0lgZ6T
 PCGenlyUhjgJVVnFlzMflu76g9X9xAcYm9nNEYHesh7qgsffwf4NBqrvwn/B4Dgqc8
 wmItQKE8RmJSYhondpw7f6u85zrsmHcBcLUi2ZkmjieqaGbCfIKcYCooT9jEMB5w/O
 +4P30vor5/YWkUL2Okl0YguY9WGFcnceN3kcwhOuPkSYVJDGpquClitOyHcqnKokij
 wLp+kTterqRKdRPGCvMxOxSjPls2Sg4RLsDaRFkHLr8rCL1XrD7znBA1utouJ3RChf
 Ia/f0ArJteaUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iZ4YGQNe
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 9.0.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the major release changed all the packages that have direct
dependency to harfbuzz have been succesfully built:
- efl
- libass
- mupdf
- pango
- qt5base
- qt5webengine
- qt6base
- sdl2_ttf
- supertuxkart
- vlc
- webkitgtk
- wpewebkit

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index d5fc1ae096..fa4ee16a9f 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  77e4f7f98f3d86bf8788b53e6832fb96279956e1c3961988ea3d4b7ca41ddc27  harfbuzz-8.5.0.tar.xz
+sha256  a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e  harfbuzz-9.0.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3beac5e836..946b2b0f70 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.5.0
+HARFBUZZ_VERSION = 9.0.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

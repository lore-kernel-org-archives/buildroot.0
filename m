Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE7FC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 19:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB45381C0A;
	Mon, 26 Sep 2022 19:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB45381C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdjWuOlus6qR; Mon, 26 Sep 2022 19:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B56281951;
	Mon, 26 Sep 2022 19:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B56281951
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE2DD1BF2BF
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 19:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 992094051A
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 19:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 992094051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cANjK3t_5bN0 for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 19:53:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A401403A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A401403A9
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 19:53:52 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.17.226])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B28E213F86E;
 Mon, 26 Sep 2022 21:53:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 21:53:40 +0200
Message-Id: <20220926195340.583318-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664222029;
 bh=8Yl+MP+N4zkcNJEGPwYmsHCt9sbwk9vFS00CWteP2N0=;
 h=From:To:Cc:Subject:Date:From;
 b=M77sb2q0TerpB7+5jIEuaAgrgkuOt4GCFLm8yG3iRXkWxqLZX+dozUFe0YPBR8Rok
 66FjLv047GExzQJFgGVsM60Sq2FG1yNLJiY0cGRR9k0/MBiQB91RgfZaBC5YUNi6lZ
 E0D1nWFR543v6t/wC/3RanUb5T2oRHqviF4H0atiBvA472ujh/Q9MBjYwctdVY7/vA
 wZdwn9py6nka5t3x4kk4EwNs3tSMi0aPP607OQduQRT7SbVp2NJdfGEcJPmV9AIk/U
 lbSotrM9eiWWDmqRvKLT+U8RmREwYhwtfwf6Cx68VqVr015ncO/Slr08D0SJvyMwOD
 SdOIqYp+DW+8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M77sb2q0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.3.0
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v2.2.9, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested commit 358f4a0 with commands:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -p fluidsynth
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index b1e9f08bbf..fdb0cf4117 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bc62494ec2554fdcfc01512a2580f12fc1e1b01ce37a18b370dd7902af7a8159  fluidsynth-2.2.9.tar.gz
+sha256  1df5a1afb91acf3b945b7fdb89ac0d99877622161d9b5155533da59113eaaa20  fluidsynth-2.3.0.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 32fb88144e..20fbb644f5 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.9
+FLUIDSYNTH_VERSION = 2.3.0
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

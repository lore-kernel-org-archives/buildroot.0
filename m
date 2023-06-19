Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7AFEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 18:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E406125F;
	Mon, 19 Jun 2023 18:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27E406125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56XrvFCCwJKm; Mon, 19 Jun 2023 18:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 727C66123E;
	Mon, 19 Jun 2023 18:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 727C66123E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA2D81BF344
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 18:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C22FD410A4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 18:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C22FD410A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7ZhdnMOAWko for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 18:17:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70301410A3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70301410A3
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 18:17:36 +0000 (UTC)
Received: from home.juju.sh (unknown [37.170.67.228])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 052022003EE;
 Mon, 19 Jun 2023 20:17:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 20:17:18 +0200
Message-ID: <20230619181718.456022-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687198653;
 bh=9Z97ChICx1+q7xwO32UY7quGiiJbbNuxaq8XyaFuEMw=;
 h=From:To:Cc:Subject:Date:From;
 b=vDfQFZXd/i68L0iKx3YG4Igeoj0w6tNviRmYcIGsu6aeoMmVGlzhFQmnhbH28LRl/
 LPmFVoGF7k4GiWXWApw0/JJX7yUWByejLUw7QRp/v3FI7IEf50tK6mvK/n9giy2Xlv
 tbtUudt4XMO8JVhw9bbNj2hMzgITPw9DQzKug4xjpwN9ftFXQp8gBQwRXJiyadva+E
 LP8LevXBFPcHTFGZDVPqtpZtWF0ZjqTi0XkBJ4i6grlE44UF6kpx2wzjBYxp84JNtr
 1goQyP947onyIhHbVuWJWeKmgCQBwqXgpkbkKq6rpYLort95fTHZvqQn0P2NgONpVa
 OjfXA/bCXAsLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vDfQFZXd
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.3.3
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

For change log since v2.3.2, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit d4a96ee with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p fluidsynth
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed 
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 0f8f04d676..382a54abad 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cd610810f30566e28fb98c36501f00446a06fa6bae3dc562c8cd3868fe1c0fc7  fluidsynth-2.3.2.tar.gz
+sha256  321f7d3f72206b2522f30a1cb8ad1936fd4533ffc4d29dd335b1953c9fb371e6  fluidsynth-2.3.3.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 854ed00032..52f8ec489f 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.3.2
+FLUIDSYNTH_VERSION = 2.3.3
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

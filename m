Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6239C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:36:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 866B2610F9
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 866B2610F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DFCE401F4;
	Mon, 13 Sep 2021 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UiallPU-dc5; Mon, 13 Sep 2021 20:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79AC840134;
	Mon, 13 Sep 2021 20:36:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7400C1BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6461780E4D
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqwodWMNwvsW for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:36:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6AFB80E38
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:36:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C4DD8A65A; Mon, 13 Sep 2021 20:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:32:44 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cf41704cd86e1877eb59ee7013336467669991be
X-Git-Newrev: a995385a61c62d468a4715e7591ade60150e3a35
X-Patchwork-Hint: ignore
Message-Id: <20210913203418.4C4DD8A65A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/fluidsynth:
 security bump to version 2.1.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a995385a61c62d468a4715e7591ade60150e3a35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the CVE-2021-21417 security issue:
https://github.com/FluidSynth/fluidsynth/security/advisories/GHSA-6fcq-pxhc-jxc9
https://github.com/FluidSynth/fluidsynth/issues/808

See changelog since v2.1.5:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.6
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.7
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.8
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.9

./utils/test-pkg --package fluidsynth
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 17e37e2479..fc6961dd0d 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b539b7c65a650b56f01cd60a4e83c6125c217c5a63c0c214ef6274894a677d00  fluidsynth-2.1.5.tar.gz
+sha256  365642cc64bafe0491149ad643ef7327877f99412d5abb93f1fa54e252028484  fluidsynth-2.1.9.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index e3269f5300..c3ff645326 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.5
+FLUIDSYNTH_VERSION = 2.1.9
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

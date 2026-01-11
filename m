Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9FBD2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A483881300;
	Sun, 11 Jan 2026 17:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DV42iekWdnI; Sun, 11 Jan 2026 17:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759A8812E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152416;
	bh=E962Dd48D2xff09jX61lgnKucKDu1Rf8vCHuVgJ5Chg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KiEfcBdPS46OOweQFNMTK+2PqE9ebDyrmOlpWJrYhSo1Axgj21x0LxwiI0UMrZAVk
	 N6ZVRvzeXMRVqgecq8ACnJaeuvDP+0w3FrNJsSwVdalEfQUB1WrDwIrzxUZE5sR6/T
	 s28BAJZfvoJ8h2eWg8KkdsauHenr2lvF1VITAWLGkkhbY9A17NvMxXYydv4Jp8tsHY
	 chnZikyhPhODKbpdU9womLcfWaobUISs+mLNWNrSCg4+T/pDKi6LHjuJyLYgL1MJvv
	 /OqJDLU/S6d/fVk9YAiIqSjU8SXRSuza5Mz1Zr2xv/+I0Nn24TFByrzcyYOvrYVd7+
	 R7U9ivpVqSpvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 759A8812E2;
	Sun, 11 Jan 2026 17:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 491EF18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C664022A
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6EAtFg2di5r for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBBC3402A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBBC3402A7
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D31CB884A3; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 18:17:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b26ba37f1c47aa83039f18dbcad1164de9a805cd
X-Git-Newrev: eff2064c05db70eb97a2ef19f41d614f71e232ea
X-Patchwork-Hint: ignore
Message-Id: <20260111172649.D31CB884A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.15.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eff2064c05db70eb97a2ef19f41d614f71e232ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.alsa-project.org/wiki/Changes_v1.2.15.1_v1.2.15.2#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 8892ebdb0e..569b4887d4 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b91737a08bb03f566c  alsa-lib-1.2.15.1.tar.bz2
+sha256  637eefd4966ce738da44464494df2b2894e19778fac2f9e7c47277e2af9297f4  alsa-lib-1.2.15.2.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index a4713edf0a..08d96c3188 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.15.1
+ALSA_LIB_VERSION = 1.2.15.2
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

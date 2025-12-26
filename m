Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AFDE8FDB3
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370466086B;
	Fri, 26 Dec 2025 18:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOT25YTnBUBV; Fri, 26 Dec 2025 18:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5811E60A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773263;
	bh=DM+U9fSpRDGGcQ278R0altW/UEAS1vnLf3mqWUZpHH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MhYdSZWetgEc1qBsFhKxPNPqPL8fo/Kn2haEpupAE4BGO+ycQTlt2MtG5Ic+oeYam
	 nNg9sNK91th/509fFu66CQyBWtgSunsMcBFcg4gNNaRLPDgAjSWtKOjFmSWNDeaMbd
	 bTV5Ziz/G7u68wTieckB0vNnaOplCm0JadPzhvEwnArdpsiriHoOEQb1bseNyhbfRC
	 /Oipeux2T0NtyUZ7NNpUCEgbQS4l2rB4juHNyNhdx+jPtSbqnrJoV8mZRVZ2XB2TzP
	 3ezFpnphbyDR2OUgu+R4ws+TKO8Th7O7V1yF92+c3xiz9jrCcPY4KYZMzQsVsEiPK1
	 X+173SVvqONWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5811E60A4E;
	Fri, 26 Dec 2025 18:21:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50B28B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 433E540313
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W_Zt5D5p7If for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD1F40324
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD1F40324
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7EA28461E; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c483596f00cfa5a30092d4cdaffb3706312a8a9
X-Git-Newrev: 86aed531452f885bb91787e2ae70b7bc227d1dbf
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.B7EA28461E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ogre: bump version to 14.4.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=86aed531452f885bb91787e2ae70b7bc227d1dbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/OGRECave/ogre/blob/v14.4.1/Docs/14-Notes.md

https://github.com/OGRECave/ogre/blob/v14.4.1/Docs/13-Notes.md
"The versioning scheme changed with this release. This is the successor
 to Ogre 1.12 and the porting efforts are comparable with porting from
 1.11 to 1.12."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ogre/ogre.hash | 2 +-
 package/ogre/ogre.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ogre/ogre.hash b/package/ogre/ogre.hash
index 963c521eaa..138885dc3b 100644
--- a/package/ogre/ogre.hash
+++ b/package/ogre/ogre.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  85d80ad2afe5e59b0ee8593f8bedbab8377a6772f21de310717798f6ca96010f  ogre-v1.12.12-git4.tar.gz
+sha256  ed3b48a3305ef53e21dac72f7a3abf07503510c93dc091f69baed3cefd9c0efc  ogre-v14.4.1-git4.tar.gz
 sha256  82758e8d1d72139904b9b7472ef0f6544413d2871b58540307fdcc20e473e5f8  LICENSE
diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 3fd2fc4650..4e5d5f6d72 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OGRE_VERSION = v1.12.12
+OGRE_VERSION = v14.4.1
 OGRE_SITE = https://github.com/OGRECave/ogre
 OGRE_SITE_METHOD = git
 OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

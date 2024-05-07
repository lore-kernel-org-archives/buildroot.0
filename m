Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BCCC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9E4E402F7;
	Tue,  7 May 2024 07:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4W5Uaee80bY; Tue,  7 May 2024 07:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4F4D404EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4F4D404EF;
	Tue,  7 May 2024 07:11:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55C921BF95F
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A57404EF
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxgCaRtFWJix for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8624641571
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8624641571
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:11:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73D1C869AA; Tue,  7 May 2024 07:11:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 09:11:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3e17c407a39ee4d576540c86b4b3b0549e81136
X-Git-Newrev: 9b235e3cacb32b002a624cf47fb3393a875df968
X-Patchwork-Hint: ignore
Message-Id: <20240507071154.73D1C869AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: drop
 host-autoconf-archive dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b235e3cacb32b002a624cf47fb3393a875df968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-autoconf-archive was added to libgpiod in commit
8df6ae3127ccdc0873df2246b32918e846b074c3 because of a patch to
configure.ac.

It is not needed by libgpiod2 as there is no patch since the addition
of the package in commit 57391fad2e619395340b81957ddceab1b1df2e20

Fixes: 57391fad2e619395340b81957ddceab1b1df2e20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpiod2/libgpiod2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 9c478f1ffb..856eb9bd14 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -12,7 +12,7 @@ LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
 LIBGPIOD2_LICENSE_FILES = COPYING
 LIBGPIOD2_INSTALL_STAGING = YES
-LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
+LIBGPIOD2_DEPENDENCIES = host-pkgconf
 LIBGPIOD2_CONF_OPTS = \
 	--disable-bindings-python \
 	--disable-examples \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

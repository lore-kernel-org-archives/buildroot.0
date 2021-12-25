Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ECFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 10:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C008240286;
	Sat, 25 Dec 2021 10:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSKmh2GPxPck; Sat, 25 Dec 2021 10:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2495C402B3;
	Sat, 25 Dec 2021 10:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 891611BF95F
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 762C7401D5
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxu2YQZE8VUV for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B249240104
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5725082AD1; Sat, 25 Dec 2021 10:47:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 11:52:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d29d1368478df621c2426820e1a6019225467234
X-Git-Newrev: 8a78e215c3bc8bcfcfdd5ba8f8c82d977c91e91b
X-Patchwork-Hint: ignore
Message-Id: <20211225104744.5725082AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd-mpc: disable documentation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a78e215c3bc8bcfcfdd5ba8f8c82d977c91e91b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable documentation which is available (and enabled by default) since
bump to version 0.31 in commit 0186da2923c07656005264dbb3001ca706a2ef10
and
https://github.com/MusicPlayerDaemon/mpc/commit/60e173c0198743fd6af906682eadec1cc67a4975

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd-mpc/mpd-mpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index 6eebc63cca..d5a981d70e 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -11,5 +11,6 @@ MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPL-2.0+
 MPD_MPC_LICENSE_FILES = COPYING
 MPD_MPC_DEPENDENCIES = host-pkgconf libmpdclient
+MPD_MPC_CONF_OPTS = -Ddocumentation=disabled
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

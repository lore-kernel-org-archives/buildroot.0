Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D7FC0015E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 20:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7723F60BEB;
	Sun, 16 Jul 2023 20:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7723F60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pr4Ycvg5BdXM; Sun, 16 Jul 2023 20:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B3F60DDF;
	Sun, 16 Jul 2023 20:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B3F60DDF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96FD81BF365
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E2B88174A
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E2B88174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tovgn12nW4FC for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 20:12:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C33CD81749
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 20:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C33CD81749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADFF08710E; Sun, 16 Jul 2023 20:12:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 22:03:36 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 4a2dbae95f8ecaa02b1e3ce1703544c9cd1bd97c
X-Git-Newrev: b62df15fdaffe2cd7d4256bdf0e590b6b9d86148
X-Patchwork-Hint: ignore
Message-Id: <20230716201212.ADFF08710E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/pkgconf: fix
 download URL
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
Content-Type: multipart/mixed; boundary="===============2179822509690353316=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2179822509690353316==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b62df15fdaffe2cd7d4256bdf0e590b6b9d86148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Due to problems with the registrar (dynadot) [1], the dereferenced.org
domain got stolen and is up for auction. While sorting that out, the
official download site has changed to a different domain [2]. Update
PKGCONF_SITE to the new location.

There's an upstream bug to track the issue [3].

[1] https://social.treehouse.systems/@ariadne/110643909699308207
[2] https://github.com/pkgconf/pkgconf/commit/437c2a3218bfcb1cae7fa38a4ccd0cb29575ff07
[3] https://github.com/pkgconf/pkgconf/issues/302

Fixes: https://bugs.busybox.net/show_bug.cgi?id=15673

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ef95ec920cbae32e5a525d887b7a279440d96f11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkgconf/pkgconf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index e9587fae6b..1d73b691e1 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PKGCONF_VERSION = 1.6.3
-PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
+PKGCONF_SITE = https://distfiles.ariadne.space/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING

--===============2179822509690353316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2179822509690353316==--

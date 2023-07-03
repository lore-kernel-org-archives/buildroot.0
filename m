Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FE9C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 17:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3432640C2A;
	Mon,  3 Jul 2023 17:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3432640C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwYterT2dE1B; Mon,  3 Jul 2023 17:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62A8440280;
	Mon,  3 Jul 2023 17:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62A8440280
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 560901BF86C
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 17:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FFA581BC6
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 17:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FFA581BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lifb7FzMUfgF for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 17:50:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB168202A
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 17:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB168202A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED5D9863D0; Mon,  3 Jul 2023 17:50:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 19:48:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b335bd18a07363d53b6dc0faa82e26f068d0ae7b
X-Git-Newrev: ef95ec920cbae32e5a525d887b7a279440d96f11
X-Patchwork-Hint: ignore
Message-Id: <20230703175014.ED5D9863D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkgconf: fix download URL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5853175782623293317=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5853175782623293317==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ef95ec920cbae32e5a525d887b7a279440d96f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============5853175782623293317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5853175782623293317==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035F4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623E6420A1;
	Thu,  9 Nov 2023 21:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623E6420A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUESs5PdjSFw; Thu,  9 Nov 2023 21:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B0342082;
	Thu,  9 Nov 2023 21:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93B0342082
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E45001BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3AD41E97
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3AD41E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vj5zqTLG0oF for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0695641E8E
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0695641E8E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E524586EB9; Thu,  9 Nov 2023 21:50:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 22:49:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74ceb71a52b001630c9d11e9ab015acc87cb2a26
X-Git-Newrev: e759e927b344d3b12e7d5224c750b1755d9068b4
X-Patchwork-Hint: ignore
Message-Id: <20231109215032.E524586EB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pygame: switch from
 distutils to setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=e759e927b344d3b12e7d5224c750b1755d9068b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

distutils will be dropped with python 3.12.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pygame/python-pygame.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 600dd9e743..84fd6df4e2 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -10,7 +10,7 @@ PYTHON_PYGAME_VERSION = d61ea8eabd56
 PYTHON_PYGAME_SOURCE = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
 PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
 PYTHON_PYGAME_SITE_METHOD = hg
-PYTHON_PYGAME_SETUP_TYPE = distutils
+PYTHON_PYGAME_SETUP_TYPE = setuptools
 PYTHON_PYGAME_LICENSE = LGPL-2.1+
 PYTHON_PYGAME_LICENSE_FILES = LGPL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

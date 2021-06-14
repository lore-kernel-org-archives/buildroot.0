Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEBAC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DFE60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62DFE60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 391D9404C2;
	Tue,  3 Aug 2021 23:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cF8d9kmJQDx; Tue,  3 Aug 2021 23:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 476F7404A8;
	Tue,  3 Aug 2021 23:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 108E61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 607D540620
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oR6sazm1AfAs for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F4F4063B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E17A98674F; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Jun 2021 22:00:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e990f1c9d9c57dbcb36d861458180a9a121d4153
X-Git-Newrev: 1011f9a8e9c206fe78a97c0f80d6e23896c558af
X-Patchwork-Hint: ignore
Message-Id: <20210803210951.E17A98674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpcbind fix version
 number
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1011f9a8e9c206fe78a97c0f80d6e23896c558af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit d13b292cec8166c4712cf4a0defbeee827ffaf78 introduced a patch for rpcbind but also changed the version number to a non-existing value.

Change rpcbind to last released version and adapt hash value.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998@free.fr: fix version in patch too, noticed by Baruch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpcbind/0001-Remove-yellow-pages-support.patch | 2 +-
 package/rpcbind/rpcbind.hash                           | 2 +-
 package/rpcbind/rpcbind.mk                             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpcbind/0001-Remove-yellow-pages-support.patch b/package/rpcbind/0001-Remove-yellow-pages-support.patch
index 9303d71c96..694f1ac9de 100644
--- a/package/rpcbind/0001-Remove-yellow-pages-support.patch
+++ b/package/rpcbind/0001-Remove-yellow-pages-support.patch
@@ -8,7 +8,7 @@ available. As most Buildroot users are most likely never going to need
 such feature, get rid of it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[ rebased for 1.3.2 ]
+[ rebased for 1.2.6 ]
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  src/security.c | 15 ---------------
diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 1960b86c13..6ab7d89265 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a  rpcbind-1.2.5.tar.bz2
+sha256 5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de  rpcbind-1.2.6.tar.bz2
 sha256 2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index fea2103794..d9f25e698e 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.3.2
+RPCBIND_VERSION = 1.2.6
 RPCBIND_SITE = http://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

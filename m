Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36F4C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 15:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3421383EB0;
	Sun, 14 Aug 2022 15:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3421383EB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JoQz9jmNoFJ2; Sun, 14 Aug 2022 15:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD4A83E9B;
	Sun, 14 Aug 2022 15:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD4A83E9B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 311301BF41C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1955E83E9B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 15:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1955E83E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKyBVoB8rrge for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 15:15:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57DFC83E84
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 15:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DFC83E84
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0B6CA874DA; Sun, 14 Aug 2022 15:00:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 17:13:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c8e3bfa2f5662160290dc97d6fb0b943cf894bec
X-Git-Newrev: d4afac3ab11ea4b8c2d45312f70dadb63d17d628
X-Patchwork-Hint: ignore
Message-Id: <20220814150052.0B6CA874DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: fix typo in
 variable name
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4afac3ab11ea4b8c2d45312f70dadb63d17d628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 7ff21f8d4b94 (package/binutils: handle gprofng as an optional
feature) introduced the typo. Although it was noticed, the commit was
not amended before being pushed...

Fix that now...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/binutils/binutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e4cb19896d..1ef7ee57d2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -94,9 +94,9 @@ HOST_BINUTILS_CONF_OPTS = \
 
 ifeq ($(BR2_BINUTILS_GPROFNG),y)
 HOST_BINUTILS_DEPENDENCIES += host-bison
-HOST_INBUTILS_CONF_OPTS += --enable-gprofng
+HOST_BINUTILS_CONF_OPTS += --enable-gprofng
 else
-HOST_INBUTILS_CONF_OPTS += --disable-gprofng
+HOST_BINUTILS_CONF_OPTS += --disable-gprofng
 endif
 
 # binutils run configure script of subdirs at make time, so ensure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

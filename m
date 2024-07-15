Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9D2C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9297F4047E;
	Mon, 15 Jul 2024 12:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8w4oPM49xXCo; Mon, 15 Jul 2024 12:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6403E4060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6403E4060B;
	Mon, 15 Jul 2024 12:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 214A41BF969
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AA15405DE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LljyrG4OZvga for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACE6403F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ACE6403F8
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10973869DA; Mon, 15 Jul 2024 12:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 14:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fe638af2632424b826843675311f9a258a57b71
X-Git-Newrev: 4574edef7fabb3c1fb5279c0fcfb5c83c3f0e057
X-Patchwork-Hint: ignore
Message-Id: <20240715124057.10973869DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnpth: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=4574edef7fabb3c1fb5279c0fcfb5c83c3f0e057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed to support a host build of gnupg2.  It is not directly
selectable.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnpth/libnpth.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 3fa5e1f905..634da6ed3a 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -13,5 +13,7 @@ LIBNPTH_INSTALL_STAGING = YES
 # 0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
 LIBNPTH_AUTORECONF = YES
 LIBNPTH_CONF_OPTS = --disable-tests
+HOST_LIBNPTH_CONF_OPTS = --disable-tests
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

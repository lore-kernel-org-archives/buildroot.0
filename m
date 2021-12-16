Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DBBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A04A0417FC;
	Thu, 16 Dec 2021 20:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OOa8W8umcqI; Thu, 16 Dec 2021 20:17:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEB86417F7;
	Thu, 16 Dec 2021 20:17:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD651BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D60CD61053
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id um0KHhYdC27e for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3777C61059
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9385F81EB3; Thu, 16 Dec 2021 20:11:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 21:08:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f38ce2103bbb01128dd00f102d0834d03343c2f
X-Git-Newrev: 7bb6ebea9918ace84bcc84c7c84e4b57354ef62e
X-Patchwork-Hint: ignore
Message-Id: <20211216201118.9385F81EB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: add zeromq optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bb6ebea9918ace84bcc84c7c84e4b57354ef62e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zeromq is an optional dependency since version 4.0 and
https://github.com/FRRouting/frr/commit/b6116506ec81735afa647af112c6aaa1ed35e9df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frr/frr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 733518fc11..97cc735935 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -42,6 +42,13 @@ else
 FRR_CONF_OPTS += --disable-capabilities
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ),y)
+FRR_DEPENDENCIES += zeromq
+FRR_CONF_OPTS += --enable-zeromq
+else
+FRR_CONF_OPTS += --disable-zeromq
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

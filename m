Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAFAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3027760E5E;
	Wed,  9 Feb 2022 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJ5IIKysiN1T; Wed,  9 Feb 2022 21:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D6C860E58;
	Wed,  9 Feb 2022 21:45:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6FB1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 993B560FE5
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVmaAFKOghvF for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 322E260E5B
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 458A981335; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02a067680373b8e1073e64a5bed99a3c0a62b8b2
X-Git-Newrev: e45321b19cd193ba333012cfc56439650a8907e3
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.458A981335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: drop python2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e45321b19cd193ba333012cfc56439650a8907e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nftables/nftables.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index d5c16ac2be..232d541488 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -35,9 +35,9 @@ else
 NFTABLES_CONF_OPTS += --without-json
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 NFTABLES_CONF_OPTS += --enable-python
-NFTABLES_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+NFTABLES_DEPENDENCIES += python3
 else
 NFTABLES_CONF_OPTS += --disable-python
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

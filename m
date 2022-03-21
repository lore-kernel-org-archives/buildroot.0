Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F47C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D13F60E2F;
	Mon, 21 Mar 2022 07:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3AEMNRGuJh-V; Mon, 21 Mar 2022 07:54:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DECB160E15;
	Mon, 21 Mar 2022 07:54:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45B6A1BF316
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 433404095F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iWeMu6sBoOK for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:54:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A5EC40948
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:54:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6C95884798; Mon, 21 Mar 2022 07:45:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 08:50:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8ff60335b573f7bd8fa67511450ba542a5d45c8e
X-Git-Newrev: 073bba9c3339eb864bb0314aced574395bcc1403
X-Patchwork-Hint: ignore
Message-Id: <20220321074537.6C95884798@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libminiupnpc:
 disable sample and tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=073bba9c3339eb864bb0314aced574395bcc1403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable sample and tests (which are built by default since version 2.1:
https://github.com/miniupnp/miniupnp/commit/530b2723500c4a708546815f5593b5c819ab5f76)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e1d0ac062cd65794a39e90b5f7abae354aa69be9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libminiupnpc/libminiupnpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 551a6767cf..0633ccd234 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -16,5 +16,6 @@ LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
 LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
 LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
 LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
+LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

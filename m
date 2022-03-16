Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A417C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 22:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 765E940204;
	Wed, 16 Mar 2022 22:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TY693OMSqV32; Wed, 16 Mar 2022 22:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58DB340179;
	Wed, 16 Mar 2022 22:18:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93D0F1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82A5160881
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05AaVG5H7UJv for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 22:18:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3DBA607FF
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 22:18:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A14A584323; Wed, 16 Mar 2022 22:09:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 23:16:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b92210ce36588038aa728e48f3826f6b32d471c0
X-Git-Newrev: e1d0ac062cd65794a39e90b5f7abae354aa69be9
X-Patchwork-Hint: ignore
Message-Id: <20220316220950.A14A584323@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libminiupnpc: disable sample and
 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1d0ac062cd65794a39e90b5f7abae354aa69be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable sample and tests (which are built by default since version 2.1:
https://github.com/miniupnp/miniupnp/commit/530b2723500c4a708546815f5593b5c819ab5f76)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

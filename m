Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15588C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6133410A8;
	Mon, 21 Mar 2022 07:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hK5zuwr-9640; Mon, 21 Mar 2022 07:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E664095F;
	Mon, 21 Mar 2022 07:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 907271BF316
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E3DE4095F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRvXInmKdkKr for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:54:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE86340948
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:54:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AE40584783; Mon, 21 Mar 2022 07:45:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 08:50:41 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b4b78a0f8a9736ff555bd4accc29361df265dd6f
X-Git-Newrev: 33fe8c54921d2086705c435d418b561e87e7ae63
X-Patchwork-Hint: ignore
Message-Id: <20220321074532.AE40584783@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libminiupnpc:
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

commit: https://git.buildroot.net/buildroot/commit/?id=33fe8c54921d2086705c435d418b561e87e7ae63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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

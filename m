Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8A4C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AAF84046D;
	Wed, 15 Mar 2023 14:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AAF84046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gi0MbSTQbR3v; Wed, 15 Mar 2023 14:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9A3841912;
	Wed, 15 Mar 2023 14:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9A3841912
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E06F1BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49DD24046D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49DD24046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2uO0C5FdCrX for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B57840936
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B57840936
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3781387425; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:35:52 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: ff274c142d00ed3ffaf7f20212d24189731d4d34
X-Git-Newrev: 63cda1daa0480f2a60fbdb0ba7d71629bef9e549
X-Patchwork-Hint: ignore
Message-Id: <20230315144315.3781387425@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gensio: add C++
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=63cda1daa0480f2a60fbdb0ba7d71629bef9e549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

C++ is available since 2.3.0 and
https://github.com/cminyard/gensio/commit/3fda483f15a2668f9e2396517cdbf09693e6e3ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 47cb0c967f7c825e02e66d1df26ff9e893bf5235)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 3374313c0f..2ba1b950d7 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -13,6 +13,12 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+GENSIO_CONF_OPTS += --with-cplusplus
+else
+GENSIO_CONF_OPTS += --without-cplusplus
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 GENSIO_DEPENDENCIES += alsa-lib
 GENSIO_CONF_OPTS += --with-alsa
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

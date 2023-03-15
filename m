Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C346C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC444161F;
	Wed, 15 Mar 2023 14:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC444161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tt6L1zFUUnwa; Wed, 15 Mar 2023 14:43:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2FA440936;
	Wed, 15 Mar 2023 14:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2FA440936
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12C9E1BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E122480E94
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E122480E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyOFyO0AhEpj for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 343BF80E86
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 343BF80E86
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2297887423; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:35:16 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 203b27d3e9a60435e20945aa3833bc5c399a5ae0
X-Git-Newrev: 159ffa9b1b2664b6ea09ff19f2ba24a67bd1858b
X-Patchwork-Hint: ignore
Message-Id: <20230315144315.2297887423@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gensio: add
 alsa-lib optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=159ffa9b1b2664b6ea09ff19f2ba24a67bd1858b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

alsa-lib is an optional dependency which is enabled by default since
version 2.5.3 and
https://github.com/cminyard/gensio/commit/dc9bad87d47588dcdd92ce118fcc4f41d10b671c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a69ecf0e89b5f88dbd0bcadf9b8aabae10066289)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index dafc0bf5d5..89c734eec0 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -14,6 +14,13 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+GENSIO_DEPENDENCIES += alsa-lib
+GENSIO_CONF_OPTS += --with-alsa
+else
+GENSIO_CONF_OPTS += --without-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

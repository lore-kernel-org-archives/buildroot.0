Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 08:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2182A40930;
	Wed, 16 Feb 2022 08:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rW0obDY9yo4o; Wed, 16 Feb 2022 08:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3847C40117;
	Wed, 16 Feb 2022 08:27:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1C61BF2EA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 08:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A6F260AE6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 08:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEMl_UcoO8fq for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 08:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6368A60AA0
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 08:27:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D308881EB3; Wed, 16 Feb 2022 08:19:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 09:22:12 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 91a66a566b9f89c1aaf95715ab9dd7b3a8937084
X-Git-Newrev: 168f8e4358e73037f6670e92640c0079a952a6c4
X-Patchwork-Hint: ignore
Message-Id: <20220216081920.D308881EB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/gensio: add avahi
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

commit: https://git.buildroot.net/buildroot/commit/?id=168f8e4358e73037f6670e92640c0079a952a6c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

avahi-client is an optional dependency which is enabled by default since
version 2.2.0 and
https://github.com/cminyard/gensio/commit/5ab117c9743fd4719f610cf9f1ba45023cc25d7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f0a1d47f6fe6bda3b18b3fcfca37757b37695dbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 389de1e263..266ac137a2 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -9,6 +9,7 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
+GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),avahi)
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

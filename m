Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43325C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B392A418E3;
	Wed, 15 Mar 2023 14:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B392A418E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieD0nnHZ6uLW; Wed, 15 Mar 2023 14:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D8A0418DB;
	Wed, 15 Mar 2023 14:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D8A0418DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5124D1BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B6144161F
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B6144161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkmF0FCg_fd1 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D79D4046D
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D79D4046D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 184BF87422; Wed, 15 Mar 2023 14:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:31:56 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: ef2bd60926ec78669b549cc7c154616102633b4a
X-Git-Newrev: 203b27d3e9a60435e20945aa3833bc5c399a5ae0
X-Patchwork-Hint: ignore
Message-Id: <20230315144315.184BF87422@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/gensio: add
 libglib2 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=203b27d3e9a60435e20945aa3833bc5c399a5ae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

libglib2 is an optional dependency which is enabled by default since
version 2.3.0 and
https://github.com/cminyard/gensio/commit/866924d69dabe8b8a981e19bd745d5c84e529881

Handle it properly to avoid the following build failure since bump to
version 2.5.2 in commit 5bb747f0b783a0d3f1712350ca3277263045b299:

sparc64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/glib-2.0'

Fixes:
 - http://autobuild.buildroot.org/results/3602c5cc2aff668211fd8e6eeab778b3fe287246

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f255abdceabc3ebbff795c753f7a33d44e905369)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 5538f97b19..dafc0bf5d5 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -14,6 +14,13 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+GENSIO_DEPENDENCIES += host-pkgconf libglib2
+GENSIO_CONF_OPTS += --with-glib
+else
+GENSIO_CONF_OPTS += --without-glib
+endif
+
 ifeq ($(BR2_PACKAGE_OPENIPMI),y)
 GENSIO_DEPENDENCIES += openipmi
 GENSIO_CONF_OPTS += --with-openipmi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

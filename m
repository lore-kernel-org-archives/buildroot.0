Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B1FC5B572
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E608148D;
	Fri, 14 Aug 2026 13:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzpE1QKq4sI4; Fri, 14 Aug 2026 13:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B448B8134E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713715;
	bh=01/xAvqg9KZorE6Bsk6nJZ0SQqZKRj0PjUs1nGQJebI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sqg2Y19q0YRxvFHz4BCkpdqj9mEfF6Gn2m/ODbiRi25XXZQrz63ICip4XWKON6prI
	 0qmMiw59IkYIkDz/JpTgWp15kBQgQBSqIC6SJHB88mJmtmc9rCZxwgOLybECnostqa
	 mTYwosphm8w3mRj8fxlh357l8V2ldEF/FRAs9lqh6y7spvLIDZsLnjaPyFON0GnRD6
	 moL/TkV8X4yCTiYqDSEdvBJB8CZ/z4artKT9G6mcI5ea6O61P7OOYr+upp7KAbdBFU
	 cevnZyE+gw8wV4tB2o0bOK2R+V1gEhfp65nswL9DXhHK1tu6Q0nv8aJmqR7OgOygDx
	 hKKm0cMxWCr1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B448B8134E;
	Fri, 14 Aug 2026 13:21:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA41139E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C3B660837
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7aFNTrirrYI for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D090607BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D090607BD
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 514758D64C; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8809bcb3beb48174e443828738d20632773e8489
X-Git-Newrev: 924b69122d3a14304c1fdf45109d9df0778fb718
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.514758D64C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/localedef: copy
 license information from package/glibc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/924b69122d3a14304c1fdf45109d9df0778fb718
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Localedef is built from the glibc source code, so license information
is the same.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 187d329d1d0dc9deabca7b4e55f78e6fe6984057)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/localedef/localedef.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 6d82759a1f..026146bb09 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# Use the same VERSION and SITE as target glibc
+# Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
@@ -13,6 +13,15 @@ LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
+LOCALEDEF_LICENSE = \
+	GPL-2.0+ (programs), \
+	LGPL-2.1+, BSD-2-Clause, BSD-3-Clause, BSL-1.0, FSFAP, ISC, other permissive licenses, public domain (library), \
+	LGPL-3.0+ (sysdeps/htl/raise.c, for Hurd only), \
+	GPL-3.0+ (scripts/move-if-change), \
+	GPL-3.0+ WITH Texinfo-exception (manual/texinfo.tex), \
+	GFDL-1.3-or-later (manual)
+LOCALEDEF_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 COPYINGv3 LICENSES manual/fdl-1.3.texi
+
 HOST_LOCALEDEF_DEPENDENCIES = \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

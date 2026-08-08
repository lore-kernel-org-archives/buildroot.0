Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94A5C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 13:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE85180DF0;
	Sat,  8 Aug 2026 13:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7uI5YTKyhcl; Sat,  8 Aug 2026 13:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFC980DD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786196758;
	bh=aEnsRYeE2ICdB9Jhh8wsVtwnQmQnsZ/yHvpBYbLpLt8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hgilCi3x6ketbGVT5vHXyuQhtp5NgU92iukYGeuec3ZVEemrfOJ3+EAN9GZeTDY9c
	 eCl/ts2GQe4Q1hvnIh8EozSU729piShUTfPQWwQXMt98kwl3KrAZeIqpEkLwoUbegn
	 jxslR0jfp4eazIueh6v11AMhMOTbY2FKmyHUvdmQ5uwS14hceipCBr+EE8oSG3ZmQP
	 /8YFoChzk+xHK9eknGZimzou9AhhgrrWr7xLE3P+T0UPYMKkwqnIEo7pubZ1uzNu7q
	 pwRdhaqtJk08AlGvomU/qdiEmcSARc8EYOzJdFv/KgqPj5h6sRCQDz9RV/c5Pe6cdE
	 u7WzvfyhXwzTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFC980DD1;
	Sat,  8 Aug 2026 13:45:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B05BC296
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A26B440596
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dP2SadMNsj3v for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 13:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E496A40592
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E496A40592
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:45:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF2F88CA09; Sat,  8 Aug 2026 13:45:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 14:43:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45b24c43a0ea7122a222f659b27ef2e0baadb4c7
X-Git-Newrev: 187d329d1d0dc9deabca7b4e55f78e6fe6984057
X-Patchwork-Hint: ignore
Message-Id: <20260808134508.DF2F88CA09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/localedef: copy license
 information from package/glibc
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/187d329d1d0dc9deabca7b4e55f78e6fe6984057
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Localedef is built from the glibc source code, so license information
is the same.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/localedef/localedef.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 7a6aa8a043..7a3dbef9a2 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# Use the same VERSION and SITE as target glibc
+# Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc
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

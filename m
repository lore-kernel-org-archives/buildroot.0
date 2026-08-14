Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5A6C5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 494A060811;
	Fri, 14 Aug 2026 13:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsQ1DKdGtRXj; Fri, 14 Aug 2026 13:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E94A608F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713606;
	bh=WmoEtiAVPQgEBym/Tb4KcpPayfPvDOqVAgQe0PGDXBE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F0kWUhXxjTX2kbuAsFe9dmyNoJ78NbvENciQEM/py8Tj3oSXa7BAnAzH6qovHLTb/
	 14lwunNSpbfLgRZ4A+nxXhSH2MKEUrf5fAvXbbYlvvkyz61mDNRNKmHBVpQVEc2yBD
	 u+WB9k77ORni3csbQeFgojIuf2LGOFu5OlN9lQVq0Lt5NaoBNHMjR5wI+dGBDDZULS
	 K5rvwrnmRyAhWjbZjAtf979K7ogx6wakxd3V11WEmDXmBYyf5bUPxDYGjib+yi9RjX
	 +ritQcCE+gweGlGxDL+WYm3SaY4IjL/O8G3bvNXCn4Pax4wj67JGd6HDh/aFTK8s1b
	 SG/LrLpAlGTmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E94A608F1;
	Fri, 14 Aug 2026 13:20:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CAB933B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 738B580E24
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKOe70RJXFbw for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A0C80E48
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7A0C80E48
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC0F28D667; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 15:15:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 62afdce87f394548dbc5d12c96360a16d6e0e1ae
X-Git-Newrev: da2b780f1c14733ea0e62319426adecf966d834e
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.BC0F28D667@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/localedef: copy
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da2b780f1c14733ea0e62319426adecf966d834e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Localedef is built from the glibc source code, so license information
is the same.

(alternative to commit 187d329d1d0dc9deabca7b4e55f78e6fe6984057)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/localedef/localedef.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index d1beb4dafc..2549aaaf99 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# Use the same VERSION and SITE as target glibc
+# Use the same VERSION, SITE and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
@@ -13,6 +13,9 @@ LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
+LOCALEDEF_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
+LOCALEDEF_LICENSE_FILES = COPYING COPYING.LIB LICENSES
+
 HOST_LOCALEDEF_DEPENDENCIES = \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CED6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:48:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8B460EB4
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B8B460EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CCC402B5;
	Mon, 13 Sep 2021 17:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJ49QUBNuRMk; Mon, 13 Sep 2021 17:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CCDE402A6;
	Mon, 13 Sep 2021 17:48:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 201B41BF989
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1022B6076B
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjN2F0HtFuzh for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C8EF6074E
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0931A8A58D; Mon, 13 Sep 2021 17:45:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:36:21 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 0d6c66fa7e7fc06bc1527a970d11af2fb5bc9c42
X-Git-Newrev: 26243e63233afd6b619b42e0e8f9360f9ea7e18e
X-Patchwork-Hint: ignore
Message-Id: <20210913174528.0931A8A58D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/nginx-dav-ext:
 needs libxslt
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26243e63233afd6b619b42e0e8f9360f9ea7e18e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Build is broken since bump to version 3.0.0 in commit
45524f10cd84855868c9be3901c2bd6ea1c9f079 because libxslt is needed
instead of expat since
https://github.com/arut/nginx-dav-ext-module/commit/37772c545314aa4a250066f4e7cbc8806d406fa8:

adding module in /tmp/instance-0/output-1/build/nginx-dav-ext-3.0.0
 + ngx_http_dav_ext_module was configured
checking for PCRE library ... found
checking for PCRE JIT support ... found
Package libxslt was not found in the pkg-config search path.
Perhaps you should add the directory containing `libxslt.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libxslt', required by 'virtual:world', not found
Package libxslt was not found in the pkg-config search path.
Perhaps you should add the directory containing `libxslt.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libxslt', required by 'virtual:world', not found
checking for libxslt ... not found
checking for libxslt in /usr/local/ ... not found
checking for libxslt in /usr/pkg/ ... not found
checking for libxslt in /opt/local/ ... not found

./configure: error: the HTTP XSLT module requires the libxml2/libxslt
libraries. You can either do not enable the module or install the libraries.

Fixes:
 - http://autobuild.buildroot.org/results/8735d20ca7ccf4eda2f79f9400bed70474855b40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c4cae0b7c032e792b208360848659662aee4692f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx-dav-ext/Config.in        | 2 +-
 package/nginx-dav-ext/nginx-dav-ext.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-dav-ext/Config.in b/package/nginx-dav-ext/Config.in
index 1e60321fe3..9e3a0faf28 100644
--- a/package/nginx-dav-ext/Config.in
+++ b/package/nginx-dav-ext/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NGINX_DAV_EXT
 	bool "nginx-dav-ext"
 	depends on BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
-	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBXSLT
 	help
 	  NGINX WebDAV missing commands support (PROPFIND & OPTIONS).
 
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 1b3071851a..cce527e179 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.mk
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -8,6 +8,6 @@ NGINX_DAV_EXT_VERSION = 3.0.0
 NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,v$(NGINX_DAV_EXT_VERSION))
 NGINX_DAV_EXT_LICENSE = BSD-2-Clause
 NGINX_DAV_EXT_LICENSE_FILES = LICENSE
-NGINX_DAV_EXT_DEPENDENCIES = expat
+NGINX_DAV_EXT_DEPENDENCIES = libxslt
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

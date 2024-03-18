Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091F1C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 16:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C92D6608B4;
	Mon, 18 Mar 2024 16:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYjhyLyBnkfT; Mon, 18 Mar 2024 16:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5E4E608C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E4E608C8;
	Mon, 18 Mar 2024 16:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 106DE1BF377
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9FFB60897
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXziJEoJXy6X for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 16:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E0AE6086F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E0AE6086F
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 16:53:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BE0782C6C; Mon, 18 Mar 2024 16:53:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 17:49:43 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f8056479f2a6bc89cf7c7f83331ce52bdc76dff7
X-Git-Newrev: afb9780ab82504da4546eb21d3e929990ecf6935
X-Patchwork-Hint: ignore
Message-Id: <20240318165303.1BE0782C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/nginx-naxsi:
 needs pcre2
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

commit: https://git.buildroot.net/buildroot/commit/?id=afb9780ab82504da4546eb21d3e929990ecf6935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 722b84eafa5e3d9540e0a80bae0c971a3a778358 forgot to update
nginx-naxsi resulting in the following build failure:

In file included from ../nginx-naxsi-d714f1636ea49a9a9f4f06dba14aee003e970834/naxsi_src/naxsi_runtime.c:7:
../nginx-naxsi-d714f1636ea49a9a9f4f06dba14aee003e970834/naxsi_src/naxsi.h:147:3: error: unknown type name 'ngx_regex_compile_t'
  147 |   ngx_regex_compile_t* target_rx;
      |   ^~~~~~~~~~~~~~~~~~~

Fixes: 722b84eafa5e3d9540e0a80bae0c971a3a778358
 - http://autobuild.buildroot.org/results/87bbcf946ccbd8e3bf1ca9f39464f4bb198c8d42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 73c83dbe3e8e212b4b3d563b5ddf86354d6a6b29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx-naxsi/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
index fc2ba9bfe3..d30d653df3 100644
--- a/package/nginx-naxsi/Config.in
+++ b/package/nginx-naxsi/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_NGINX_NAXSI
 	bool "nginx-naxsi"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	# uses pcre, so nginx needs to be built with pcre support
-	select BR2_PACKAGE_PCRE
+	# uses pcre2, so nginx needs to be built with pcre2 support
+	select BR2_PACKAGE_PCRE2
 	help
 	  NAXSI means Nginx Anti XSS & SQL Injection.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

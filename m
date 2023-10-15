Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37292CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C98BD414E0;
	Sun, 15 Oct 2023 18:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C98BD414E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UbCTqx7yPBh; Sun, 15 Oct 2023 18:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A87B9414EC;
	Sun, 15 Oct 2023 18:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87B9414EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3065B1BF947
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A171881E01
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A171881E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNGLLLZ9f5H7 for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D44F881DF2
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D44F881DF2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4D8C855AA; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:22:50 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: a9a7d01b5c7edb2e308a5ddb69ae8955131d9966
X-Git-Newrev: 8f5cf8d488fd77038dede3f8e48f6288d15203a2
X-Patchwork-Hint: ignore
Message-Id: <20231015183251.C4D8C855AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pound: force
 libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f5cf8d488fd77038dede3f8e48f6288d15203a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Force libopenssl to avoid the following build failure with libressl
raised since bump to version 4.8 in commit
525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc:

pound.c: In function 'main':
pound.c:971:27: error: 'l_id' undeclared (first use in this function)
  971 |   CRYPTO_set_id_callback (l_id);
      |                           ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/692db714aa8b0dcfb67fd99977fb6f33c5d4810c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 648502bdbdcf6a8996db897af731fd2219d777d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pound/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pound/Config.in b/package/pound/Config.in
index 60fafff935..aa0f103273 100644
--- a/package/pound/Config.in
+++ b/package/pound/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_POUND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  The Pound program is a reverse proxy, load balancer and HTTPS
 	  front-end for Web server(s). Pound was developed to enable
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

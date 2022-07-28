Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A24FC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2C5681304;
	Thu, 28 Jul 2022 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C5681304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3G3PW_GEMVgn; Thu, 28 Jul 2022 20:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F924812F7;
	Thu, 28 Jul 2022 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F924812F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A58D1BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E9160ADF
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E9160ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w386Dsi7vLFT for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A25560A73
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A25560A73
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 07163867FC; Thu, 28 Jul 2022 20:45:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:56:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3e96b1fb0d0a7245cea6921fcdd7986762e5ec1
X-Git-Newrev: f5e1cec70087df0964200beb81d9269bf2813f6d
X-Patchwork-Hint: ignore
Message-Id: <20220728204520.07163867FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: select pcre2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f5e1cec70087df0964200beb81d9269bf2813f6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ea746f312844df298bbc9a697ca178f3a3c67a8f forgot to select pcre2
resulting in the following build failure:

Makefile:575: *** pcre2 is in the dependency chain of libmodsecurity that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/6528d2611bd1a45c1e94bc6b866de9c33dd90a7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmodsecurity/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index f65ab3de93..b15d808759 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libmodsecurity embeds several mbedtls source files
 	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Libmodsecurity is one component of the ModSecurity
 	  v3 project. The library codebase serves as an
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

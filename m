Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9104DC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102008301F;
	Thu, 11 Aug 2022 11:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 102008301F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6VNI1Lqqufb; Thu, 11 Aug 2022 11:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EB7882FE4;
	Thu, 11 Aug 2022 11:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB7882FE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2719D1BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 028F94032A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 028F94032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63MJ2voBpa_0 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:41:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 464C54023B
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 464C54023B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1EC858711D; Thu, 11 Aug 2022 11:26:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:39:23 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: be070658aa5af1d4719a2c91849d9d7bec14b0bf
X-Git-Newrev: df044f07508e25b0a35c3e3ca94c88ca6ea6e229
X-Patchwork-Hint: ignore
Message-Id: <20220811112655.1EC858711D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libcurl: fix
 dependency symbol typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=df044f07508e25b0a35c3e3ca94c88ca6ea6e229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit 6d07e2618c0 ("package/uacme: requires TLS support in libcurl")
mistyped the BR2_PACKAGE_LIBCURL_FORCE_TLS dependency making the fix
ineffective.

Fixes:
http://autobuild.buildroot.net/results/56ea6cb146df63d1575da9dae3035b3220de875f/
http://autobuild.buildroot.net/results/280b0ed7f9cdb424917373f98c3e4e6b593c6d21/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bf1c9174aca83becc9f44828a8832f04c138fd23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index bc2f8f47f2..218309ed56 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -83,7 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
-	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
+	depends on !BR2_PACKAGE_LIBCURL_FORCE_TLS
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BE2C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71FE847A8;
	Sat, 14 Sep 2024 08:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BCYNCCng8ra; Sat, 14 Sep 2024 08:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4203D84761
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4203D84761;
	Sat, 14 Sep 2024 08:23:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B03841BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1687E4042B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yMpxMvgGBYM for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C45C40243
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C45C40243
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57FAE86F5A; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:15:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1961a86751cc550dd54e0c68b3bd131fad3168d4
X-Git-Newrev: 9178a339cf0af2348b5ef2e38c17292f904b2b8e
X-Patchwork-Hint: ignore
Message-Id: <20240914082254.57FAE86F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: fix design
 typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=9178a339cf0af2348b5ef2e38c17292f904b2b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-for-modern-cpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/json-for-modern-cpp/Config.in b/package/json-for-modern-cpp/Config.in
index b045cba684..34fc4e29e2 100644
--- a/package/json-for-modern-cpp/Config.in
+++ b/package/json-for-modern-cpp/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  Json for modern c++ has the following desing goals in mind:
+	  Json for modern c++ has the following design goals in mind:
 
 	  - Intuitive syntax. In languages such as Python, JSON feels
 	    like a first class data type. All the operator magic of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

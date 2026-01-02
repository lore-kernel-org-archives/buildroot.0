Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8234EEED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF1D4087B;
	Fri,  2 Jan 2026 17:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URGL34ctJbir; Fri,  2 Jan 2026 17:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5CF406EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374699;
	bh=48Bwwp2b5sc5xJ+gB6flqd4xsdRG3XuWBX61CyjuIkU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g1pxQzApAhlAZwdIeBfTC6kXm6Xq1SQesZDDHe8H0j4/NbyernzSYSuk3I1Lbg4mj
	 gyj87d+t92g3pPcD+cxuOXcS50YgGO/YTcHDRuDXgLWVcE9Ujo0JJUohKS68g1i9Pz
	 euQUtwRDBASLBaD4ABwC4yuHuJSZ3tKPO5Ehm29u5xGpdSwS4K6wZjIaH5JpFKWbNW
	 YrEKDtPLbfY18Z0WN556o/YztYlIBYBfkqRA7vmfE46Ma/M09E4dVM7TvgZHeq0Apr
	 FDPn7MhDL32X3Pf04MdxGkEsMmKIpPwE3Odid51UapcqBVXF5t8L6RgcnzBBJBgK8d
	 /i1Ta5zCSK5Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5CF406EF;
	Fri,  2 Jan 2026 17:24:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30E8E440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 185D8406D0
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bpy0H6OTDLXD for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B660406AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B660406AF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:24:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F6768803B; Fri,  2 Jan 2026 17:24:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:23:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7f6ed49f892b15b22ac3a99b2c926c1716e0304
X-Git-Newrev: c659e0383d8f66b9bf89b5a30de89476ef48d5bc
X-Patchwork-Hint: ignore
Message-Id: <20260102172453.2F6768803B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcpprestsdk: add dependency on
 Boost.System
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c659e0383d8f66b9bf89b5a30de89476ef48d5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcpprestsdk searches for the Boost.System module in its
CMakeLists. Hence it should be selected as a dependency.

This does not fix any build failure, as boost-system was implicitly
selected by one of the other boost-* options that this package
selects, but an upcoming commit is going to change how boost-system is
selected by other boost-* modules, making this preparation change
necessary.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcpprestsdk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index e533b30393..7688021ed0 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_RANDOM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_OPENSSL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

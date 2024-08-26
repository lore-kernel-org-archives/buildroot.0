Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF8AC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 11:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F4F4017D;
	Mon, 26 Aug 2024 11:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPNJXBgQ0LVk; Mon, 26 Aug 2024 11:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D494540189
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D494540189;
	Mon, 26 Aug 2024 11:58:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D09821BF3AD
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 11:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF72C60586
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 11:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T736kg299Gy for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 11:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B68F600B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B68F600B3
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B68F600B3
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 11:58:38 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 62DD43537AF7; Mon, 26 Aug 2024 13:58:36 +0200 (CEST)
Date: Mon, 26 Aug 2024 13:58:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zsxt7Db6yjMX8x1x@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724673516; bh=4dByHPM+lQteEWW804flc1/unw48JDOBIeIzmzwO6i0=;
 h=Date:From:To:Subject:From;
 b=DcrU35aaz6dJFUThGoOp4GqsFakfLwXWWYNMgvkitPZ48uWIzW8+R+OjKolh7kHiC
 YKBi9Sb4LgvjB2Bcgoh+OMtQckHhTZ44/eKqQ8uOA9WPo78Ax84ETsVSQvXkcD14lt
 F3iuZF3OxGuuw8atjd8laOPuhwBOQrSbxaZyFHZEtcRrfnkdcN60Rw27OyDr8/RbLS
 LZd6kTtHGAGOiMTOAUTbsIRLprZxnxFAzfz3Zq0R/d/sepIlFNYeqMi0KU2Gh94Pe+
 st45eY0vYlx1T4uf8jWpyiA+ymjwRODgy0DeAAaYXYHlRIGvqKaqzBykaG2L/wTC9A
 d1b1lTueOEBYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=DcrU35aa
Subject: [Buildroot] [PATCH] package/fbset: update download URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

 http://autobuild.buildroot.org/results/13e/13e28650fc58fc62c801a664d79616c6dd39a8ac

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/fbset/Config.in | 2 +-
 package/fbset/fbset.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fbset/Config.in b/package/fbset/Config.in
index b4ef41f0a4..9422d5bca4 100644
--- a/package/fbset/Config.in
+++ b/package/fbset/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_FBSET
 	  simple and unique interface to access different kinds of
 	  graphic displays.
 
-	  http://users.telenet.be/geertu/Linux/fbdev/
+	  http://g33rt.be/migrated/Linux/fbdev/
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 8d2a477f8b..526cba40d3 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FBSET_VERSION = 2.1
-FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_SITE = http://g33rt.be/migrated/Linux/fbdev
 FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPL-2.0
 FBSET_LICENSE_FILES = fbset.c
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

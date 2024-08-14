Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46C5C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 13:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D6E380DAD;
	Wed, 14 Aug 2024 13:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F12iu5tXOuJI; Wed, 14 Aug 2024 13:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8657680DBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8657680DBB;
	Wed, 14 Aug 2024 13:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA2CC1BF32E
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 13:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 979E140404
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 13:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mQrnaEH56Gc for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 13:25:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F51140402
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F51140402
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F51140402
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 13:25:08 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3E0C235206C6; Wed, 14 Aug 2024 15:25:06 +0200 (CEST)
Date: Wed, 14 Aug 2024 15:25:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrywMhZuGZwfeXvU@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723641906; bh=NiB3YLCE+rHXze2yvkmA5GN6HRqD/KEQ0k5nqkG3C9k=;
 h=Date:From:To:Subject:From;
 b=IhGLpdPpgh9XhPK654REapTU7U0r90GoMSg0FrFJPTtTsyOS4OgSP1V289Z10/xIG
 aFwq/py9SJViWF3RzZNsntQpucloJu0xmBSFs4jfTSJ8GBZgw7OhnCXMbcoj1zdOLZ
 AvHZdYw8XbQMD15+Zxl+9CNFc3u+U97Sr9z3PSYjdY4fvQaekAEVtIEfTk9AwyxewJ
 Q8EzajzfnyMmqf0cG7bbduyiZpEfs8HEjUP0KzrQ750/phGoAnvqdmTU7zndDGaIc9
 7c64EILnUNyOuK5D0P+5u9/+D8SNh5r5/mCQ+9YpsZXZVyrgNSSKsPzFyuMFcQbxIL
 ismb5TmdPAyTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=IhGLpdPp
Subject: [Buildroot] [PATCH] package/hiawatha: update homepage URL
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

The download and homepage URL for this project have been
updated. The old site no longer works.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/hiawatha/Config.in   | 2 +-
 package/hiawatha/hiawatha.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
index 0c35734c34..8bcee3f098 100644
--- a/package/hiawatha/Config.in
+++ b/package/hiawatha/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_HIAWATHA
 	  pipelining, keep alive connections, URL rewriting and many
 	  more.
 
-	  http://www.hiawatha-webserver.org/
+	  https://hiawatha.leisink.net/
 
 if BR2_PACKAGE_HIAWATHA
 
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 3e9cf2571b..4c94f0067e 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HIAWATHA_VERSION = 11.2
-HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
+HIAWATHA_SITE = https://hiawatha.leisink.net/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

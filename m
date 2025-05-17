Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C493C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC1270FFB;
	Mon, 19 May 2025 11:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32KHgAjUO_sl; Mon, 19 May 2025 11:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC72A70FF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC72A70FF9;
	Mon, 19 May 2025 11:03:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4990C1BF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E48541A3F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GH3JHUEGFcVW for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E32411CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34E32411CD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3368383BC0; Mon, 19 May 2025 10:40:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:22:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4333f4d921064adca6f6e5f454e43e764d1b44de
X-Git-Newrev: 0bae9b29cd2a6008c5945747a45dfe8af54fae35
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.3368383BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nodejs: add
 BR2_PACKAGE_HAS_NODEJS
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bae9b29cd2a6008c5945747a45dfe8af54fae35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit ccf3536fcbfb2f3744ef7ccf1ed1b75d6d1f22ac ("package/nodejs: make
target nodejs package virtual") forgot to introduce the
BR2_PACKAGE_HAS_<foo> boolean option matching the newly introduced
virtual package, causing check package warnings.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/Config.in            | 3 +++
 package/nodejs/nodejs-src/Config.in | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 2a0074b5a4..4048e18bd4 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -87,6 +87,9 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 
 endif
 
+config BR2_PACKAGE_HAS_NODEJS
+	bool
+
 config BR2_PACKAGE_PROVIDES_NODEJS
 	string
 	default "nodejs-src"
diff --git a/package/nodejs/nodejs-src/Config.in b/package/nodejs/nodejs-src/Config.in
index 90b061f616..0428fe1f8a 100644
--- a/package/nodejs/nodejs-src/Config.in
+++ b/package/nodejs/nodejs-src/Config.in
@@ -1,2 +1,3 @@
 config BR2_PACKAGE_NODEJS_SRC
 	bool
+	select BR2_PACKAGE_HAS_NODEJS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C7EC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94F384083B;
	Sat, 17 May 2025 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VbxCs6AetS9; Sat, 17 May 2025 21:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC9074085C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC9074085C;
	Sat, 17 May 2025 21:20:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E52201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 136944083B
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-DaSbyOy0Uk for <buildroot@buildroot.org>;
 Sat, 17 May 2025 21:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C9BF40836
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C9BF40836
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5783B7FE79; Sat, 17 May 2025 21:20:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 22:58:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa017484eaa7410d9cad9e8fd11de2ca613bd288
X-Git-Newrev: 7319e4af19c8af1a90c7b2c95914dcb313033cbb
X-Patchwork-Hint: ignore
Message-Id: <20250517212043.5783B7FE79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5webengine: add missing opus
 dependency
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7754075287525110972=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7754075287525110972==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7319e4af19c8af1a90c7b2c95914dcb313033cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package opus is selected but it is not listed in the dependencies.

This adds opus to QT5WEBENGINE_DEPENDENCIES.

Fixes:

	$ make qt5webengine
	(...)
	ERROR: Feature 'webengine-system-opus' was enabled, but the pre-condition 'config.unix && libs.webengine-opus' failed.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt5/qt5webengine/qt5webengine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index a97d918cfd..6b656a7536 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -78,6 +78,7 @@ QT5WEBENGINE_DEPENDENCIES += \
 	libvpx \
 	libxml2 \
 	libxslt \
+	opus \
 	snappy \
 	webp
 

--===============7754075287525110972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7754075287525110972==--

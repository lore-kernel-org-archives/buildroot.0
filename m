Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA227C5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF3D8403E;
	Sat, 31 May 2025 17:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzDfygRgaCnn; Sat, 31 May 2025 17:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E74F784047
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74F784047;
	Sat, 31 May 2025 17:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65926127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A33D060793
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDZ7BRba_zNx for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C91ED607F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C91ED607F0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C774D87803; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:24:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 48515f26cd5a6dda649757fa3c95c27cc1ad24f6
X-Git-Newrev: 47713b4ac9a38c57d6e38601c0c6a030ee777b7e
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.C774D87803@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5webengine: add
 missing opus dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2901254500778772818=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2901254500778772818==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=47713b4ac9a38c57d6e38601c0c6a030ee777b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The package opus is selected but it is not listed in the dependencies.

This adds opus to QT5WEBENGINE_DEPENDENCIES.

Fixes:

	$ make qt5webengine
	(...)
	ERROR: Feature 'webengine-system-opus' was enabled, but the pre-condition 'config.unix && libs.webengine-opus' failed.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 7319e4af19c8af1a90c7b2c95914dcb313033cbb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
 

--===============2901254500778772818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2901254500778772818==--

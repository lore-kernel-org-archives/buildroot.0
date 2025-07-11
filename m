Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1EDC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 19:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF3C26088B;
	Fri, 11 Jul 2025 19:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71SJ1xrv28qt; Fri, 11 Jul 2025 19:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D7060ACF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D7060ACF;
	Fri, 11 Jul 2025 19:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91FFE119
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FEE183BE7
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id neWI_af6H_zD for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 19:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCB7683BE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCB7683BE5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:45:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAFE2863ED; Fri, 11 Jul 2025 19:45:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 21:44:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c0a713c66bc5b7712f2077947e5b90312127827
X-Git-Newrev: b4bd1edcd018159a61ad84bede0c896e956eacbd
X-Patchwork-Hint: ignore
Message-Id: <20250711194555.BAFE2863ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump version to
 2.4.64
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4bd1edcd018159a61ad84bede0c896e956eacbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2025-53020, CVE-2025-49812, CVE-2025-49630, CVE-2025-23048,
CVE-2024-47252, CVE-2024-43394, CVE-2024-43204 & CVE-2024-42516.

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.64

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index da0b1f1f17..748be01de7 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.63.tar.bz2.{sha256,sha512}
-sha256  88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab  httpd-2.4.63.tar.bz2
-sha512  a804ca564dfee5907fe4ce4f36884815bace0621bc7b8c9aa7c99472a954aa19cb13733f90678ff3d58ab3c76cc0e33a27e1035dc1d8cb597a9622154c59ef48  httpd-2.4.63.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.64.tar.bz2.{sha256,sha512}
+sha256  120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29  httpd-2.4.64.tar.bz2
+sha512  299cb0d87a7e0e0a99d22bba7349b6b07c69222897410f9670af29896288d1f4e1da81d22ac9e1d8d6ea096e88044ab1dd34555b40a4b1b1cb3fd4b1d1897a7a  httpd-2.4.64.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 14676a5aee..7e9fb522b5 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.63
+APACHE_VERSION = 2.4.64
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

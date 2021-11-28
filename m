Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640ACC433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 13:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1157D41C4A;
	Sun, 28 Nov 2021 13:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBFwsOxe9-Sl; Sun, 28 Nov 2021 13:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59EF041C51;
	Sun, 28 Nov 2021 13:36:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC5031BF2CF
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7EDF60725
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnI2qIneknpK for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 13:36:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07D33606F9
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 13:36:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 830119000C; Sun, 28 Nov 2021 13:31:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 14:35:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 046cde5a27ed39526b90013d53bd1296ed4cced8
X-Git-Newrev: d317b76458163f718db9fc274e7a7839e4a39b43
X-Patchwork-Hint: ignore
Message-Id: <20211128133126.830119000C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: security bump to
 version 3.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d317b76458163f718db9fc274e7a7839e4a39b43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support configurable limit on depth of JSON parsing (possible DoS issue)

https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/libmodsecurity.hash | 4 ++--
 package/libmodsecurity/libmodsecurity.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index dff39569c1..341dbc3765 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.5/modsecurity-v3.0.5.tar.gz.sha256
-sha256  751bf95a7a8d39c440d0c26ec1f73961550ca2eb2ac9e2e7a56dce2dd7b959e9  modsecurity-v3.0.5.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.6/modsecurity-v3.0.6.tar.gz.sha256
+sha256  06315d9a32fc830997178f30a69e933c9c2364b263a2f036959bebc4dde59a08  modsecurity-v3.0.6.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index be46eb6e02..8fa3d59845 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.5
+LIBMODSECURITY_VERSION = 3.0.6
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF76CFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 20:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC3F16075F;
	Sun,  6 Oct 2024 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xV3kvY9DkZt; Sun,  6 Oct 2024 20:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79AE1606F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79AE1606F6;
	Sun,  6 Oct 2024 20:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C975E1BF279
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C56F1403A3
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 20:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOTzCN5qJLjy for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 20:46:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F9540398
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0F9540398
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 20:46:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8261851EF; Sun,  6 Oct 2024 20:46:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Oct 2024 22:44:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fd8131dcb3939fba67a34626addb3260a733cb6
X-Git-Newrev: 434750665a47a69aaa58fe84c61016b1ece3dce6
X-Patchwork-Hint: ignore
Message-Id: <20241006204632.C8261851EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pv: bump to version 1.8.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=434750665a47a69aaa58fe84c61016b1ece3dce6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://codeberg.org/a-j-wood/pv/src/tag/v1.8.14/docs/NEWS.md

This commit also adds a comment in the hash file, with the pgp key ID
and the URL where it can be retrieved.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pv/pv.hash | 4 +++-
 package/pv/pv.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index cac506a83f..e6b1b9bd69 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  e2bde058d0d3bfe03e60a6eedef6a179991f5cc698d1bac01b64a86f5a8c17af  pv-1.8.13.tar.gz
+# using key: 4267B4F90F2678A112169BD61D1EF7581B45E9A0
+# from: https://codeberg.org/a-j-wood.gpg
+sha256  0cc18811a4809a587d4b11d47691bbc0ad83a5d95d2c2606af74ea7b4a674756  pv-1.8.14.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 1434f8a88b..0c0fc55fab 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.8.13
+PV_VERSION = 1.8.14
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

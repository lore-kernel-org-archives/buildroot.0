Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784FFC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06CC282288;
	Sun,  7 May 2023 19:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06CC282288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJx_b6uWOfKk; Sun,  7 May 2023 19:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2910982162;
	Sun,  7 May 2023 19:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2910982162
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 976C51BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67C2A40923
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C2A40923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qNoGgUssDckF for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D99E40917
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D99E40917
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4901786021; Sun,  7 May 2023 19:06:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 20:57:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00dc5ccd01b7dc981faeaf5aedef1d1f48df865b
X-Git-Newrev: 771e120e8ea3b310db1506c9dbd1574df4922359
X-Patchwork-Hint: ignore
Message-Id: <20230507190640.4901786021@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freetype: bump version to 2.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=771e120e8ea3b310db1506c9dbd1574df4922359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/

Updated license hash due to upstream commits:

"fix spelling err in LICENSE.txt"
https://gitlab.freedesktop.org/freetype/freetype/-/commit/c0b4f6a8625a39ecd4c323d74ddec0e94fca214d

[autofit] Don't depend on 'hb-ft'.
https://gitlab.freedesktop.org/freetype/freetype/-/commit/ebe7e9128cdf81cb0a0d27fe293ecff96f6c98a8
Since we build freetype without harfbuzz support anyway, the affected
files are not compiled (the code is entirely guarded), so no changes to
the license information of this package are necessary.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freetype/freetype.hash | 8 ++++----
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index a558a3e846..60eb8dbb1d 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.1/
-sha1  5133eed28a7624ffabbf6d00aa3f68b841d62d80  freetype-2.12.1.tar.xz
-sha256  4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f  freetype-2.12.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/
+sha1  6393c1451c2f1c5f83aed5ea92d280af078e27d9  freetype-2.13.0.tar.xz
+sha256  5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c  freetype-2.13.0.tar.xz
 
 # Locally calculated
-sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
+sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
 sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 36ef3cb527..4d7c4cd0d5 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.12.1
+FREETYPE_VERSION = 2.13.0
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

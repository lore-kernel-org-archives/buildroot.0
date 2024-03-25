Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334E6C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 20:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA0748161D;
	Mon, 25 Mar 2024 20:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bS1li7idKgLW; Mon, 25 Mar 2024 20:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F350E81755
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F350E81755;
	Mon, 25 Mar 2024 20:47:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC6451BF3E3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5E2B40BEA
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOF_27kzXrZJ for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 20:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF6B40B3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAF6B40B3F
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 20:47:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 946AB84013; Mon, 25 Mar 2024 20:47:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 21:42:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f08dc612c2a52a297c50bc047d5fabd7ef7317c
X-Git-Newrev: dd2eec6b2fc8fd949ff37b3572fee21850851e14
X-Patchwork-Hint: ignore
Message-Id: <20240325204740.946AB84013@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p7zip: bump to version v17.05
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5008502295479646652=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5008502295479646652==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dd2eec6b2fc8fd949ff37b3572fee21850851e14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project now has its own group on github, so switch to that one. Also
update the Config.in URL to point to that one - the sourceforge project
is pretty much abandoned.

What's Changed

  - add UTF-8 support for Client7z by @flyfishzy in #214
  - fix issue 130 by @jinfeihan57 in 295dac8

Signed-off-by: André Zwing <nerv@dawncrow.de>
[Arnout: also update URL; extend commit message]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/p7zip/Config.in  | 2 +-
 package/p7zip/p7zip.hash | 2 +-
 package/p7zip/p7zip.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
index be2206eb76..f1b80d2d77 100644
--- a/package/p7zip/Config.in
+++ b/package/p7zip/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_P7ZIP
 
 	  7-Zip is a file archiver with highest compression ratio.
 
-	  http://sourceforge.net/projects/p7zip
+	  https://github.com/p7zip-project/p7zip
 
 if BR2_PACKAGE_P7ZIP
 
diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
index 0048777d89..f0b9c27113 100644
--- a/package/p7zip/p7zip.hash
+++ b/package/p7zip/p7zip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ea029a2e21d2d6ad0a156f6679bd66836204aa78148a4c5e498fe682e77127ef  p7zip-17.04.tar.gz
+sha256  d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6  p7zip-17.05.tar.gz
 sha256  555806657dcf0f1e720b581c52643c195ec86ae3f00bd18cc66d2e0f88ffa210  DOC/License.txt
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index b6c5adae26..803fd38b7f 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-P7ZIP_VERSION = 17.04
-P7ZIP_SITE = $(call github,jinfeihan57,p7zip,v$(P7ZIP_VERSION))
+P7ZIP_VERSION = 17.05
+P7ZIP_SITE = $(call github,p7zip-project,p7zip,v$(P7ZIP_VERSION))
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
 P7ZIP_CPE_ID_VENDOR = 7-zip

--===============5008502295479646652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5008502295479646652==--

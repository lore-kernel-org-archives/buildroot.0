Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C72AC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 13:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7075F418F8;
	Sat, 23 Mar 2024 13:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTsDPgcbjhuO; Sat, 23 Mar 2024 13:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7352B4191B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7352B4191B;
	Sat, 23 Mar 2024 13:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C21081BF84C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74AB5827AA
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 13:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OooBXf7_Nupa for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD3E08235B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD3E08235B
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B62B83698; Sat, 23 Mar 2024 13:49:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 14:34:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f94b3b35423a3d7b93e7fdd67e97dea6e33de60
X-Git-Newrev: 38a20a0998117f3debb4de06e209ba5d82bb7a9d
X-Patchwork-Hint: ignore
Message-Id: <20240323134947.9B62B83698@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fdk-aac: bump to version 2.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=38a20a0998117f3debb4de06e209ba5d82bb7a9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change log: https://github.com/mstorsjo/fdk-aac/blob/master/ChangeLog

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fdk-aac/fdk-aac.hash | 5 ++---
 package/fdk-aac/fdk-aac.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index b10d5f92b1..ae5c81b30f 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,6 +1,5 @@
 # From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
-sha1  579b34e8174b4feb21a9c598695f5ff4a7ceef8c  fdk-aac-2.0.2.tar.gz
-md5  b41222194b31f570b3132bd622a9aef6  fdk-aac-2.0.2.tar.gz
+sha1  29f5485a6ec718335243440600ff78418cd4765b  fdk-aac-2.0.3.tar.gz
 # Locally computed:
-sha256  c9e8630cf9d433f3cead74906a1520d2223f89bcd3fa9254861017440b8eb22f  fdk-aac-2.0.2.tar.gz
+sha256  829b6b89eef382409cda6857fd82af84fabb63417b08ede9ea7a553f811cb79e  fdk-aac-2.0.3.tar.gz
 sha256  95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index c66f6df797..01a100fa94 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 2.0.2
+FDK_AAC_VERSION = 2.0.3
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

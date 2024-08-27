Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70775C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 17:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3994C404E8;
	Tue, 27 Aug 2024 17:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSPsKWmr5Xfj; Tue, 27 Aug 2024 17:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142E0404EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142E0404EF;
	Tue, 27 Aug 2024 17:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6B661BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 17:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93DFC402EA
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 17:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN43qkOdwyRJ for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 17:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A579240131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A579240131
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 17:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92CA381809; Tue, 27 Aug 2024 17:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:59:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62ccb5b25d421f5df5a6ee7a88db21159f3c5e23
X-Git-Newrev: 180216631a64d5319ab0420cf7b37acb4fa0799c
X-Patchwork-Hint: ignore
Message-Id: <20240827170011.92CA381809@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/szip: update SZIP_SITE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=180216631a64d5319ab0420cf7b37acb4fa0799c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix broken link.

While at it, use $(SZIP_VERSION) inside SZIP_SITE instead of
duplicating the version.

Fixes:

 http://autobuild.buildroot.org/results/35d/35d08103bbd0da22a5e111f1f86f28aba7062ee6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/szip/szip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/szip/szip.mk b/package/szip/szip.mk
index 7a8a5a82e6..869fc9c358 100644
--- a/package/szip/szip.mk
+++ b/package/szip/szip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SZIP_VERSION = 2.1.1
-SZIP_SITE = http://www.hdfgroup.org/ftp/lib-external/szip/2.1.1/src
+SZIP_SITE = https://docs.hdfgroup.org/archive/support/ftp/lib-external/szip/$(SZIP_VERSION)/src
 SZIP_LICENSE = szip license
 SZIP_LICENSE_FILES = COPYING
 SZIP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

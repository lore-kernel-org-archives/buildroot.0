Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558C3C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20EBA4203B;
	Tue,  6 Feb 2024 22:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BETMHWbYyOxT; Tue,  6 Feb 2024 22:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4414209B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4414209B;
	Tue,  6 Feb 2024 22:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D10B1BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEB164031F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQX8JfJAhkcf for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C689A403C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C689A403C6
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:31:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB378870FE; Tue,  6 Feb 2024 22:31:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 23:29:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22f9ce63a30200696dbcbe6ae3a6cc417f007979
X-Git-Newrev: 568bd6c39d1a28f27d6509d885e09de281953e63
X-Patchwork-Hint: ignore
Message-Id: <20240206223127.BB378870FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: bump version to go1.21.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=568bd6c39d1a28f27d6509d885e09de281953e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.21.7 (released 2024-02-06) includes fixes to the compiler, the go command,
the runtime, and the crypto/x509 package.

https://go.dev/doc/devel/release#go1.21.7

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bee10089a7..d008019e94 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  124926a62e45f78daabbaedb9c011d97633186a33c238ffc1e25320c02046248  go1.21.6.src.tar.gz
+sha256  00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6  go1.21.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f9d31aacac..9efd4a3123 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.6
+GO_VERSION = 1.21.7
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

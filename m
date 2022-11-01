Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7535C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB5481A30;
	Tue,  1 Nov 2022 22:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB5481A30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xljuLVQFByfK; Tue,  1 Nov 2022 22:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FBA38190B;
	Tue,  1 Nov 2022 22:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FBA38190B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83671BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A023541605
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A023541605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Sj05BGjFFmU for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:21:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A48F41625
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A48F41625
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27A0687571; Tue,  1 Nov 2022 22:21:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:21:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8bb02d2d021acae72c92b954bb148debc70ca50
X-Git-Newrev: 53716828cfad5b9fe51d9edc6e4a351601f0f152
X-Patchwork-Hint: ignore
Message-Id: <20221101222141.27A0687571@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to go 1.19.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=53716828cfad5b9fe51d9edc6e4a351601f0f152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.19.3 (released 2022-11-01) includes security fixes to the os/exec and
syscall packages, as well as bug fixes to the compiler and the runtime.

Fixes: CVE-2022-41716

NOTE: this CVE is specific to Windows and is not directly relevant to Buildroot.

https://go.dev/doc/devel/release#go1.19
https://github.com/golang/go/issues?q=milestone%3AGo1.19.3+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index f944bd5304..866e7e0d59 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b  go1.19.2.src.tar.gz
+sha256  18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212  go1.19.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fe4d3a29a9..fd4caa2e5a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.2
+GO_VERSION = 1.19.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

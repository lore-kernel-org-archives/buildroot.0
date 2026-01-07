Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969F7CFD637
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F8F38204A;
	Wed,  7 Jan 2026 14:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMVFwDE9vqAQ; Wed,  7 Jan 2026 14:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65FC38169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794933;
	bh=tCDwZ7IAE8J7YysFcHFLhcbAJnai7FboM8KxpKnRN0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pZTeN6s7zyO9FBG8v5kkireAZ0Ze9hPuFMGH9jO/LRtww5gCVHHIqpKdyJXjBFv5K
	 yZYg0WoNjaR/rqOgNgnrM2xroUZNiDx8wEmB8N/BWwH08vkZd+HOzfslsCSiEutlXX
	 WTZ8TiRi3PyplysvrKDzl3NDqtihV82JFwxxr6tOY8+d9W3XHQCbP3bxOgW0oXhQ+E
	 /Dh1ww7gUAQTt6ZfNZsd9NpT7tspEdqQ8J8xVrkzoDmbgOdznxymvZwBWe++k3/nHN
	 +R7fphE/ssUHKWvJu7k32wPhUVb3J3+wPrTHMaTZkEHynlYtXm8eAgf/eJu4NUS7K6
	 DI33EN5i/+dxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FC38169A;
	Wed,  7 Jan 2026 14:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BCBD970
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432D0409AD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkwDRjjpz5Ja for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78CCD4099D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78CCD4099D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68315883AA; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 15:03:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3df051b7d75013cde33400b1250c16ea51701100
X-Git-Newrev: f3346846a9cda863873bc84a486528af245bc758
X-Patchwork-Hint: ignore
Message-Id: <20260107140851.68315883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luv: bump version to 1.51.0-1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3346846a9cda863873bc84a486528af245bc758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/luvit/luv/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 4cdb91729f..f47257f37e 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  567a6f3dcdcf8a9b54ddc57ffef89d1e950d72832b85ee81c8c83a9d4e0e9de2  luv-1.43.0-0.tar.gz
+sha256  dc706d9141c185bdce08b6fc8a9d4df05c3ac3676809ee4e9e37e1553d821237  luv-1.51.0-1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 36fcdc742e..0349f7afba 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.43.0-0
+LUV_VERSION = 1.51.0-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

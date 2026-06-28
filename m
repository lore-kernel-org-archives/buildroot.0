Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD012C43458
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E5A40C7A;
	Sun, 28 Jun 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9Ro8iie4jd9; Sun, 28 Jun 2026 13:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94DFF40CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782653630;
	bh=zjcsF9OjnBftKnlLYp00FP/4mPeHUpG7u66BMlUZ62A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MVLT4sJ+N4onB5eHmp9L1mz0SqgUBdJ8ofrVHHeLR4RIK7Go3dcLpXd7BYoEm6Skk
	 UT8K1l1+QCszN+xIBDlydtYQAux/6wbzYmmqPATVkuEY712Q/8BgdAR1QKA0nFsouO
	 HHqGywwvSquwmCurUK+klQAx23Z8XoV3n8/DSpwTzYnr0cCIWUq++4oFbdx1ZaVtjk
	 yZ9wjRTm8r66/qTGY3EVr9Q6W5DVlj2FhkY9kGTHvx6AlvDR/xiqcpumyqpJ7Pr8zN
	 wqZCbThlG4LzWjZECNvpfi7yhuy7pcwrFJkO1ebHXupZNmRSNypAy2X88A91bxGasM
	 53y5Szne32KQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94DFF40CB7;
	Sun, 28 Jun 2026 13:33:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 630272F3
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5525881584
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3spOqZAGa28 for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 13:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D81D8156A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D81D8156A
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49FFF85FA4; Sun, 28 Jun 2026 13:33:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jun 2026 15:32:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b1f6f7a480765b3d6ca07691095035a8b899eaf
X-Git-Newrev: a5c88de2808a67ade2d9dacb7e03447d35908da6
X-Patchwork-Hint: ignore
Message-Id: <20260628133318.49FFF85FA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.1.x, 7.0.x,
 6.18.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a5c88de2808a67ade2d9dacb7e03447d35908da6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
- 7.1.1 -> 7.1.2
- 7.0.13 -> 7.0.14
- 6.18.36 -> 6.18.37

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/{7.1.1 => 7.1.2}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 6 +++---
 package/linux-headers/{6.18.36 => 6.18.37} | 0
 package/linux-headers/{7.0.13 => 7.0.14}   | 0
 package/linux-headers/{7.1.1 => 7.1.2}     | 0
 package/linux-headers/Config.in.host       | 6 +++---
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/7.1.1 b/linux/7.1.2
similarity index 100%
rename from linux/7.1.1
rename to linux/7.1.2
diff --git a/linux/Config.in b/linux/Config.in
index 0aa35bd028..320a2c5574 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 33ee9dc232..e611478e30 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  5215fa3541dc7e7f5bcd51bf7e57f169cec6fce508ca54e3dc85fdee14371d7d  linux-7.1.1.tar.xz
-sha256  3c81edd0f716aca3dd48dff691681827580cc53d35a8eec3be47d346d1f89913  linux-7.0.13.tar.xz
+sha256  37198c93727be247c9fb5309bb86cd5e496c61e5322cd8c4eca9476bb0b5883f  linux-7.1.2.tar.xz
+sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fbab86c9f471c81075b280cca30bd85d790c060063a1245859b6344b07c9c44e  linux-6.18.36.tar.xz
+sha256  a83cd200e6646db52866b8309e9137b9e9048b613cbda10ced2b811aae125255  linux-6.18.37.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.36 b/package/linux-headers/6.18.37
similarity index 100%
rename from package/linux-headers/6.18.36
rename to package/linux-headers/6.18.37
diff --git a/package/linux-headers/7.0.13 b/package/linux-headers/7.0.14
similarity index 100%
rename from package/linux-headers/7.0.13
rename to package/linux-headers/7.0.14
diff --git a/package/linux-headers/7.1.1 b/package/linux-headers/7.1.2
similarity index 100%
rename from package/linux-headers/7.1.1
rename to package/linux-headers/7.1.2
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a890c8f161..54fa189217 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -481,9 +481,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.176"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.36"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.13"	if BR2_KERNEL_HEADERS_7_0
-	default "7.1.1"		if BR2_KERNEL_HEADERS_7_1
+	default "6.18.37"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
+	default "7.1.2"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

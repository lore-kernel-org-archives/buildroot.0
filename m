Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50716C53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 19:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2A1560609;
	Wed, 29 Jul 2026 19:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQPhRCJ4t_oF; Wed, 29 Jul 2026 19:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A5F60624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785352387;
	bh=ANNHgu7355B1bnHGOpJKMKQGlohGvUgAQEIWZKIsaCU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gKStIEyPjhoW+DYjfb5pA/INMtgX2bDuZi2/gpBMc6LPvbZqnJjBvbdI94yh6gdok
	 o9SU78sLhg+gbHd1vnt4iDxm0HO/x95r4j59DssSqcAE5tpZNB5If2WoMU/5aXeBfn
	 EyUVtFQ/T0osGl5DMeDrxY30P8vO1NWpWZlQKlybK/GKd9bns8H2BvhHGfOJ4djV43
	 ADQ5fkcz5ZeUens/9CGvh66g8GFTj07Xg+d03+DX8RoFRZ1HbuY8FqvfUJyJViwKMO
	 +gWLgBUHSrJPLAHcZnNBG4F3QWc3GGL8mKnUk3779ZmCiG6J2DojopVM7jpoU/2tmx
	 /E2IMzP6HYhIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22A5F60624;
	Wed, 29 Jul 2026 19:13:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6602E1
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FA7280DFA
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWjVtAIIUzdf for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 19:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5397780DF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5397780DF8
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09D508B52D; Wed, 29 Jul 2026 19:12:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 20:58:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 928a19f6f2288449d90435908b47aae3d03f99d2
X-Git-Newrev: 4c1a81106e0e781cc662a8956d271dd59e9e5945
X-Patchwork-Hint: ignore
Message-Id: <20260729191221.09D508B52D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/amazon-ecr-credential-helper: bump
 to 0.12.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c1a81106e0e781cc662a8956d271dd59e9e5945
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/awslabs/amazon-ecr-credential-helper/blob/v0.12.0/CHANGELOG.md

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash | 2 +-
 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
index 250ba6d4ff..04668d6478 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -1,3 +1,3 @@
 # Localy computed
-sha256  4114241888385d3794ca639f40bb7805f31eb295559950dd940aeeb6b74792f8  amazon-ecr-credential-helper-v0.10.1-git4-go2.tar.gz
+sha256  dbb977df026de70fbe3389d9fc6756286859ca4a76a76ebb8c17108b0cec6752  amazon-ecr-credential-helper-v0.12.0-git4-go2.tar.gz
 sha256  ce65129252f145d6dd627bc354ccc28ba07c6cd27a8d278b7dcfde3ed6976a5a  LICENSE
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index 5ac416912c..570cc16b0c 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.10.1
+AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.12.0
 AMAZON_ECR_CREDENTIAL_HELPER_SITE = https://github.com/awslabs/amazon-ecr-credential-helper
 AMAZON_ECR_CREDENTIAL_HELPER_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

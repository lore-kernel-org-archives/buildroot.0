Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3934BC5AC9E
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFD8608E0;
	Fri,  7 Aug 2026 09:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drpXeO0XfbCZ; Fri,  7 Aug 2026 09:35:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF37608EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095338;
	bh=07YpacK+LwUwVld8YTiheiwtLiB1zlgAUI2R33ujAdo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i2bTzhui2X6klVuynj8d4OH+Z+4BNzFknDvkIxvV4tgJJ/54Xk1+WiqHKslp8KrB7
	 iTeuqJurusH2zRqg/LMQn7EPIgGszEjGWJhK9mAt6nVk5MxSOujA/xb2nERSS/PSdR
	 rN4PyW7WAsdNQoIpVYboRh5AZRPwun0aXPeME8vJsGMZLm6rjuex600N7cfURG16y9
	 9vjUq94s5FHwcaarXVqWrKSsMJx9gVwkqdjxOv9tqPrxp1YVskh6UQ2AvEthXxNQE5
	 h+Ix0SxoiZtcQPDapkiMf7316WqUnLOpIODbvoXX3BVQUBj4kku1ZoOEZcMs7HOqfY
	 jIz/m7PnoXcVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF37608EB;
	Fri,  7 Aug 2026 09:35:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94ED8704
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AC694019B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UbTHMO4rBV9 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4ADB403D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4ADB403D5
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A4E08CA43; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 730777efadeeda202d3d82bf2c2ac4cfc262f631
X-Git-Newrev: cad6826784c3f901b075a5fe3abe791dd846c2be
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.4A4E08CA43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/amazon-ecr-credential-helper: bump to 0.12.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cad6826784c3f901b075a5fe3abe791dd846c2be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Changelog: https://github.com/awslabs/amazon-ecr-credential-helper/blob/v0.12.0/CHANGELOG.md

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4c1a81106e0e781cc662a8956d271dd59e9e5945)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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

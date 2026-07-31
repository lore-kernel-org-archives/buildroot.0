Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B25AC55172
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6896560B54;
	Fri, 31 Jul 2026 12:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3n9oh9rmuJZp; Fri, 31 Jul 2026 12:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BB6860B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500451;
	bh=/0oJwQ7b7Yw3CFxPuPsYIe32276jKhM5nginKenF5CI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gzjz/PKHnly/E6B38Va0pNhVKp334f1quatovB+4sEeQMYCVtu0sUOnjgrDbBMD3e
	 2mYi4frucjfkf8OXZpTWkjrhRPvKa70d4jhmJuxzYpJzbfe96fqQS8WU9bsdXfV6b7
	 IvaYMPvJm1jX6MCRh8Va9vnwNO4e9ZepV+iolMcJoFtIlzxQxWL0IpLbKuyfnYZFPy
	 CBCHGLscXWVxdgXIgfmY2JhG24glmJTgBrckhZ1gbab9Q8cYB3M49kboBiBzkUjzYc
	 B/0OfjHzSDsnI7Cs1FmYxpVvk4vltjwe1pupSYlssvgGVIU8gillMmpJJNPaB0jgwx
	 ijIVdIZ/PVLJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB6860B21;
	Fri, 31 Jul 2026 12:20:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D219236E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8AEB4105F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbTotAyP07wz for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8A054105D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8A054105D
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9C8B8B743; Fri, 31 Jul 2026 12:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:11:57 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8b5c95e5a245e49bbdb47fc1423d5a50024e3e83
X-Git-Newrev: 4ab4ded4c8a8b07687725df36c89da7daa391693
X-Patchwork-Hint: ignore
Message-Id: <20260731122002.A9C8B8B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/amazon-ecr-credential-helper: needs NPTL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ab4ded4c8a8b07687725df36c89da7daa391693
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

amazon-ecr-credential-helper calls pthread_getattr_np() which is only
available with NPTL; i.e. always available with glibc (where it
originates from, since 2.2.3), always available with musl (which has
had it since 0.9.10 in 2013), and only available when uClibc has NPTL
(since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/4e6e13f1161485b412d4601cb8972a1524ddd2d6/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7a7b0522b34c4ff39f1386b972ded7360191bc01)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/amazon-ecr-credential-helper/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/amazon-ecr-credential-helper/Config.in b/package/amazon-ecr-credential-helper/Config.in
index 93bfb51e4a..2efda5cd49 100644
--- a/package/amazon-ecr-credential-helper/Config.in
+++ b/package/amazon-ecr-credential-helper/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_AMAZON_ECR_CREDENTIAL_HELPER
 	bool "amazon-ecr-credential-helper"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_*_np()
 	help
 	  The Amazon ECR Docker Credential Helper is a credential
 	  helper for the Docker daemon that makes it easier to use
 	  Amazon Elastic Container Registry.
 
 	  https://github.com/awslabs/amazon-ecr-credential-helper
+
+comment "amazon-ecr-credential-helper needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

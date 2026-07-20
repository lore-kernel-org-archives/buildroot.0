Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B95C44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F77606D6;
	Mon, 20 Jul 2026 19:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i7MZAlXcIdo; Mon, 20 Jul 2026 19:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C4F660704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784576590;
	bh=nUAbbaLXM4z44bNgjswd5Nq5pBRvBVsbO77GnAsOm/0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lQu8KjnF19WjaRKKp0XKnp4cOTg4NsRa531g9pbxgpNaNKhTulYN7DU5E/UX2jQ/o
	 SOHMsNCwsxsmHW9QemJnoQU+vpW0eQ0GpsRBj+rxoIb724H+/0izgD5UOFt6LAwJd7
	 x3s975rl2m71h3Jdm18gl8lZ4PyBRDOeMpl8Iv6xprAcRURDA3q95UT/lFQYuzvtTL
	 tsLPQiAOZB9v573Q4r1KRvcnKvwRQ86SOfIEJntm9GUT9G8tIxJRBsn8azzhkB2kaw
	 0vZk3qsxgcIN59nmm0Sn7UkwlzS3o+/6xwUabCytKCQ7i7EPaNOpmB3Sr/aVYl+UCR
	 8moSGGCDe/DlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4F660704;
	Mon, 20 Jul 2026 19:43:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6BD9132D
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B848F80D21
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziqXqLsMrZA6 for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE6DC80D09
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE6DC80D09
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24C108907A; Mon, 20 Jul 2026 19:42:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 21:39:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53c990eb4cf5bd0424307cb50f63c752961195d2
X-Git-Newrev: 7a7b0522b34c4ff39f1386b972ded7360191bc01
X-Patchwork-Hint: ignore
Message-Id: <20260720194229.24C108907A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/amazon-ecr-credential-helper:
 needs NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a7b0522b34c4ff39f1386b972ded7360191bc01
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

amazon-ecr-credential-helper calls pthread_getattr_np() which is only
available with NPTL; i.e. always available with glibc (where it
originates from, since 2.2.3), always available with musl (which has
had it since 0.9.10 in 2013), and only available when uClibc has NPTL
(since 1.0.0 in 2015).

Fixes: https://autobuild.buildroot.org/results/4e6e13f1161485b412d4601cb8972a1524ddd2d6/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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

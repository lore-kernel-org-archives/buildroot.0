Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C0BFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCA740B5A;
	Tue,  5 May 2026 21:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vn8XdQARGQhO; Tue,  5 May 2026 21:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 449C840C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016030;
	bh=mUFcsnID8hSvPVh6YU+rtWyHnMwlgiMEh6y5BkrVAV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Belp21qtuefzlE0/cbQ1uTytYP3QdNbMmrBT7lPYdLrjUfORbFg7hVq/uc1jtuvDH
	 veC6otzhQXhbeL3k0gAJELNNRwve4exIRjXZKlhrk0PmtrapRJmiMmTO38LPRvVD/D
	 rdivZVU7VCo9tumSOiJ0w5wCcQnCYOzqndzKx70y5T/kuZnvuGxiwTROCqJ2UQOsfz
	 d8MN5azpdwbMS1m+A94h5IjGDulxsNd/tB5bEWU5V8H94qN7aja0GzWe4AD1NdqmQC
	 YDkCSJmq/H/xZSnuj3cG4pRz1GRLsNzoaYMm6xIuAufZYdw83M+fvcEtiGVIyyXOH9
	 DJANuO5XpjqVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 449C840C27;
	Tue,  5 May 2026 21:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 101A7280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 028D360B67
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pivZWxlK7Bzi for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55CB460B5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55CB460B5D
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 731D9845F8; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 483dc0c0996835df18b627626ac0a1a728ccfcc1
X-Git-Newrev: 83dedeb2e1935425dcc29ba2ddabcf7b511e6648
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.731D9845F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_oci: Bump kernel
 version to last LTS (6.18)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83dedeb2e1935425dcc29ba2ddabcf7b511e6648
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/fs/test_oci.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index 0ecf58f626..38ed168b62 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -10,7 +10,7 @@ class TestOci(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.61"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

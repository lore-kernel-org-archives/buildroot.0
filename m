Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFEECD3439
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E033F60B70;
	Tue,  5 May 2026 21:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEBddQo8jkBx; Tue,  5 May 2026 21:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A7C660B63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016029;
	bh=rZpaNJejhFHK+OZe5im0jrtxrPb6jWhUQ3o+pgcOfGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cphCnbbg26wDmWGmiAAzOkn7PzPKg2QHkFyrQ3z57Z+ADHTdVUPJJd3c4mNbggTFJ
	 5iyJKeb+iSy4lyOKEfNbBZQn/vpGkzdCyNhQF1jDHPdb2z+wB2EdgpbO9+QYZGmzXR
	 ZtFVBFZq7IEdLRF6g7DBnBTDFKB4h0YC0v5gOBxZftrvyfmnh3y/yiXhaG1cxjJcX/
	 mpYGhg5Gq1oJvocgPWy2WeG4jLV2XQTNCvw6pv7jiHlfKtzGQlbSRl4PvfqG36yEIn
	 pIl+wwzeivPZkXxb5cI0P6b4Qw2LeZC6paPw72sPiyff3dExhdJnsmOXaQrfvqFB4J
	 F9OkQL3wVvdLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7C660B63;
	Tue,  5 May 2026 21:20:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9FD7315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABB6281E41
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5dK1w1Z4qBA for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F3D081E3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F3D081E3C
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 297CF844BF; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b93856d2d0f58cdbfe1256f691ec9848f755261
X-Git-Newrev: 74e7e07f83d6575f369295d17199ea488d87d233
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.297CF844BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_file_capabilities:
 Kernel version bump LTS (6.18)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74e7e07f83d6575f369295d17199ea488d87d233
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index e2600ae794..ede7b48555 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -13,7 +13,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.310"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

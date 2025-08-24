Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375EECA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 18:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B34845F4;
	Sun, 24 Aug 2025 18:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFAdH10b-sOD; Sun, 24 Aug 2025 18:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67EE1845BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67EE1845BB;
	Sun, 24 Aug 2025 18:55:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0043375B
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C5F41C5C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEORRBF4X2gM for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C9AC41C53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C9AC41C53
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3717887AB6; Sun, 24 Aug 2025 18:55:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 19:24:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 358b4116c762caff26f22ecbfff874692d7c77ee
X-Git-Newrev: bd397daf1ca29738ab782fc24b9b5612ccffca2e
X-Patchwork-Hint: ignore
Message-Id: <20250824185555.3717887AB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestXvisor: bump custom
 opensbi version to 1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd397daf1ca29738ab782fc24b9b5612ccffca2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the TestXvisor fails when building xvisor with gcc 15.1.0.

Since xvisor is now fixed, opensbi 1.5 fail to build with gcc-15 for
the same reasons.

opensbi 1.6 include a fix for C23 enabled compilers [2]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://github.com/riscv-software-src/opensbi/commit/d539d64a23bbd64ba324eed595449bcc9c7be0cb

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xvisor.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_xvisor.py b/support/testing/tests/package/test_xvisor.py
index b1b7d1a5e0..6872e22db9 100644
--- a/support/testing/tests/package/test_xvisor.py
+++ b/support/testing/tests/package/test_xvisor.py
@@ -16,7 +16,7 @@ class TestXvisor(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_TARGET_OPENSBI=y
         BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-        BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.5"
+        BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
         BR2_TARGET_OPENSBI_PLAT="generic"
         BR2_PACKAGE_HOST_QEMU=y
         BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

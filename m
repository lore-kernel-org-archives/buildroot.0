Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25558C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 09:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C228E8135B;
	Wed, 15 Feb 2023 09:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C228E8135B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0M3jrpVFYnLz; Wed, 15 Feb 2023 09:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04D5081ED1;
	Wed, 15 Feb 2023 09:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D5081ED1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0241BF95C
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0499D60BE2
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0499D60BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HSxBFKzlDGD for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A0460BAE
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A0460BAE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15C6B85541; Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 10:23:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cbb458bd44778376ccdd5ffccc3e5fc5492766a
X-Git-Newrev: 740d923423f18d94d62e60d0efe8200c7bd889d6
X-Patchwork-Hint: ignore
Message-Id: <20230215092414.15C6B85541@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments: add a bootlin
 s390x toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=740d923423f18d94d62e60d0efe8200c7bd889d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I do constantly get mails that fluent-bit fails to build for s390x.
So added this to ensure that the s390x architecture is checked as well
if I manually do:

$ ./utils/test-pkg -p fluent-bit -a

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config | 5 +++++
 support/config-fragments/autobuild/toolchain-configs.csv          | 1 +
 2 files changed, 6 insertions(+)

diff --git a/support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config b/support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config
new file mode 100644
index 0000000000..fe3f0380c9
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config
@@ -0,0 +1,5 @@
+BR2_s390x=y
+BR2_s390x_z13=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 0b19051543..a65e9bacc3 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -38,6 +38,7 @@ support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv32-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-riscv64-musl.config,x86_64
+support/config-fragments/autobuild/bootlin-s390x-z13-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sh4-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

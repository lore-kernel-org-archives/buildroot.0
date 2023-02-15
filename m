Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA06C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC054610C9;
	Tue, 21 Feb 2023 00:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC054610C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lF1I8ulEo6n; Tue, 21 Feb 2023 00:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3213161089;
	Tue, 21 Feb 2023 00:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3213161089
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 415761BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E64041820
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E64041820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XnN0FD2B9jUm for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E1541810
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56E1541810
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52C3B7FF06; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 10:23:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5cbb458bd44778376ccdd5ffccc3e5fc5492766a
X-Git-Newrev: 740d923423f18d94d62e60d0efe8200c7bd889d6
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.52C3B7FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/config-fragments: add
 a bootlin s390x toolchain
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

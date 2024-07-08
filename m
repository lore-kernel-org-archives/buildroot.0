Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35EFC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 11:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A13CD80DC6;
	Mon,  8 Jul 2024 11:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7Ey8pas2aPA; Mon,  8 Jul 2024 11:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B121D80EC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B121D80EC1;
	Mon,  8 Jul 2024 11:28:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 765A21BF3B0
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 630414012D
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcMucprIAeYU for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 11:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36AD400BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F36AD400BA
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 11:28:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9E2683D7A; Mon,  8 Jul 2024 11:28:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 13:26:53 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1899589f66574712f7fb9c674e55574677af88f4
X-Git-Newrev: f5a0a0478310cc4bbee78ec401ffcf86c033c52c
X-Patchwork-Hint: ignore
Message-Id: <20240708112831.D9E2683D7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/fluent-bit:
 security bump to version 2.2.3
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
Content-Type: multipart/mixed; boundary="===============8660139577605245451=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8660139577605245451==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f5a0a0478310cc4bbee78ec401ffcf86c033c52c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security vulnerability:

- CVE-2024-4323: A memory corruption vulnerability in Fluent Bit versions
  2.0.7 thru 3.0.3.  This issue lies in the embedded http server’s parsing
  of trace requests and may result in denial of service conditions,
  information disclosure, or remote code execution.

https://fluentbit.io/announcements/v2.2.3/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/fluent-bit.hash | 2 +-
 package/fluent-bit/fluent-bit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 2c34583f7a..8916aeb0bd 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8e7e951b2907e9d29508699c71c8949a4a22d750d54ffa5ee5b96537e59371dd  fluent-bit-2.2.2.tar.gz
+sha256  006ed94d34e4036fb7fb5a02016ccf3a55d7f5ccdefd5df756d1ba2206cfc55d  fluent-bit-2.2.3.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 00a8904c55..b9bced5caf 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.2.2
+FLUENT_BIT_VERSION = 2.2.3
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE

--===============8660139577605245451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8660139577605245451==--

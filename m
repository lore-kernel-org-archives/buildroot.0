Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04DAC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB3A54010C;
	Sun, 12 May 2024 07:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LghfgRzCZoA7; Sun, 12 May 2024 07:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9972401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9972401CC;
	Sun, 12 May 2024 07:07:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8771BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CBF4401CC
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBmpl0gA_JmE for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A4084010C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A4084010C
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4706A87039; Sun, 12 May 2024 07:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:07:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84ccd2c783f68aa959e6a65df7621977a90ce31f
X-Git-Newrev: 2e87474eae5c8aa3e0281714e660234f8a9daada
X-Patchwork-Hint: ignore
Message-Id: <20240512070757.4706A87039@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: enable Linuxthreads for
 riscv64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e87474eae5c8aa3e0281714e660234f8a9daada
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=1640c262dc63e2f8f43c0728dbe867c8fffe3e9d

Linuxthreads support for riscv64 was added to uClibc-ng.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 9fd07400de..73ddd5ef58 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -85,7 +85,6 @@ config BR2_PTHREADS_NATIVE
 config BR2_PTHREADS
 	bool "linuxthreads"
 	depends on !BR2_aarch64 && !BR2_aarch64_be
-	depends on !BR2_RISCV_64
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC80CD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA2AC61BFF;
	Sun, 31 May 2026 06:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4HbgWW_yezA; Sun, 31 May 2026 06:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 449B160EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780209064;
	bh=0DyDh9RyHHJFI/OspurpQIDUB2GwZPxpbmi8afdmkBs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gTBdBeBjj9kekynBRwn2j6pN38ntZJPbrb03/r4nez1rTtE4sO846Jf61ENaf4w/n
	 oHp4e8AO4sS3+OFfECu4q6CvIDAi3zxUFukGmSv4RNyQKkZ5r0ZpPUmLQaTVCB65vl
	 BqiJkKcZByA9tcs9RRfhWOknc4rl/L13Ns2hE2Pyjg8zyWi8csOnQCWMy5F4aP6xXU
	 vCwQxSH9p/jc5knc49HnoQcLf6aQaInjPsz5L+BkIk2WHD9qIPbbbIZZJhf9uqSphh
	 +RzTIRRUI6gyQcBHoFYyHVjmiLQXpvozhUGWAo2yYNWUBsHleYn+ptNbJxXPBv4jNl
	 zvJY+BlCFYEvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 449B160EFB;
	Sun, 31 May 2026 06:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A97C389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CCBB60EFB
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmCobNzwNdN8 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D15F60EF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D15F60EF9
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:31:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BEDA8769E; Sun, 31 May 2026 06:30:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 08:30:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49a4dc97456b9b777c25acb0cc3d1fdaacf9859d
X-Git-Newrev: 1eeed7e97867feaffff38bfac501eb3f5624e411
X-Patchwork-Hint: ignore
Message-Id: <20260531063048.4BEDA8769E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crucible: needs NPTL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1eeed7e97867feaffff38bfac501eb3f5624e411
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

gcc_stack_unix.c: In function 'x_cgo_getstackbound':
gcc_stack_unix.c:28:9: error: implicit declaration of function 'pthread_getattr_np';
 did you mean 'pthread_attr_init'? [-Wimplicit-function-declaration]
   28 |         pthread_getattr_np(pthread_self(), &attr);  // GNU extension

Fixes:
https://autobuild.buildroot.net/results/e07/e07198d7864331027d21cd2109054d86e7ac1c3d/

The build error also occured in Oct 2024 so a backport to buildroot
LTS branches should be considered:
https://autobuild.buildroot.net/results/ebb/ebbd051010c27f97fafc0b203b22c8b0af7e5ccd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crucible/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/crucible/Config.in b/package/crucible/Config.in
index 1e1b29c3df..f52f871d0b 100644
--- a/package/crucible/Config.in
+++ b/package/crucible/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_CRUCIBLE
 	bool "crucible"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_getattr_np()
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
 	  i.MX family.
 
 	  https://github.com/usbarmory/crucible
+
+comment "crucible needs a toolchain w/ NPTL"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

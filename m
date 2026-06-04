Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECC3CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8769060EA6;
	Fri,  5 Jun 2026 12:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pywUSNNd1LPq; Fri,  5 Jun 2026 12:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D5860EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663242;
	bh=YZJxIDEN3pHndKTHkfrAVOWjkomGmcSEATt6iCebHRI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cPEI35dOGKlQagNsV8/UFFydHjyPA60mVF/tlJDhzRC70SQa8AyroxaaZ4b6Zuw8a
	 tAGtshygB0MKIr4ZVthVgmxHZf58e1ZFRbvwwiervXvJWfzp7D0Py8ACc1xSJQYTkr
	 4wSnwGdV8azFc4x3gweSxK74LhChPmnWVh9OK7WytpYWi0G0HglH2m9u52fgnVg1hD
	 bBd9lr8vFe9Y+V8SLmLEC11G5K/CXMMb6E8ZQyiK5xw7Txzl9EH7p0Jw8RUSreFezs
	 Y4wSiwGRrTCo7ygU3TF0aYFW3HTwdtH+fvGm8cFCVKbzYaNENkfUgSoOq02hDB6Lj2
	 1ZcZmUUzI86HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D5860EBB;
	Fri,  5 Jun 2026 12:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F0B3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B84354100F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8l2iVmLr8XVv for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 770E440FFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 770E440FFB
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0B5D87B3C; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:24:47 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9020246070829c57985f13db94bfc83fe99a7c4e
X-Git-Newrev: aed5d21b8c07eb05c2de89591ccf3952cbc9bc69
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.A0B5D87B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/crucible: needs
 NPTL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aed5d21b8c07eb05c2de89591ccf3952cbc9bc69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 1eeed7e97867feaffff38bfac501eb3f5624e411)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

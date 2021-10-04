Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B62C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:14:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2CB61029
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D2CB61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3E74272C;
	Mon,  4 Oct 2021 11:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mwBYilpaThd; Mon,  4 Oct 2021 11:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2C04272F;
	Mon,  4 Oct 2021 11:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51C341BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C2AD405FA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izsBvGy4LCRb for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:14:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C6EA4052E
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0964A8DC42; Mon,  4 Oct 2021 11:12:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 12:59:04 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b935ee674dd05ab5493c2a9be7847493e2c30c6a
X-Git-Newrev: 12aec0162987f7f92a27e159ad0427702f832c3c
X-Patchwork-Hint: ignore
Message-Id: <20211004111222.0964A8DC42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/trace-cmd: fix
 build for Sparc64
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

commit: https://git.buildroot.net/buildroot/commit/?id=12aec0162987f7f92a27e159ad0427702f832c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Trace-cmd needs -fPIC for Sparc64 platform otherwise it fails on linking,
so add -fPIC to CFLAGS when building for such platform.

Fixes;
    http://autobuild.buildroot.net/results/c59/c596f6308b7f4d44d9ba009ed0c395396fc72f47/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b1942c8e47d0898ee0598a57626d3dae868782e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/trace-cmd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index cd3fcb9755..bc431e5dd2 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -31,6 +31,11 @@ endif
 # redefining it on the command line causes build problems.
 TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
 
+# Sparc64 needs -fPIC
+ifeq ($(BR2_sparc64),y)
+TRACE_CMD_CFLAGS += -fPIC
+endif
+
 # trace-cmd use CPPFLAGS to add some extra flags.
 # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
 # that causes build problems.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

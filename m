Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB37CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:16:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6E861381
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 11:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E6E861381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56AD6427A8;
	Mon,  4 Oct 2021 11:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aq1GGmYy9kxt; Mon,  4 Oct 2021 11:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B29427C1;
	Mon,  4 Oct 2021 11:16:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7FFB1BF34A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4F7B61B5F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 11:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cakpKLLHFdT for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 11:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222DC61B6B
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 11:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 048938DC74; Mon,  4 Oct 2021 11:12:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 12:59:42 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cdec745cb9b67c481962df8a1843fd0e1181c5fd
X-Git-Newrev: 2f9248e5c855b869fe99dbc577dd3478472b1850
X-Patchwork-Hint: ignore
Message-Id: <20211004111234.048938DC74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/trace-cmd: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f9248e5c855b869fe99dbc577dd3478472b1850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A8BC624D4
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 14:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553B660748;
	Tue,  1 Sep 2026 14:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7JvQNwuYVwC; Tue,  1 Sep 2026 14:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788271888;
	bh=xHdVZSvtLgPN+SYHAYHbuaMmjW5wPyj0gs7vzUskm4Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mRu66e+8SRNZaLURFWLpu8yTrFZBZjSorNdQOO/ZIA9wOUfBqaGUW/vm9YIiQPQVZ
	 lzi/R+1fOHKmtm4vcqxXCLNfUqK1KMN9BRTKL9/3xQ8gEy+cQ9/6FncDDu1VfgPSDP
	 7yAk4DwsdeMz2IEVwAPmv7RcVp1dRKDuZvJ3giPAAgrsmY6th2nSSM8vHtXyje70+p
	 NQqvfDTGs9rPHP6G2QA4xDHCIgFQXEszF1bQuUKVr7M5GoQhLqu5Jj+f8sMdBIQJRP
	 vLaihA1T+4DvU4IITFkbZKt3oeyhjcyL8haJrSHeDxTp1gHU0OH+oTdG8urJ2gfPgb
	 GNaQ05SS3ax6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10AA606DE;
	Tue,  1 Sep 2026 14:11:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7538265
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95E1F606DE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHELsR9qIviz for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 14:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C689606BE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 14:11:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 802A59340A; Tue,  1 Sep 2026 14:10:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 16:10:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db3d0d44acae1bda1fb5d06cbdd01f7fe3621857
X-Git-Newrev: 55a7ece9e53f2de0cd96294efeb38045bbd41bef
X-Patchwork-Hint: ignore
Message-Id: <20260901141024.802A59340A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: make the libvirt dependency
 explicit
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55a7ece9e53f2de0cd96294efeb38045bbd41bef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

examples/vm_power_manager/meson.build in DPDK detects the presence of
libvirt:

opt_dep = cc.find_library('virt', required : false)

and then builds some examples or not depending on the availability of
libvirt. Let's make this optional dependency explicit in dpdk.mk, even
if there's no explicit enable/disable option for it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dpdk/dpdk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 147bdb23d3..968a5a877d 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -112,6 +112,10 @@ ifeq ($(BR2_PACKAGE_LIBBPF),y)
 DPDK_DEPENDENCIES += libbpf
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT),y)
+DPDK_DEPENDENCIES += libvirt
+endif
+
 ifeq ($(BR2_PACKAGE_RDMA_CORE),y)
 DPDK_DEPENDENCIES += rdma-core
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

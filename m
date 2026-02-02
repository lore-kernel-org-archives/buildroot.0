Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10E7E7FDF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7868F822F0;
	Mon,  2 Feb 2026 22:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHI9gB0J93Zb; Mon,  2 Feb 2026 22:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186BC82CE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070660;
	bh=thU7TKzrQHAJj/cqMXUBnoso2AZ6AFzF1G3VO8+X/qw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PsmFKh9XllyntYN5hkmmqXCEdIDkZn31qrkw2mhJo5l+wdzrgljALRU7a5DYsqWJC
	 NzNhY3R64KsOyqpC1A4EqM6RSpntSWGHYb3ZlvmExQ0mnAfJXYce+evCgV3ynmtm7I
	 XsZsJiA6CYZ3FJJaQ3iGQ7hfNI6ULZSRuzgPtNXYkAVh9hgtvsxM3m6ZZd1Kn6Z52h
	 JU2MD7lDzXbkYDX27vOOrtNvzCKbfGpD4bMDMsbsCx8MsZHS1hyJ42zPBhWAn8GjNJ
	 XvqPphBH9KlrjJRjCPvcNfKZ0YA/6YYv/8ORBINGSu5R6poqh+fk6nCeNmVvBhg8HZ
	 YNU7g+e9MO5+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186BC82CE5;
	Mon,  2 Feb 2026 22:17:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A19BF5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75D9E822F0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eb4t41-QBBy1 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191F582304
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 191F582304
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02BD5864FF; Mon,  2 Feb 2026 22:17:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 23:16:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6c387238d30cb1373135cf0270862e1e1f9d944
X-Git-Newrev: c8e0ccce0ad66e3ff4619fc8e52fd6190353110b
X-Patchwork-Hint: ignore
Message-Id: <20260202221735.02BD5864FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 10.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8e0ccce0ad66e3ff4619fc8e52fd6190353110b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://wiki.qemu.org/ChangeLog/10.2

Note: this commit switches to the new qemu stable-10.2 branch series.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index ee70e67694..f8e750225f 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  fbaa7a0d7a9a1deb5695b125916746ec28fe0de6275d4454f3e3bbaf8b339b53  qemu-10.1.3.tar.xz
+sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 45efbfcb2c..1672ac8f19 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.1.3
+QEMU_VERSION = 10.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

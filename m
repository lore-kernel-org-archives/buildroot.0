Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFB8EF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA3161223;
	Sat, 14 Feb 2026 20:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RfvFm3JDmK2u; Sat, 14 Feb 2026 20:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F186E60EA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771100729;
	bh=0QTjAaqm5elJ5qNsjhuqn5L7NIDci8RQiqBXGYwvcUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K8Ornt4U2PujJdl+0dB1H2N8KPftm+ZhlpYqJBmhpRR4Rce++o1JvQYim2JgeHNcf
	 vUTXl6ucSmK83x/8wsLck86erQoU8dg/MV12z2hNB1xoLstPZS6hx0iaL2Ci2EPiEW
	 7et84Ayo2dqUQV5cXA8ZdcFu4TucoG+qyU1tdlZJ5AqmzsrV0hAXWYPTxdRZVoDWVl
	 dVPQ1Mvc1L7oZRZG8wPIL8gW/wj4vRyBorc56rdsvru8a3OqyqgFNMNUp/as0ZJ+bk
	 LNFrtN/CW//BUnLrHPjAYMWLO9U4l8KaTsQcvbOsXGHu9VQ2N6BPmlCfJoN8jtBpFh
	 sEwMA2w83llZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F186E60EA9;
	Sat, 14 Feb 2026 20:25:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC5D069
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DA8160EA9
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96HSNN8UiXeX for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D5E60E6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D5E60E6B
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:25:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE28186D6F; Sat, 14 Feb 2026 20:25:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 21:13:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a99a3d844a8ba0b53e04f5bde47f83c0072bda36
X-Git-Newrev: cb0b183aba99c15872aeebef272013ad9d4da52b
X-Patchwork-Hint: ignore
Message-Id: <20260214202525.AE28186D6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.55
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb0b183aba99c15872aeebef272013ad9d4da52b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.55.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index f2a5b59263..e8113fca1f 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  e41a6e9c9bfac22ebbc55c7af1cbfeca08ce68d6a9935e05da5f38d224edb245  broot-1.54.0-cargo4.tar.gz
+sha256  4eabb24bd95af9f7ecf52e68b02d2afedc631bcf059f5fc8354c09a0878bcc0a  broot-1.55.0-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index f8043ee02a..83b2e3443c 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.54.0
+BROOT_VERSION = 1.55.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

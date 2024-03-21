Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1786FC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D611782245;
	Thu, 21 Mar 2024 21:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fT-PUpAZQDby; Thu, 21 Mar 2024 21:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63118822F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63118822F0;
	Thu, 21 Mar 2024 21:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB391BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB400405C2
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJh8IpY6V7tA for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EE78405BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EE78405BF
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C3C483761; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:27:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9c9796d8778791fa4e3f8d0f15cafd91cad3251c
X-Git-Newrev: f423b50a28b8af169c50ad717d54fd18479b31f9
X-Patchwork-Hint: ignore
Message-Id: <20240321210221.0C3C483761@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libgit2: security
 bump to version 1.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f423b50a28b8af169c50ad717d54fd18479b31f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following security issues:

- CVE-2024-24575 (infinite loop DoS on revision lookup) and
- CVE-2024-24577 (heap out of bound write on index update)

https://github.com/libgit2/libgit2/releases/tag/v1.7.2

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b7eb1dcbb65682b2e800b6523688102ffb4d4821)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 76d599b81e..022fb35a9c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17d2b292f21be3892b704dddff29327b3564f96099a1c53b00edc23160c71327  libgit2-1.7.1.tar.gz
+sha256  de384e29d7efc9330c6cdb126ebf88342b5025d920dcb7c645defad85195ea7f  libgit2-1.7.2.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 92563d24bb..16934e5391 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.7.1
+LIBGIT2_VERSION = 1.7.2
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

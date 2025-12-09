Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E26BD44140
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC5C83BBE;
	Fri, 12 Dec 2025 07:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9u-dupepDIS; Fri, 12 Dec 2025 07:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E898E84130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526326;
	bh=ANzNZCQ/zA7I0JfOk98FGSEOG0a0rm9IbdzfyHvoJB0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bXxiIdThzrnDwopfLbbwtXXhwbr1IWnKGemeA6S9tB3yKMWm6ZiVkyUZtNpj7R14k
	 /Te2xYNPi+TXoOI5gwgVS9xUPHOxm2lYEf53y8/+aOykJwAmDaOaDlfqO8mrTkaFK2
	 OaKHURsA7fVjDOmhn6GQsQYGtzM0LGepP3SlrvukeEGsUt1K1Ki5eDXGMlOUox502G
	 HXmjLVhxc+BRrOj+7IqVHU7wkn5Bhs21j0xYjVaC71aNUHiKLgLHgtApfSyTHueTgL
	 LWcHdezfswoU/1+BlwbrxQks5/UyeNPPt9SHianQbHjVpLfQubxszoLoAu/8jiA1C2
	 vLuB+E8rRG1MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E898E84130;
	Fri, 12 Dec 2025 07:58:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27EF6E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE37441184
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DQv0z9hUofq for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A850B4118C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A850B4118C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6D43807F9; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 478408964e7b478aa396fdcbbd1e1e5196ae20a8
X-Git-Newrev: 7d5bd5ecc08841b8dc3866af0fd69229fa08215a
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.A6D43807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azmq: bump version to git
 v1.0.3-54-g819b2403
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d5bd5ecc08841b8dc3866af0fd69229fa08215a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last release dates back to 2021 with > 50 commits since then, including
fixes for cmake 4 compatibility.

Instead of backporting several patches we bump the package to the latest
commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: change _VERSION to use "git describe --abbrev=40" format]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/azmq/azmq.hash | 2 +-
 package/azmq/azmq.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/azmq/azmq.hash b/package/azmq/azmq.hash
index 6caf53582a..8b6c2c1f6b 100644
--- a/package/azmq/azmq.hash
+++ b/package/azmq/azmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  80cfb951c5614b8c2e55a59ea2e5723a18ebed08da80e5420e525d6bf273771a  azmq-1.0.3.tar.gz
+sha256  6acd312b1358be23d65e0695f0c6ec176efef944af353961e99dfb777169a6b6  azmq-v1.0.3-54-g819b24035cfa5b73081e21f5867445f2344f680d.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index a72b155664..99fb3212df 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AZMQ_VERSION = 1.0.3
-AZMQ_SITE = $(call github,zeromq,azmq,v$(AZMQ_VERSION))
+AZMQ_VERSION = v1.0.3-54-g819b24035cfa5b73081e21f5867445f2344f680d
+AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))
 AZMQ_DEPENDENCIES = boost zeromq
 AZMQ_LICENSE = BSL-1.0
 AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

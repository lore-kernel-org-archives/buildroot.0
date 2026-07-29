Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C0C53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 19:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0798E80DFA;
	Wed, 29 Jul 2026 19:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKXTvGitpOvr; Wed, 29 Jul 2026 19:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A4980DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785352386;
	bh=IVI7wgQ5fm3mVSjD7m0F44v9qSnJ+fQgFhcsAWi36wQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AyjlY3PWqHlE+ZIKJz0Vq1d18lJhGfAVBeuZc7wUmVFB/aOATvLuknOt1wh9hVuCf
	 oaMuiQiFPwXWcoGBhAX2JROq65MEUrx+1f3+N/a+WPDDf89opnw1IBKuJ8McXOA8UV
	 PbOPz7NP+M6c6YRMVOyrg5OP/rnUickEFZ/dPji7ViIClvggqd/jPlR4LJsypt3rv+
	 5jHS49BpVTZ+zvU8nmWiTXK/jCCuTmchcRjdu1Mhv1CmjfWSDfR24NJFuWkUyPO8zV
	 Rg3Ok4u0V9mrgE1HQWv2KJIvu7LVQ/Mwd8UBr3dYED1ZOZgmp0pmmBrVINeGDjFRjc
	 tctHu30YfP95Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26A4980DF8;
	Wed, 29 Jul 2026 19:13:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89FD327F
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7033F60624
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSXiVMYkCz82 for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 19:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40F9A606EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40F9A606EF
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 19:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F28668B53B; Wed, 29 Jul 2026 19:12:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 20:58:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25c65e0428174caa37d8b8e73bec38b7052ad731
X-Git-Newrev: 928a19f6f2288449d90435908b47aae3d03f99d2
X-Patchwork-Hint: ignore
Message-Id: <20260729191220.F28668B53B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-gcr: bump to
 2.1.32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/928a19f6f2288449d90435908b47aae3d03f99d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/GoogleCloudPlatform/docker-credential-gcr/compare/v2.1.30...v2.1.32

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index 469e8d6b17..1269e239ad 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a327753270232cb7f112b98328d5b56ae2da095ad74399b769aa5dad4393c8ae  docker-credential-gcr-v2.1.30-git4-go2.tar.gz
+sha256  7dcb5b75650a49e181afdbd735d09f3289cb62d5b30cb6e3f681e64cf804cbf9  docker-credential-gcr-v2.1.32-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index f889eb56c9..7419a47d4a 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.1.30
+DOCKER_CREDENTIAL_GCR_VERSION = v2.1.32
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

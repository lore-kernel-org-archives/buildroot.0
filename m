Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF1AC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC86707F9;
	Fri, 28 Feb 2025 17:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddzl1SJBIvq1; Fri, 28 Feb 2025 17:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FB870BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44FB870BB4;
	Fri, 28 Feb 2025 17:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D4768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC19C49EDB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25npKH4dwLIl for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58750464C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58750464C9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5487C81529; Fri, 28 Feb 2025 16:30:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 18:19:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 90047d0c2239aad040c197bcf1a007137d0c7ff8
X-Git-Newrev: 605d17e56fe7800f3fc7cae8bbed7a3f1201bdea
X-Patchwork-Hint: ignore
Message-Id: <20250228163042.5487C81529@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/httping: bump to
 version ffb9201042813c58d020df41697f6445df96f438
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

commit: https://git.buildroot.net/buildroot/commit/?id=605d17e56fe7800f3fc7cae8bbed7a3f1201bdea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use the latest upstream verified commit.
Also fixes multiple issues like:
https://autobuild.buildroot.org/results/fe33a0d9cfa242cbcda0c5fb759b84efc6662097

that were due to the usage of OpenSSL deprecated routines
(ERR_remove_state and ENGINE_cleanup)

The build failure happen since Buildroot commit [1] "package/httping:
update to latest git" and when BR2_PACKAGE_HTTPING_SSL=y.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/1c2fa85cb12de3992b275068890508983973fcdd

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Julien:
 - remove test-pkg result from commit log,
 - add info on the failure
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/httping/httping.hash | 2 +-
 package/httping/httping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index e07f3e32e0..a55febb15f 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4bf8641ebc44a6fa52086f82c60a29051e094424996d972263155d267c96d305  httping-0e26c53d5fe504eb7204d64b23513729aa4a5bb0-git4.tar.gz
+sha256  22c794df06a1c680e923891a445a3745fc88e01b24854af1be8457a37be19fe6  httping-ffb9201042813c58d020df41697f6445df96f438-git4.tar.gz
 sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 8cb4f7f2f9..3759f9fb76 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTTPING_VERSION = 0e26c53d5fe504eb7204d64b23513729aa4a5bb0
+HTTPING_VERSION = ffb9201042813c58d020df41697f6445df96f438
 HTTPING_SITE = https://github.com/folkertvanheusden/HTTPing
 HTTPING_SITE_METHOD = git
 HTTPING_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

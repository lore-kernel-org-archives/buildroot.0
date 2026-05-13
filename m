Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730FDCD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F84884224;
	Fri, 15 May 2026 13:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84QEg676upON; Fri, 15 May 2026 13:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 759CF842AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851810;
	bh=0hdgBgELRtVHgSrzn6r0VqffpWEtHfcImPrdX6VS2/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FbaCvBbdKflpz9xfki8ImVvTj611K+TJEXatykDtJt6qaaef35zrpiN5bTle425gS
	 n69qyw8iN6ODxCr7JRc6Kj6j4Lr0a3Y1Ohr0FBHDwbam6rdG3tTkT2zv8YK1rbNxnm
	 hUyXBSehimcvPEuWaNhbN1vBXBoG4k7mL5M/4OSjKPnlx2PkMS7jKKmNAlP0u7UlhC
	 CRin6+vJN0EyBb4XdubjRLvhq8wo1YUNRSEBkTucT46gK0kx6mVRZi2eH5S2sZ+jBD
	 tqQAitmZEqE7qSUwhXAUhdT1rFzM/KBx+uZyA9oOQD0GPUay3UTP/ZtEZLtKRaG39R
	 qbxNsDZNVXCrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 759CF842AB;
	Fri, 15 May 2026 13:30:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0677636F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC5A941A8A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAp9O2bcKIm2 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75AEE41AB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75AEE41AB9
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9D3386354; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:57:47 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 770b3996ed96cf9e4069bc596cb2d2177f4eee5c
X-Git-Newrev: bef8aefcde882ca234f202ce7f76f12fdb6ef0e4
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.C9D3386354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/thrift: security
 bump version to 0.23.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bef8aefcde882ca234f202ce7f76f12fdb6ef0e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/apache/thrift/blob/v0.23.0/CHANGES.md

Fixes the following CVEs:

CVE-2026-41636: https://seclists.org/oss-sec/2026/q2/236
CVE-2026-41607: https://seclists.org/oss-sec/2026/q2/237
CVE-2026-41606: https://seclists.org/oss-sec/2026/q2/238
CVE-2026-41605: https://seclists.org/oss-sec/2026/q2/239
CVE-2026-41604: https://seclists.org/oss-sec/2026/q2/240
CVE-2026-41602: https://seclists.org/oss-sec/2026/q2/241
CVE-2026-41603: https://seclists.org/oss-sec/2026/q2/242
CVE-2025-48431: https://seclists.org/oss-sec/2026/q2/243

This commit also adds "Public Domain" in THRIFT_LICENSE, after
upstream commit [1] added a new sha256 implementation with that
license. The LICENSE file hash is also updated accordingly.

[1] https://github.com/apache/thrift/commit/1e5fa4b9b35ad6bfeb238d19897ace7826eda057

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6935bc74121967ab6a01950d55c3bb9a14f0f833)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/thrift/thrift.hash | 6 +++---
 package/thrift/thrift.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index a517900c82..406c65fd25 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/thrift/0.22.0/thrift-0.22.0.tar.gz.sha256
-sha256  794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5  thrift-0.22.0.tar.gz
+# From https://downloads.apache.org/thrift/0.23.0/thrift-0.23.0.tar.gz.sha256
+sha256  1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f  thrift-0.23.0.tar.gz
 # License files, locally calculated
-sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
+sha256  89aa7b27868669299bd8a6c53b72ec4beadce42dad6c8336797cc26e1e8df98d  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 177b75903b..34f4671239 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.22.0
+THRIFT_VERSION = 0.23.0
 THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
-THRIFT_LICENSE = Apache-2.0
+THRIFT_LICENSE = Apache-2.0, Public Domain (sha256.h)
 THRIFT_LICENSE_FILES = LICENSE
 THRIFT_CPE_ID_VENDOR = apache
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

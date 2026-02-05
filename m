Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3AFE91269
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 07:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C79240BC2;
	Thu,  5 Feb 2026 07:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQ2Q40iNYhoH; Thu,  5 Feb 2026 07:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE68C40A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770275914;
	bh=fYbnYSHsSfI1QfAnKWEBVaiZU7dEsDdxWSWTduzjTdA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rm+VAtsGR87zbS03Hd8xbmzRpH0egZnU/Zz2dmhpgS6oYvxvIHSs+YdtxzGFVb4/i
	 AaBwH8Ofm2qRobuvr909YnNsD1Y2pOGhFePibYeuYXDUKUkbaSvK+fwsz3vkadWNfW
	 rkYh82aDr//9OwHWbnELgGqmZFiNJxTi6cAqgCf7hBtSgC/vKDCKf9hzihR+/2HdMK
	 awshot5wMB0R0YmIHZbrkeMls/GVAB+l7avkIwckVyxiHMmLShgfLsclks+FFdzsZp
	 169UAvuY9J5U+UNJMafRcrB34mRt332SaM9oqSiNnEfgCmcB03WaG6F+81kwDaP3Oa
	 1hfAWxS4wIciw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE68C40A4A;
	Thu,  5 Feb 2026 07:18:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87033173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A1B84032
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4Ndyvn8EMeN for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 07:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EBD8401B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9EBD8401B
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 07:18:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CF27869A5; Thu,  5 Feb 2026 07:18:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 08:14:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fed872e083c5d5d490977b2bffbd68ebd141f1b
X-Git-Newrev: b69fc85e6608afc2f62111e254416eaeb6fe0aab
X-Patchwork-Hint: ignore
Message-Id: <20260205071832.8CF27869A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/Buildroot-Initialize.cmake:
 make include optional
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b69fc85e6608afc2f62111e254416eaeb6fe0aab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] introduced a new Buildroot-Initialize.cmake file,
to mimic the upstream Linux-Initialize.cmake.

However, this upstream file was introduced in commit [2], which was
introduced in CMake 3.27.

When compiling a cmake package on a host with a cmake older than
version 3.27 (for example, the Buildroot Docker reference image has
cmake 3.25), the configuration fails with the error:

    CMake Error at /buildroot/output/host/share/buildroot/Platform/Buildroot-Initialize.cmake:1 (include):
      include could not find requested file:

        Platform/Linux-Initialize
    Call Stack (most recent call first):
      /usr/share/cmake-3.25/Modules/CMakeSystemSpecificInitialize.cmake:21 (include)
      CMakeLists.txt:20 (project)

CMake version < 3.27 is setting its LINUX predefine elsewhere (see
commit log of [1]), so this commit fixes the issue by simply making
the include optional. This will guarante thee cmake predefines will
be present in all the cases.

Fixes:
[1]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ef9f0a07ed40970a7de4c608a5708ef6ceb75131
[2] https://gitlab.kitware.com/cmake/cmake/-/commit/cc737ae8295156812e697a9d2f3f7b79bf7b72c8

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/Buildroot-Initialize.cmake | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/Buildroot-Initialize.cmake b/support/misc/Buildroot-Initialize.cmake
index 3451562f08..3ee54f349b 100644
--- a/support/misc/Buildroot-Initialize.cmake
+++ b/support/misc/Buildroot-Initialize.cmake
@@ -1 +1 @@
-include(Platform/Linux-Initialize)
+include(Platform/Linux-Initialize OPTIONAL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

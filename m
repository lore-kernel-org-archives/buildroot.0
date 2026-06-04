Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C296CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2244260B8F;
	Fri,  5 Jun 2026 12:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-cYAqsrjo2X; Fri,  5 Jun 2026 12:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34DAB60DA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663183;
	bh=GZejDq3k/VbzV+WimjmvvzDqPyAluyv9DXPDAYhZRdI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=neiCF3DxZ9IOxTQO+N8qwkB/ul2o/reiW5nwNRd9IqlNaV78WB53IKgqhnEXCesyx
	 DDTygWMVRll2VRQ264lPV0rTRgZx9srqEfEc1bLJSNSEFWP4DckW9DsHgZyiRfO2hp
	 xawUZSaD2mjAaTRTBtacithEJYd3jmIebBfEGu0PIT9BC1iwl2SUx4Hf3gdWTTdWfF
	 G6kiRsw7g7cWIwY0Z7FAExiMvcq6Y6SuQ1rSxWEZ8V+gB+/W0NfqauiuNvTnsqik4v
	 OoMyEn0hVUOrWewODctJvBNLO0IMjmPVP0DMWJLDeJgFxKnio4SSGDRMJ5NUQvst9A
	 Jm/Fdk3m4xO/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DAB60DA9;
	Fri,  5 Jun 2026 12:39:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3F93B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 334904106A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExnVRb5d7gQl for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79DAD40FB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79DAD40FB3
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A338A87B2F; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:49:26 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b660ad1dce0c73c6f3afef107bbd3c32ffac832f
X-Git-Newrev: 746b5ecf8de7eaf88884525373a3c5561c2a6c6b
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.A338A87B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/openscap: add
 dependency on NPTL threads
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
Content-Type: multipart/mixed; boundary="===============2080951606291067603=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2080951606291067603==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/746b5ecf8de7eaf88884525373a3c5561c2a6c6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Openscap code is calling NPTL functions such as pthread_barrier_wait,
which are not provided by pthreads.

Make the requirement on NPTL threads explicit by adding the
corresponding  dependency in openscap Config.in.

Fixes: https://autobuild.buildroot.org/results/2d9475b7cd2d413c99d6233ebb213bc932f1e398/
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit d9b9ae8b4eb34c9da11f51b8f20c67b578c2442e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openscap/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openscap/Config.in b/package/openscap/Config.in
index 317055c753..25c385d163 100644
--- a/package/openscap/Config.in
+++ b/package/openscap/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENSCAP
 	bool "openscap"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgcrypt
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBCURL
 	# In theory should build without crypto, but in practice it
 	# doesn't: https://github.com/OpenSCAP/openscap/issues/2310
@@ -19,6 +20,6 @@ config BR2_PACKAGE_OPENSCAP
 	  https://www.open-scap.org/
 	  https://github.com/OpenSCAP/openscap
 
-comment "openscap needs a toolchain w/ dynamic library"
+comment "openscap needs a toolchain w/ dynamic library, NPTL"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL

--===============2080951606291067603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2080951606291067603==--

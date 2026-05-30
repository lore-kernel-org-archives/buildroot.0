Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00705CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A33FD42DF4;
	Sat, 30 May 2026 08:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WKB_R6EZo4t; Sat, 30 May 2026 08:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135D642C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130560;
	bh=EcYrL92GP/pkroG5PF+CCmxIasFcsn6hep0pgfZO4n8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FABad226BRIV9Wyp+IdeFBF4BpY/C4DpGgozbjmVAcQ3mBgcGWevlzNcnjuGJD4Al
	 v+hwwBgLlnuH4ms/deqX4LA3rVE/4EhXjbWscpLuraNlQy+nuHxTp6Hw72L7Voftxm
	 odt4T/537MIi/dJ0I/VHY8fzSCi4N4Z5xDXutgFZY/oIiU6Hel+XN6LHaC/qx0Jzi9
	 ptvQjmFLGu+GLDtI+LplHq9UNw6fr7kgBuRWbKrC7AcSr7GWXZszM9Rx+PnVB8dsTF
	 IGOo+QYyAbX63EZjWs523RRSby0wMf9xtKBx08GzT1xqvDNSv7+SLXsM35sGMvlXq0
	 uiQbg8Q8XrG1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 135D642C06;
	Sat, 30 May 2026 08:42:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8A09F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B9442DDB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBI5j_z0L8jd for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB79942BBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB79942BBC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E402886441; Sat, 30 May 2026 08:42:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:41:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fec4282a07842eadb43dd8ce41bcef08bc3c433
X-Git-Newrev: d9b9ae8b4eb34c9da11f51b8f20c67b578c2442e
X-Patchwork-Hint: ignore
Message-Id: <20260530084224.E402886441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: add dependency on NPTL
 threads
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0797648164390027789=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0797648164390027789==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d9b9ae8b4eb34c9da11f51b8f20c67b578c2442e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Openscap code is calling NPTL functions such as pthread_barrier_wait,
which are not provided by pthreads.

Make the requirement on NPTL threads explicit by adding the
corresponding  dependency in openscap Config.in.

Fixes: https://autobuild.buildroot.org/results/2d9475b7cd2d413c99d6233ebb213bc932f1e398/
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/openscap/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openscap/Config.in b/package/openscap/Config.in
index 942d2b7c46..01c628194c 100644
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
@@ -18,6 +19,6 @@ config BR2_PACKAGE_OPENSCAP
 	  https://www.open-scap.org/
 	  https://github.com/OpenSCAP/openscap
 
-comment "openscap needs a toolchain w/ dynamic library"
+comment "openscap needs a toolchain w/ dynamic library, NPTL"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL

--===============0797648164390027789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0797648164390027789==--

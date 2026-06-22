Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852EDCD98F2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D5660641;
	Mon, 22 Jun 2026 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzOfcq5o6CTT; Mon, 22 Jun 2026 21:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 770F46064D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782164907;
	bh=ZgNRRdWu+BPNP73DJufLKxgSAuCqiv/sXtBy/Cb8v78=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ghp0szjsv2i2F3YNXnqr7elhFWYzZrVteCz/zCO7puw3SXcBXWLhrrqSpxjNUxlIk
	 oNc6b97X50jlfN5vxRpOy9t16ltqEfZRKQXXQcECcjexreyhpDlqyjVCpRADwHBkW7
	 mdme05dZwdca36AEJkguRdvupl1wwT0O7XjdtUQ5Rz8hY3h4ERAveAu6o/uoXMXv+N
	 Qk1kIvwrQWYQf9q4pSiM+uvJ55oISXU8Zq0+rrPw78n1hioGBTqdyxpLHatWEq1rXB
	 f5Xw3VcPx5mbXsVd6hhZkojW5IVgHYzRAHUK9z74+eijDZgxLYCt6SD7WU1SLJOktt
	 Z8uDpr1Y6iSzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770F46064D;
	Mon, 22 Jun 2026 21:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 179E4367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC12F8118F
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcE00daIJ2gS for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 21:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CF6781157
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CF6781157
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 21:48:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CBD584020; Mon, 22 Jun 2026 21:48:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 23:44:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b165e728e2b538e8beb4c629f993885c51630fe
X-Git-Newrev: da9dcddff15af3e99cbc20297f4a3d25e89c66e1
X-Patchwork-Hint: ignore
Message-Id: <20260622214801.0CBD584020@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: requires cmake >= 4.3
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da9dcddff15af3e99cbc20297f4a3d25e89c66e1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With an older cmake version, like the 3.25.1 as available in the docker
reference image, mosquitto fails to build when ccache is enabled:

    [ 98%] Building CXX object lib/cpp/CMakeFiles/mosquittopp.dir/mosquittopp.cpp.o
    In file included from [...]/buildroot/output/build/mosquitto-2.1.2/lib/cpp/mosquittopp.cpp:17:
    [...]/buildroot/output/host/opt/ext-toolchain/i686-buildroot-linux-gnu/include/c++/15.1.0/cstdlib:83:15: fatal error: stdlib.h: No such file or directory
       83 | #include_next <stdlib.h>
          |               ^~~~~~~~~~
    compilation terminated.

Officially, mosquitto only requires cmake 3.18, but that proves to not
be enough, in fact...

We workaround that by requiring cmake 4.3, which is the one version that
could be tested with our host-cmake.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 08223bc5db..c26b1ece9c 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	depends on BR2_USE_MMU  # lib peeks in malloc() internals; broker fork()s
 	depends on !BR2_STATIC_LIBS
+	select BR2_HOST_CMAKE_AT_LEAST_4_3
 	select BR2_PACKAGE_CJSON
 	help
 	  Eclipse Mosquitto is an open source (EPL/EDL licensed) message
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DE0CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD60484303;
	Fri, 29 May 2026 16:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxR_LI78wisB; Fri, 29 May 2026 16:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC48842D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780072825;
	bh=2pbG25Iw+kl2b2M8P+nDmBa82MWUnLLLvxeNAO3A36o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qBJaoazjvCfpv4YdDOBV1aTuZjqAU+UzSeev5oYqqHWz6qcLDgnljFoVwox6F56My
	 PL52C3DXdGGqMY6Gv8rlbY0EKBswwQrH+nf712VU/Ec69KPFvY6ipIpK7/IpY+5ucZ
	 JAJmPDnrPH3QThYt8K9l1xlLbrJundzaCwUz69/jtJZ7WssFOrWeYJ4qEDhPskU0WM
	 yirEsbmjFjXERenEHFcNzwTrFxoBzd9tWJAE6szA49xNGgz2nbQNiS9bZcrgkdE0Je
	 BJKbM4IVDkpLNvm75vWtDncB+X5zBGRdGGWPzpA352uYRMqOD3GrMBncNpWCu/6SWI
	 WNlL6hmL35Beg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC48842D2;
	Fri, 29 May 2026 16:40:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E51B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F25461547
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMq3kXrB1AqL for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E85F61543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E85F61543
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:40:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C705E87403; Fri, 29 May 2026 16:40:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:40:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 87b2b49d0016815d825115b12a9bac70e77dcd8a
X-Git-Newrev: 30554b42055d1943aa302bff2a6c27ed01c42752
X-Patchwork-Hint: ignore
Message-Id: <20260529164009.C705E87403@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xterm: bump to version
 410
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30554b42055d1943aa302bff2a6c27ed01c42752
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Update COPYING hash for a change of copyright years since version 406.

For detailed changes, see the upstream changelog:
https://invisible-island.net/xterm/xterm.log.html

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Peter: mention COPYING update]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xterm/xterm.hash | 4 ++--
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index e86db1c06e..3438e7999a 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a  xterm-401.tgz
+sha256  7ba9fbb303dd3d95d06ca24360d019048d84e5822dc6fe722cd77369bdbf231f  xterm-410.tgz
 # Locally calculated
-sha256  99f70364bb769635eb9de18cc286e16cb78026f3b6478276344ee8619098dff6  COPYING
+sha256  f272fa007de2cffdb22b4df09e9a3aaec3555d5a6913229b70006ee137ab22b5  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index fb6de107e9..dc2f3c0e60 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 401
+XTERM_VERSION = 410
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

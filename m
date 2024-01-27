Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84361C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E3868248F;
	Sat, 27 Jan 2024 20:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E3868248F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2WdIFGWfo_y; Sat, 27 Jan 2024 20:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639748236D;
	Sat, 27 Jan 2024 20:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 639748236D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5097A1BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26107822B5
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26107822B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zcf6eWh5CVgK for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:19:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57C33822B4
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C33822B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 431DB865C8; Sat, 27 Jan 2024 20:19:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:15:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52fd4753fe64208bfc25dc8a298f067da5c4c4b4
X-Git-Newrev: 0c7fd35947d91f84cff994bfb5c85b31b956d006
X-Patchwork-Hint: ignore
Message-Id: <20240127201936.431DB865C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/darkhttpd: security bump to
 version 1.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c7fd35947d91f84cff994bfb5c85b31b956d006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2024-23770: Local Leak of Authentication Parameter in Process List

CVE-2024-23771: Basic Auth Timing Attack

https://security.opensuse.org/2024/01/22/darkhttpd-basic-auth-issues.html

Notice that CVE-2024-23770 is only documented as a known weakness, not
fixed.

Also change the license logic to use the dedicated COPYING file available
since 1.14:

https://github.com/emikulic/darkhttpd/commit/a8ae2b1de069588cad23d79a5392445ee9590fcd

This license is ISC, not MIT - So adjust DARKHTTPD_LICENSE to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/darkhttpd/darkhttpd.hash | 4 ++--
 package/darkhttpd/darkhttpd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index 188afff767..84a787eeba 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  e063de9efa5635260c8def00a4d41ec6145226a492d53fa1dac436967670d195  darkhttpd-1.14.tar.gz
-sha256  f002944c9a8516e3346002d39c3e13681306833358c0f3c7781dff1fdb639710  darkhttpd.c
+sha256  ea48cedafbf43186f4a8d1afc99b33b671adee99519658446022e6f63bd9eda9  darkhttpd-1.15.tar.gz
+sha256  1ecf63e8f84fd60ac7215e04195b9a61dcb47176ea65df26547582027f6c1dee  COPYING
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index bda08899b8..e13f8f7770 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DARKHTTPD_VERSION = 1.14
+DARKHTTPD_VERSION = 1.15
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
-DARKHTTPD_LICENSE = MIT
-DARKHTTPD_LICENSE_FILES = darkhttpd.c
+DARKHTTPD_LICENSE = ISC
+DARKHTTPD_LICENSE_FILES = COPYING
 DARKHTTPD_CPE_ID_VENDOR = darkhttpd_project
 
 define DARKHTTPD_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

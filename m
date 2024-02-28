Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E5C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E2B60EAF;
	Wed, 28 Feb 2024 16:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63CeVQcQuAaw; Wed, 28 Feb 2024 16:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAAD560EE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAAD560EE8;
	Wed, 28 Feb 2024 16:44:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4261BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36764415FF
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDAUxXnDnKhu for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC0D4168C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BC0D4168C
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3617787BD6; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:42:57 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5e057ff46e1e53e10cc533a8ade7bf4868af580e
X-Git-Newrev: 1ed1ff4c43ee243fd46402aa37873f061370026f
X-Patchwork-Hint: ignore
Message-Id: <20240228164338.3617787BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/darkhttpd:
 security bump to version 1.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ed1ff4c43ee243fd46402aa37873f061370026f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 0c7fd35947d91f84cff994bfb5c85b31b956d006)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

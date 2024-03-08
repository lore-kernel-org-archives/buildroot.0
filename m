Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28937C54E4A
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 11:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F0B82D62;
	Fri,  8 Mar 2024 11:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WH4-7-nLG-cf; Fri,  8 Mar 2024 11:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A1E83145
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A1E83145;
	Fri,  8 Mar 2024 11:31:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6171BF995
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46762831CA
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 11:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8xJDu9SOVnC for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECD183145
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ECD183145
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88F7C881F2; Fri,  8 Mar 2024 11:31:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 12:30:58 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0f77312f94c7672a2e66e2ffe53b23036efefc97
X-Git-Newrev: 8294399b94a68e1e035b6d6a917d7f93410a2d16
X-Patchwork-Hint: ignore
Message-Id: <20240308113130.88F7C881F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/v4l2loopback:
 drop _CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8294399b94a68e1e035b6d6a917d7f93410a2d16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 1edb9d691dec (package/v4l2loopback: add
V4L2LOOPBACK_CPE_ID_VENDOR) added that variable, but set to its default
value.

This is however not required to define a valid CPE ID, as it also
defines a non-default CPE_ID_PREFIX.

Drop V4L2LOOPBACK_CPE_ID_VENDOR now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 74682e07df455aa49a637ebbda580df969e64ccf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/v4l2loopback/v4l2loopback.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 84e1927ce3..50a168fcab 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -8,7 +8,6 @@ V4L2LOOPBACK_VERSION = 0.12.7
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
-V4L2LOOPBACK_CPE_ID_VENDOR = v4l2loopback_project
 V4L2LOOPBACK_CPE_ID_PREFIX = cpe:2.3:o
 
 ifeq ($(BR2_PACKAGE_V4L2LOOPBACK_UTILS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB792C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 11:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679344177B;
	Thu, 26 Oct 2023 11:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679344177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAqTa3rvIZWT; Thu, 26 Oct 2023 11:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E2194176C;
	Thu, 26 Oct 2023 11:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2194176C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2BA51BF59D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE0DE41522
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE0DE41522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqeqZ-ZH-OEm for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 11:25:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 092AE41061
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 11:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 092AE41061
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9E6E85F07; Thu, 26 Oct 2023 11:25:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 13:11:48 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 9d863d5315d8d26ebc9bcd5aafc7c3fb1cfd4dad
X-Git-Newrev: 7616363468bcc88147f89f161eb2f4db58ce2081
X-Patchwork-Hint: ignore
Message-Id: <20231026112538.E9E6E85F07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/ksmbd-tools:
 security bump to version 3.4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=7616363468bcc88147f89f161eb2f4db58ce2081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix two security issues that reported by ZDI.

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.7
https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.8
https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5eac719129f66185a83bba6adff8658b41420159)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index b31c66bbe7..6f7064c6eb 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09ab343e9bf10ddfdd3216f400b19740a391645bf3645fa6f136b8da36306559  ksmbd-tools-3.4.6.tar.gz
+sha256  418c7d87e8359355d150bdde6784612cd2ebd48ec87765852169e289d9de67e6  ksmbd-tools-3.4.9.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index c4f9c503e6..c758c17bf2 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.6
+KSMBD_TOOLS_VERSION = 3.4.9
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44687C87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A70340590;
	Thu,  7 Aug 2025 17:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXx7Op9eHNHZ; Thu,  7 Aug 2025 17:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 476614050D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 476614050D;
	Thu,  7 Aug 2025 17:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9371D4C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96858400DC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgKn6xqYqPyM for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E79B44007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E79B44007D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E52CF86FCC; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:19 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4e09315fd14c9bbaa49deaedc14cc2ce367ae8df
X-Git-Newrev: c4a1b99ef4c267484406b40e4503beda4aba2086
X-Patchwork-Hint: ignore
Message-Id: <20250807171914.E52CF86FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-dbus-fast:
 fix cython 3.1.x compatibility
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4a1b99ef4c267484406b40e4503beda4aba2086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since python-cython bump to 3.1.2 in commit [1], python-dbus-fast
is failing to build.

Set --skip-dependency-check as dbus-fast specifies an unnecessarily
strict maximum cython version.

Fixes:
ERROR Missing dependencies:
	Cython<3.1.0,>=3

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/b536caaec0d800ccf7669a50fce5192bce2405a6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add reference to buildroot commit introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f38d4e63d76e3eeca78b28d7fca80dbc13ec6eef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-dbus-fast/python-dbus-fast.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index c2dccd073c..1fa9fcaacf 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -11,6 +11,7 @@ PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
 PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
+PYTHON_DBUS_FAST_BUILD_OPTS = --skip-dependency-check
 PYTHON_DBUS_FAST_DEPENDENCIES = \
 	host-python-cython \
 	host-python-setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

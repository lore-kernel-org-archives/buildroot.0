Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D108C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3705C80C1C;
	Thu,  7 Aug 2025 17:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBpW51n_sO3m; Thu,  7 Aug 2025 17:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BD080BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57BD080BD6;
	Thu,  7 Aug 2025 17:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 272AAD79
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE92C80C15
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1U-u3jpth-x for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 751D480BFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 751D480BFD
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72FB18430F; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0d821f64cd10ae227ee1bcc83acf5f1edd2e6855
X-Git-Newrev: 7bf31e873b496993ff46e70a282226c2a5456ffc
X-Patchwork-Hint: ignore
Message-Id: <20250807170020.72FB18430F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-dbus-fast:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7bf31e873b496993ff46e70a282226c2a5456ffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 4e4964891d..d75246006e 100644
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

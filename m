Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E84AC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE87C84F17;
	Fri, 28 Feb 2025 16:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TZXl3PNZIZRR; Fri, 28 Feb 2025 16:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD92084F18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD92084F18;
	Fri, 28 Feb 2025 16:57:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15021711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50DA1485E1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6AlrekDECzu for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 670F142DC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 670F142DC2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62A5183ACF; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 21:16:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 055f82ebbd07b582c992eed30ef5191f18873ba4
X-Git-Newrev: 780e14052e93fe9843812476f24060d0534325c0
X-Patchwork-Hint: ignore
Message-Id: <20250228163009.62A5183ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-betterproto:
 disable dependency check
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

commit: https://git.buildroot.net/buildroot/commit/?id=780e14052e93fe9843812476f24060d0534325c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We need to bypass an unnecessarily strict dependency version check.

Bypasses this error:
* Getting build dependencies for wheel...

ERROR Missing dependencies:
	poetry-core<2,>=1.0.0

Fixes:
 - http://autobuild.buildroot.net/results/0de/0de5b31bc649b97684deaa826e386ada50022d6a
 - https://gitlab.com/buildroot.org/buildroot/-/commit/2ae73dec68c437c2acb32bb76cdeb8cb17f5476a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to commit which introduced the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-betterproto/python-betterproto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
index 0fc43e86a2..4fbed23863 100644
--- a/package/python-betterproto/python-betterproto.mk
+++ b/package/python-betterproto/python-betterproto.mk
@@ -10,5 +10,6 @@ PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/4e/94/930a1368
 PYTHON_BETTERPROTO_SETUP_TYPE = poetry
 PYTHON_BETTERPROTO_LICENSE = MIT
 PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
+PYTHON_BETTERPROTO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

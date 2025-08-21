Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB3DCA0FE2
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C0361AC6;
	Thu, 21 Aug 2025 18:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRQA296U6k0t; Thu, 21 Aug 2025 18:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E2161AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E2161AED;
	Thu, 21 Aug 2025 18:57:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F180C25B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87A0407C0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcYfS5MXv5lb for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DFAC40DB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DFAC40DB7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3993287A0C; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:41:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 621eae3114f6c52add571f0665ff0f364c9eb7a3
X-Git-Newrev: 84164861c929b43a29ae0f029e02e096c1a1467f
X-Patchwork-Hint: ignore
Message-Id: <20250821185709.3993287A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bash: don't use
 append-assignment where unneeded
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

commit: https://git.buildroot.net/buildroot/commit/?id=84164861c929b43a29ae0f029e02e096c1a1467f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For the first, unconditional assignment, there is no reason to use
append-assignment; it can even be misleading.

Fixes: b367ca32e53a774c174899e44c77ed1d128cbcdc

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1c61d9c12be106472f3ff91498961e520489fca0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bash/bash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 84f581da79..2747802592 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -17,7 +17,7 @@ BASH_CONF_OPTS = \
 	--with-installed-readline \
 	--without-bash-malloc
 
-BASH_CONF_ENV += \
+BASH_CONF_ENV = \
 	ac_cv_rl_prefix="$(STAGING_DIR)" \
 	ac_cv_rl_version="$(READLINE_VERSION)" \
 	bash_cv_getcwd_malloc=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

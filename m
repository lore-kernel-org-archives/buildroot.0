Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE526E93800
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 19:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F21846FC;
	Sun, 12 Apr 2026 19:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCSRVqOZXPUw; Sun, 12 Apr 2026 19:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318BF846EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776023858;
	bh=5JXouipW0lloHefZVtyd1XUwICesbrfffWf+xj8wQ+k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UprpB4YtRD97TLHF2bZrsMJlC9Q/+/B+jhyRUiDGeSnQxizdt+R0FMIBRcXsZreBs
	 OHrCfdT/58vIHr4BjkTfXXG0ZQYlKQxO3at/c+QQiq5zbcl2xNjAybfsUkNEhG/dpD
	 EdJnocFOAZkRuaqZZ64vWbSyItSyyD7A8i6mmsPnSFbjUH2y/59zXm1fZ8jvg5iT0/
	 L3XJgSlp5oDrNj+Jq0u1jO46P1E5gQfNJZ19YaCIC9EXxrL/kb8zzSQfQ7NbT05DeT
	 QFPwtaz56l0AodHOSi9K3gEniM367dAWuYS4xV89nrIpXOaRh2GzmIvKHRx2kYK2Sb
	 p972DWdPivckg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318BF846EF;
	Sun, 12 Apr 2026 19:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 268EB283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 182554231E
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aUrJgmRqiO8 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 19:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E4D4422FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E4D4422FE
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 19:57:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB06C8120B; Sun, 12 Apr 2026 19:57:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 20:00:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f02b6b03188876c0790777134186c3b42694871d
X-Git-Newrev: ceaf09299bffd022e75045dfc9d8216aa9a5b63b
X-Patchwork-Hint: ignore
Message-Id: <20260412195735.DB06C8120B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drbd-utils: bump version to 9.34.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ceaf09299bffd022e75045dfc9d8216aa9a5b63b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/LINBIT/drbd-utils/blob/v9.34.0/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/drbd-utils/drbd-utils.hash | 2 +-
 package/drbd-utils/drbd-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.hash b/package/drbd-utils/drbd-utils.hash
index c9db5b6587..46c605417d 100644
--- a/package/drbd-utils/drbd-utils.hash
+++ b/package/drbd-utils/drbd-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  223fe07d0b646e991b33ba9ea41468f9a66f903562e7da766dd0fc6b4ea33db9  drbd-utils-9.33.0.tar.gz
+sha256  7063e6451056b6c51b1ab29e1a33321131286d11aeea3cb9f491458b3ca63dab  drbd-utils-9.34.0.tar.gz
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 82baba975d..9786275ccc 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRBD_UTILS_VERSION = 9.33.0
+DRBD_UTILS_VERSION = 9.34.0
 DRBD_UTILS_SITE = http://pkg.linbit.com/downloads/drbd/utils
 DRBD_UTILS_LICENSE = GPL-2.0+
 DRBD_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

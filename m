Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7618AE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2717361638;
	Sat, 14 Dec 2024 11:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SqWec6QDbDw; Sat, 14 Dec 2024 11:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D0D661651
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0D661651;
	Sat, 14 Dec 2024 11:11:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81884D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D47340268
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfIrrj3rIN9g for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 751F4400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 751F4400F9
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EE5286F7F; Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 09:51:21 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: ef3398862165948288e5751ce9ceaceb4a20cbb1
X-Git-Newrev: f882742c3543ad1225d2536627401e4c14b0863b
X-Patchwork-Hint: ignore
Message-Id: <20241214111108.5EE5286F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/freeipmi: update
 _SITE to use BR2_GNU_MIRROR
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

commit: https://git.buildroot.net/buildroot/commit/?id=f882742c3543ad1225d2536627401e4c14b0863b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The freeipmi package is distributed on the GNU project servers.
See [1] and [2]. Buildroot has the BR2_GNU_MIRROR configuration
which can be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

[1] https://www.gnu.org/software/freeipmi/download.html
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit bfa2dbc2d679b88d8166359ec916590050fb5802)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeipmi/freeipmi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index e28f63f715..fbbfd536e4 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FREEIPMI_VERSION = 1.6.14
-FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
+FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
 	COPYING COPYING.bmc-watchdog COPYING.ipmiconsole COPYING.ipmi-dcmi \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

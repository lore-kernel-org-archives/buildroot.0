Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D1E77180
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 11:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A6E60655;
	Sat, 14 Dec 2024 11:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uSaZxSkFu7N; Sat, 14 Dec 2024 11:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4752360A48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4752360A48;
	Sat, 14 Dec 2024 11:11:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ECA2C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3260A608C8
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zx-594x_sDIB for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B18160655
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B18160655
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50B9586F7E; Sat, 14 Dec 2024 11:11:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 09:51:20 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 93a2581bfd985e0cdcc86b3da4836cc1ccd47b91
X-Git-Newrev: ef3398862165948288e5751ce9ceaceb4a20cbb1
X-Patchwork-Hint: ignore
Message-Id: <20241214111108.50B9586F7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/octave: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef3398862165948288e5751ce9ceaceb4a20cbb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The octave package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

[1] https://www.octave.org/download
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit b0a1b0bab1238271ca99d6a453101d6b128b027a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/octave/octave.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 2e2fe0f989..34d9288c75 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OCTAVE_VERSION = 9.2.0
-OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
+OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
 OCTAVE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

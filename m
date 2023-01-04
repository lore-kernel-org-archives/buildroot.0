Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A32C46467
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 14:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBACC41757;
	Wed,  4 Jan 2023 14:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBACC41757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EEMm-YNdhKW; Wed,  4 Jan 2023 14:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE4441720;
	Wed,  4 Jan 2023 14:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE4441720
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 867711BF373
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 14:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DB38195D
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 14:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DB38195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxB-ccxU23Is for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91D8B8186E
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D8B8186E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C2BA874F8; Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 15:29:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d64a089a64aff7c8cbf197beea460d644646243d
X-Git-Newrev: 83c4edf83953bb86257e6b6e3b07f974fc66a37e
X-Patchwork-Hint: ignore
Message-Id: <20230104143228.7C2BA874F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libksba: update _SITE to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=83c4edf83953bb86257e6b6e3b07f974fc66a37e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to https download for firewall compatibility and security.
The https URL is also the one advertised on the package download page:
https://gnupg.org/download/index.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libksba/libksba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 3a8b3fa502..727a836cf4 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -6,7 +6,7 @@
 
 LIBKSBA_VERSION = 1.6.2
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
-LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
+LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
 LIBKSBA_CPE_ID_VENDOR = libksba_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

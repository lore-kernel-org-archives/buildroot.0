Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB27C54EBC
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 21:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5056B6105B;
	Tue, 10 Jan 2023 21:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5056B6105B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZL_odkpCSYsP; Tue, 10 Jan 2023 21:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D1C661050;
	Tue, 10 Jan 2023 21:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1C661050
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0D81BF86B
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 21:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7949241764
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 21:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7949241764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqmzLXFPVWYD for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 21:39:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D9284175D
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 21:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9284175D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58A858773E; Tue, 10 Jan 2023 21:39:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 19:40:16 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 10b7a47d4ddd7f1561128e6b1b894aa556ea5057
X-Git-Newrev: c539843db6dae15d9f80f1422c32921cda08e8ec
X-Patchwork-Hint: ignore
Message-Id: <20230110213952.58A858773E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libksba: update
 _SITE to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=c539843db6dae15d9f80f1422c32921cda08e8ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Switch to https download for firewall compatibility and security.
The https URL is also the one advertised on the package download page:
https://gnupg.org/download/index.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 83c4edf83953bb86257e6b6e3b07f974fc66a37e)
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

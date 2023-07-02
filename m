Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B96EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 11:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E5060A61;
	Sun,  2 Jul 2023 11:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E5060A61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyeYKBQYmR-w; Sun,  2 Jul 2023 11:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B6860A71;
	Sun,  2 Jul 2023 11:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B6860A71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9F321BF5E6
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 11:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B01CF60A64
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 11:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B01CF60A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlOOJK03ZJ66 for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 11:56:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE39E60A61
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE39E60A61
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 11:56:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3435DA4C01A0
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 13:56:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39860)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFvhD-0006Il-3B
 for buildroot@buildroot.org; Sun, 02 Jul 2023 13:56:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 13:56:51 +0200
Message-Id: <20230702115651.2430264-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688299012;
 bh=YVlUn4w9iTp9CywIw6zOBn7Z0xl2FDEuv5ZC3dBY3es=;
 h=From:To:Subject:Date:From;
 b=lIDUSNbrnCYW0vzGRAf9V8kwr0uo9yL/oK4RS791Tx30M6C3LUSjb59AqWSEvXykB
 yBkSka5rXuscWzo2RbldW92YHCmpAYfHr5RTEpTYErk+eRKAz1HcGCl6E4wOqml5Dn
 ZirDfvTY/bmVotoX0buCJi1xaakcKrUatOMZf7S6ayGUOA6uI7ODXAPYrBu9P5SAB2
 DTTDygbnvBcCe5l/UJF09ahVu4NBIDd09ze3pu/2bJ4dvzs6Pl9qia4Oek5WMIm058
 x2/t6fmDukdNizlfn4ihBXYtTmi1ymRX4KD2HO2sY2h0DYGLMV0TZ7aK15hH5zmF/0
 bXwwmJT+gGbJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=lIDUSNbr
Subject: [Buildroot] [PATCH 1/1] package/libssh2: disable rpath
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumping libssh2 to 1.11.0 with buildroot commit
af87ad197caf434936fe239f2718fd17b60fcb8b
causes build errors with libcurl due to "-R" being added to libssh2.pc.

Quoting autobuilder build-end.log

checking for recv... no
configure: error: Unable to link function recv

Quoting autobuilder libcurl-8.1.2/config.log

arc-buildroot-linux-uclibc-gcc.br_real: error: unrecognized command-line option '-R'

Fixes:
http://autobuild.buildroot.net/results/78f/78ffda92d51f8abdbcef93f968ace432d0d44979/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libssh2/libssh2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 8bedbdffba..a42be46a7a 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -11,7 +11,7 @@ LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
-LIBSSH2_CONF_OPTS = --disable-examples-build
+LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

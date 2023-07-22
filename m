Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114D5EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 07:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B769402E8;
	Sat, 22 Jul 2023 07:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B769402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zynxdgzSklLD; Sat, 22 Jul 2023 07:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF417401CA;
	Sat, 22 Jul 2023 07:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF417401CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A72AE1BF5A6
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 07:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 808DA60E63
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 07:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808DA60E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ms5u_VGoasXD for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 07:06:39 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 269FB60E3F
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 07:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 269FB60E3F
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB167A4C077A
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 09:06:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56606)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qN6hI-0001fw-1k
 for buildroot@buildroot.org; Sat, 22 Jul 2023 09:06:36 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 09:06:36 +0200
Message-Id: <20230722070636.22554-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690009596;
 bh=dMtj27PcJTYVOhi36ukFkkxqgQU+eQfqYi5xfwh9VyY=;
 h=From:To:Subject:Date:From;
 b=fCeoEYEZ5qcV3lLy6luRdExKrvI7QakyP5Nq2zfEH6YJBuGH2ZR2Nb1i8vA9c935I
 iIIjUSfjmS1xVWISprNQRDdX+nGhhgsV6Ii2IFIEuIUWb95kn57ThGpGzB28yuweXs
 OgKSsHSIFm4IldK0aUo2fEgU7DxU0kQ/W3yDVjEOMbhC0nW0DKMIvJfV5q7RrUdNpJ
 /BOaWPvD21xiPZjX6fKrOm7iuR50UVru6yeE1pUnSaRx8mQKt2Ni24UWHjE/lSmgVZ
 rq9kvBJkBwOBHNq2eQ3Ib+e1n4uYZ8d9R1S6QA6wvMLEwMzA3He9wyxwC5yLUlAaCW
 O7Hi3g64SjPvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fCeoEYEZ
Subject: [Buildroot] [PATCH 1/1] package/libpthread-stubs: bump version to
 0.5
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

Use xz tarball.

Release notes:
https://lists.x.org/archives/xorg-announce/2023-July/003410.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpthread-stubs/libpthread-stubs.hash | 4 +++-
 package/libpthread-stubs/libpthread-stubs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libpthread-stubs/libpthread-stubs.hash b/package/libpthread-stubs/libpthread-stubs.hash
index 3f82bb23e9..63393b014d 100644
--- a/package/libpthread-stubs/libpthread-stubs.hash
+++ b/package/libpthread-stubs/libpthread-stubs.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2023-July/003410.html
+sha256  59da566decceba7c2a7970a4a03b48d9905f1262ff94410a649224e33d2442bc  libpthread-stubs-0.5.tar.xz
+sha512  a24f7c40dcaf5f6ca0085972117fed5ad0851f6fc1972fdab799d27236afaaa4f7baa93e40532f93984d313d94456819aaf4ec8f8d1bbb2e5c4fc76c31891d82  libpthread-stubs-0.5.tar.xz
 # Locally computed
-sha256  e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733  libpthread-stubs-0.4.tar.bz2
 sha256  78c20706e799f2b8f445e71d3d2ade6ba23b3388fd6cbeed7d71796623febde8  COPYING
diff --git a/package/libpthread-stubs/libpthread-stubs.mk b/package/libpthread-stubs/libpthread-stubs.mk
index 9cf697075e..151e6eada8 100644
--- a/package/libpthread-stubs/libpthread-stubs.mk
+++ b/package/libpthread-stubs/libpthread-stubs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBPTHREAD_STUBS_VERSION = 0.4
-LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.bz2
+LIBPTHREAD_STUBS_VERSION = 0.5
+LIBPTHREAD_STUBS_SOURCE = libpthread-stubs-$(LIBPTHREAD_STUBS_VERSION).tar.xz
 LIBPTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist
 LIBPTHREAD_STUBS_LICENSE = MIT
 LIBPTHREAD_STUBS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

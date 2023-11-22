Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66119C61D99
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 15:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF837612DB;
	Wed, 22 Nov 2023 15:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF837612DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQsS8npWUQ5f; Wed, 22 Nov 2023 15:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477FF612B9;
	Wed, 22 Nov 2023 15:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477FF612B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56C011BF263
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 15:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B23741171
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 15:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B23741171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6costwut4kT for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 15:54:32 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 22 Nov 2023 15:54:32 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A05F4116E
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A05F4116E
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 15:54:31 +0000 (UTC)
Received: from evilbit.green-communications.fr ([85.168.41.102]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MWAWq-1qpwCk49AA-00XYtn; Wed, 22 Nov 2023 16:49:17 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 16:47:36 +0100
Message-ID: <20231122154837.31838-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:RLOOq/eD7TnjVrli27L85dNM5ehdoKJhpPa/YardDG6k3N/gvKs
 2UFA3Smb/0094ulSOlPppfed/VmyoLnk3KoSmqDQAberVY2NAhvBsm/lkwO+mESzqYKighH
 BTYm5BtSZwwjNaOahv0G6LK3fOlYHLky4jPGnBjeLe9Y2/lWpIukCrCMejgGiy673KtjjqE
 7X5EbWlt2TEwtn8VnIS/w==
UI-OutboundReport: notjunk:1;M01:P0:xUsfCZSNcX0=;EWrmyxknmqnTkJ6Bq8z8XR3146r
 gHhuaW6cin9Jy6BcDm5fNr5twruhLRI5uBgoKEWkl1WTcbVZUP+UzZnX4nTRQ0P9seOP/bDRF
 QO3IdUEGa8oZkQfUP4geZH7ARdtWAtC9uwKqhmpCumHc5k9m1pJHR2yJk72Ky6VYmNs7sQ9rG
 T8GuhozglTkB7M7g+1hGfqx1LjwQL+0/5Xb/mKrVIY1hRIae2yBHKqWRNQCJ8Ri4FR+NSUACB
 pB4Du7QgomA8YhASW1Ag+uYux8u8KM/FDn9lxjEMUEOt51WigV8y3zoS9lS48jliF8PQYcnNw
 8VFGwmPo5W9GWPQGUqL87J1axr5GgLTdUHCpUB7AuAJuYUogQTUhKBC7XxesnpnzpFH7v/Y4f
 9qDKNp/mcHS/VMNOelNg2N+2k3TwTvriY6ZWjteXtlFYbMsfDEA/HHNbDOECEa4E81NHNeAVM
 LcxbAG+pbCTudszfcbMVoI7XPKYgOKl0coVKGK2qOOXFRV+A33sf3Z46pEU/SK9uPS7DeCAWm
 kKDbnvyof2J1vC+EUZg5W/UX5of2lEJD/NQ1DSpPEbnHVObIYC6PKIuVcZNdFKm5XKYwsvRY/
 ksC6Biy6sBQQKQN3mlP/1UEjiDc8jWFo4u432JoNDgm54lJeoGXCzmebmP/qmK84YEK2WzjbL
 7/jkKzF1r6pulv9trZG1xErgXDORJg1HT8fM0uBopxm3xCkoQVbKy+GBr3gSME6l2OJ2fNIC9
 k8uw4DqimvM87WMZ+Z406K6aC08T9jLY/hDZwmqtu/9qhbu8EqUt9Bn7NCbsB+6GSk5FC7q45
 BBUf9UBs1s82PiCujfrp31k8W45c4OREqOOkZ/KZORiJGpRYYoUV8oFwXPeprcV1WibnWCj3Y
 WKdi0UhagXlNRbQ==
Subject: [Buildroot] [PATCH 1/1] package/gcc: fix disabling the documentation
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gcc.mk attempts to disable building the documentation by setting
MAKEINFO=missing, but it is not working.  If makeinfo is installed
and recent enough, gcc still uses it.  This can be checked easily:

grep BUILD_INFO='info' host-gcc-initial-*/build/gcc/config.log

It happens because the root ./configure script will check
$MAKEINFO --version (aka 'missing --version') and will overwrite it with
MAKEINFO='missing makeinfo' because the version does not match.

Having MAKEINFO='missing makeinfo' is a problem because
'missing makeinfo' will actually attempt to run 'makeinfo' before
failing with an error message.  If makeinfo is installed on the host,
then 'missing makeinfo' will successfully run makeinfo anyway.

Many gcc subprojects will check $MAKEINFO --version and enable building
the documentation if it is recent enough.  This patch overrides these
checks by forcing gcc_cv_prog_makeinfo_modern=no.

Building the GCC documentation can fail with the wrong makeinfo version.
It happened at least when building GCC 11.3.0 with makeinfo 7.1.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

---

This patch is mostly useful when backported to 2023.02
---
 package/gcc/gcc.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 9a164c8374..93bc46643c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -91,9 +91,12 @@ HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
 endif
 
 # Don't build documentation. It takes up extra space / build time,
-# and sometimes needs specific makeinfo versions to work
+# and sometimes needs specific makeinfo versions to work. Override the check
+# for a modern makeinfo otherwise the configure scripts will still enable it.
 HOST_GCC_COMMON_CONF_ENV = \
 	MAKEINFO=missing
+HOST_GCC_COMMON_MAKE_OPTS = \
+	gcc_cv_prog_makeinfo_modern=no
 
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
@@ -298,7 +301,7 @@ HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 # For gcc-final, the gcc logic to detect whether SSP support is
 # available or not in the C library is not working properly for
 # uClibc, so let's be explicit as well.
-HOST_GCC_COMMON_MAKE_OPTS = \
+HOST_GCC_COMMON_MAKE_OPTS += \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1FCEE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 13:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39F6C40994;
	Mon, 11 Sep 2023 13:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39F6C40994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JT2WlXGQk2ri; Mon, 11 Sep 2023 13:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE8E4416D2;
	Mon, 11 Sep 2023 13:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE8E4416D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBD791BF30F
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B27CC60E89
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B27CC60E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0c-zBEWYHf4 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 13:17:17 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1050960E87
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 13:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1050960E87
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.237]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgvvJ-1pyeKV3J5p-00hLvB for <buildroot@buildroot.org>; Mon, 11 Sep 2023
 15:17:14 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 15:17:14 +0200
Message-ID: <20230911131714.705-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:05i0qLrI3TExMbc2iWp/3dhoHmMr73zBzBre4NOpwrLjRXCt7Cs
 PFR6EdDyphl8M1h74huWcI/3p33NBYbJ8RUsWHI3g8G3DH1bXqiLNY90JskKZa9wA5Gy+1F
 tkmF8PVxHJhkrkFWMEOeBocgt8EIFI+CsAOciqZtW1lf5bk5IRknwYSd0HUH6TIXRB/hPIi
 BO7nX1OPYme0YztlMQKuQ==
UI-OutboundReport: notjunk:1;M01:P0:+4/v2HbuB/s=;gbkfZlHRh7O7EuPrOI4IpNE0sVx
 2DaEdekVEAKp5KOew6edQSBsNQwhq9GFuL9dGSlez5aQMb3ZGekAB4mZfHjnsufl4lU1Kf4ma
 pcoCYo2PsSivaL8uT/BUMLGVaV0HUK1ejAMau110/lx8/zuZSm8lKWZpCiqTcwF1KfiG2+4KE
 ZOZtWt2g1DDKY9ChxhZfY6kyylNNAlSf1TQ85D3jU2BYVMkO8jCP29w8kSZ+nTEaYOz4Jtu2H
 YhkqCKIikEU9HSKGAXX5j9ZedhIzHIigWzpR9SKUHGnbM/4O8keQMiOisD126GlFLR3HIY1vH
 o52aQdyQicUotN9o2pmAP3J5MLUKWafEgX/4DdRKXX4sjSUo3YFT9InwFwLuNFbFsIcPwEHHc
 bzf1EcbfdBoxQsXNeMELd+8JlAtMSfQ83I4UG7u6+IFltWp/z5/kzKADfmfDUfaaztLtACRNP
 7WaCpL4+ZwrpjpxXPXJidTZwXSIjffyKlTBvDa5OP2MOXz2yXMNnOCKw7ruHIpoVAlgTE7t/H
 SFkb5QNwGSN2gQu8DBnRraQgjT+E4Hrnw0meWP8DNjkr1nSR0cLUKmra/6T6BBg3oSUfgLIXI
 fTZ7Ncm219MlmMktDpax+ilC7nqLsMW8M4xtZgBj17YFbOmavJVo0c6otWtle25QARfN15vwp
 LdLNvMLwXNcMC6XP6dpaBE9jSucN0+j+Jtb7KmfWb4zIAt60wpEB0Sa8GtK4qN+U29fNbCNKf
 /W9Q1qwnMJ56/uMVxOhMYCoY8angYejjY01zGcIyUoEyT5xhxuDR/da3wKZvbcyO9v+gnCLjj
 1F1P58EB2P2JdAR+l291m2utSStsazU2JnYu+bEneowNTqOtBeJVH0cJiFW18fO6dHJhUqfbC
 O5eVjwwkNL996plNbDLBL6gyCBgoEhYQYi5kt0IPKaXBk6xsWkAt7TJc+SZ1vn4Ua8dwI/I6M
 6dl1ntz3dUrr21eFXAi8YsCOLpg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1694438235; x=1695043035; i=ps.report@gmx.net;
 bh=fSx1XAEcsVQj6rKKUNqJZo1Cbkg03y4U9vCq7MhvGtA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=gfWBCyV2SIKkzFhwZ4Xl60+DLIWNIjLP5T4Ev5couYkeRKOy+TB3s8ia9cWBry5IAJbTgVC
 kXjNvbtMILZ4ZGNL9WuVjX5/jrfF4u/AfSAqti2kcBtNojHchFnw9dk1cbFBsN427EIltvLNj
 QgVF5Y9gGjr2mivoq6zKzT7FpQ8H2MTqUcpgDHvB1yNJZljBMxt1AdPLO2Tz0vWEr9hxQtOXw
 REe/WKvit2AJ8bb2lEn5W/LEUMjkhDetVyMjldVXOg2HUJlHYIo7FjuIvIriDS6HKiXffq+Br
 uf2nHJ9sBp8zRgNwy9FN6iaJEf7ThuU/mVb9MKQPuoF+u+XR/2Hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=gfWBCyV2
Subject: [Buildroot] [PATCH v1] package/speechd: bump version to 0.11.5
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

- remove 0001-add-disable-doc.patch (upstream applied, see [1])

For details see [2].

[1] https://github.com/brailcom/speechd/commit/1dbc42684dcd3519fbc93da7e4164aa8dba8808f
[2] https://github.com/brailcom/speechd/releases/tag/0.11.5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/speechd/0001-add-disable-doc.patch | 78 ----------------------
 package/speechd/speechd.hash               |  2 +-
 package/speechd/speechd.mk                 |  2 +-
 3 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 package/speechd/0001-add-disable-doc.patch

diff --git a/package/speechd/0001-add-disable-doc.patch b/package/speechd/0001-add-disable-doc.patch
deleted file mode 100644
index dd17b10e4f..0000000000
--- a/package/speechd/0001-add-disable-doc.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From d88557d3c29c33f76af20cb7a6eb798f6f598c23 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Feb 2023 15:18:35 +0100
-Subject: [PATCH] add --disable-doc
-
-Allow the user to disable documentation through --disable-doc to avoid
-the following build failure without makeinfo:
-
-make[3]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/doc'
-  MAKEINFO ssip.info
-  MAKEINFO spd-say.info
-/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
-/home/buildroot/autobuild/instance-2/output-1/build/speechd-0.11.4/missing: line 81: makeinfo: command not found
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <https://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <https://www.gnu.org/software/make/>
-WARNING: 'makeinfo' is missing on your system.
-         You should only need it if you modified a '.texi' file, or
-         any other file indirectly affecting the aspect of the manual.
-         You might want to install the Texinfo package:
-         <https://www.gnu.org/software/texinfo/>
-         The spurious makeinfo call might also be the consequence of
-         using a buggy 'make' (AIX, DU, IRIX), in which case you might
-         want to install GNU make:
-         <https://www.gnu.org/software/make/>
-make[3]: *** [Makefile:492: ssip.info] Error 127
-
-Fixes:
- - http://autobuild.buildroot.org/results/d4f193545eb31864a9bac5a9d05bba39d3c7ff3e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/brailcom/speechd/pull/810]
----
- Makefile.am  | 6 +++++-
- configure.ac | 4 ++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 26617c78..480eb50e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -22,7 +22,11 @@ pkgconfig_DATA = speech-dispatcher.pc
- 
- BUILT_SOURCES = $(top_srcdir)/.version
- 
--SUBDIRS= include locale src config doc po
-+SUBDIRS= include locale src config po
-+
-+if ENABLE_DOC
-+SUBDIRS += doc
-+endif
- 
- EXTRA_DIST= config.rpath COPYING.LGPL COPYING.GPL-2 COPYING.GPL-3 ANNOUNCE BUGS FAQ README.md README.packagers README.translators README.overview.md README.style.md build.sh speech-dispatcherd.service.in speech-dispatcher.socket speech-dispatcher.service.in po/Makevars.in po/README
- 
-diff --git a/configure.ac b/configure.ac
-index faaa8629..4f2af908 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -168,6 +168,10 @@ AC_SUBST([EXTRA_SOCKET_LIBS])
- AC_SUBST([ERROR_CFLAGS])
- AC_SUBST([RDYNAMIC])
- 
-+AC_ARG_ENABLE([doc],
-+              [AC_HELP_STRING([--disable-doc], [turn off documentation])])
-+AM_CONDITIONAL(ENABLE_DOC, test "$enable_doc" != "no")
-+
- # Check for python support.
- # Python 3 or greater required
- AC_ARG_ENABLE([python],
--- 
-2.39.0
-
diff --git a/package/speechd/speechd.hash b/package/speechd/speechd.hash
index 4eb4cd09d2..0b02a35792 100644
--- a/package/speechd/speechd.hash
+++ b/package/speechd/speechd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  628d4446894b47f0df099123924c1070180b5b5b09c5b637ebe80d8578fba92f  speechd-0.11.4.tar.gz
+sha256  cc4b388fce40681eaff3545e9cc0642216c13c420d5676a4d28c957ddcb916de  speechd-0.11.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL-3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index ae777c6d30..c68d466116 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPEECHD_VERSION = 0.11.4
+SPEECHD_VERSION = 0.11.5
 SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
 SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
 SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

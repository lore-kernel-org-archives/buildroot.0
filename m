Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C109EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 13:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8247C416CE;
	Sat,  8 Jul 2023 13:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8247C416CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvsBJz3jH0re; Sat,  8 Jul 2023 13:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41268416D2;
	Sat,  8 Jul 2023 13:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41268416D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 778991BF23B
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 13:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51877416D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 13:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51877416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5K5DqZqgqs0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 13:00:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD060416CE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD060416CE
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 13:00:21 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp5-g21.free.fr (Postfix) with ESMTP id B55B25FF33;
 Sat,  8 Jul 2023 15:00:18 +0200 (CEST)
Date: Sat, 8 Jul 2023 15:00:18 +0200 (CEST)
From: friedtj@free.fr
To: buildroot <buildroot@buildroot.org>
Message-ID: <1804084242.19433889.1688821218678.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [194.167.45.227]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF109 (Linux)/9.0.0_GA_1337)
Thread-Index: A87Wwp+V9kjOlryOqPSArALd5Sq/Qw==
Thread-Topic: package/linuxptp: bump version to 4.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688821218;
 bh=E87eLg8LPHUnQVsE/xJ25NgYibJe7jqxhx+4dJeKbpA=;
 h=Date:From:To:Cc:Subject:From;
 b=SDFSjOA60+MWUnuT1XUoKXt+3r5/1VgrayeLrQQeCpANl8ue+Tg/UypaywIVOBZkf
 KCdPWSRlB9UsnikxSlC1wBE3Gza3zCAfgV1hF3/uoPBw/5jXG89Ia5d5M8laGgnp5U
 Cc1alU9TqHLcpzDp6Ycvhp3eQN1cThWvkHel3urqpG2vsJK0QMV9gHA4e4Vp0XeeND
 sUPnxBRCOB31AfiO2UVfl2UExed9vdXPlMLKRsMounf3el0YkAEvtujpjhCKd2YvpP
 BIvSvwiEqWxKketXFnXHaxAy2lGaWJi240+8UQD1KyRHKnaMjjsrjdvdyTwLz45t6r
 /fsnUjFu6OGyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SDFSjOA6
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: bump version to 4.0
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
Cc: heiko thiery <heiko.thiery@gmail.com>, brain <brain@jikos.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current linuxptp is missing multiple options added lately as described at
https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg04908.html
and the upgrade to 4.0 removes the need for applying patches already included in 
the current release. Tested functional on a Raspberry Pi Compute Module 4 
(raspberrypicm4io_64_defconfig).

Signed-off-by: Jean-Michel Friedt <friedtj@free.fr>
---
 ...g.h-drop-clock_nanosleep-replacement.patch | 49 -------------------
 ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 ----------------
 package/linuxptp/linuxptp.hash                |  7 +--
 package/linuxptp/linuxptp.mk                  |  2 +-
 4 files changed, 2 insertions(+), 99 deletions(-)
 delete mode 100644 package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
 delete mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch

diff --git a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch b/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
deleted file mode 100644
index 54ef963ae4..0000000000
--- a/package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 947bf03ec3d9eaa0bfc0269eed86b9364e94bc1a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 5 Aug 2018 15:25:53 +0200
-Subject: [PATCH] missing.h: drop clock_nanosleep() replacement
-
-Since uClibc-ng commits 68628fe7d463541bf3c33da6b214e63c0cc9feed
-("librt: declare clock_nanosleep not only for NPTL") and
-ddbb03e77ac1a48740688814b82f45c97ee81f37 ("librt: clock_nanosleep
-could be even used without threads"), clock_nanosleep() is always
-provided by uClibc, regardless of the thread implementation (none,
-linuxthreads, nptl). These commits will be part of the upcoming 1.0.31
-release of uClibc-ng.
-
-Thanks to this, we can drop the replacement clock_nanosleep()
-implementation added by linuxptp. Without this, linuxptp fails to
-build with:
-
-missing.h:117:19: error: static declaration of 'clock_nanosleep' follows non-static declaration
- static inline int clock_nanosleep(clockid_t clock_id, int flags,
-                   ^~~~~~~~~~~~~~~
-In file included from clockadj.h:24:0,
-                 from clockadj.c:24:
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- missing.h | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/missing.h b/missing.h
-index 2f7adb9..60f89a3 100644
---- a/missing.h
-+++ b/missing.h
-@@ -129,13 +129,6 @@ enum {
- 
- #define TFD_TIMER_ABSTIME (1 << 0)
- 
--static inline int clock_nanosleep(clockid_t clock_id, int flags,
--                                const struct timespec *request,
--                                struct timespec *remain)
--{
--      return syscall(__NR_clock_nanosleep, clock_id, flags, request, remain);
--}
--
- static inline int timerfd_create(int clockid, int flags)
- {
-       return syscall(__NR_timerfd_create, clockid, flags);
--- 
-2.14.4
-
diff --git a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
deleted file mode 100644
index 73cd34f744..0000000000
--- a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 23 Nov 2022 08:23:46 +0800
-Subject: [Linuxptp-devel] [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
-
-Refer [1],from make 4.4, all variables that are marked as export will
-also be passed to the shell started by the shell function. use "=" will
-make KBUILD_OUTPUT always empty for shell function, use "?=" to make
-"export KBUILD_OUTPUT" in enrironment can work.
-
-[snip of 4.4 NEWS]
-* WARNING: Backward-incompatibility!
-   Previously makefile variables marked as export were not exported to commands
-   started by the $(shell ...) function.  Now, all exported variables are
-   exported to $(shell ...).
-[snip]
-
-[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-[Retrieved from mailing list. The patch was not yet accepted and applied:
-https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg06151.html]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-
----
- makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makefile b/makefile
-index 9aed383..ba3fb38 100644
---- a/makefile
-+++ b/makefile
-@@ -15,7 +15,7 @@
- # with this program; if not, write to the Free Software Foundation, Inc.,
- # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- 
--KBUILD_OUTPUT =
-+KBUILD_OUTPUT ?=
- 
- DEBUG =
- CC    = $(CROSS_COMPILE)gcc
--- 
-2.25.1
diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index a5479b0ebc..a995d133a7 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,4 @@
-# From https://sourceforge.net/projects/linuxptp/files/v3.1.1/
-sha1  f905eabc6fd0f03c6a353f9c4ba188a3bd1b774c  linuxptp-3.1.1.tgz
-md5  3b79ab5e77c5b5cf06bc1c8350d405bb  linuxptp-3.1.1.tgz
-
 # Locally computed:
-sha256  94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad02608bdef3be1c0d9  linuxptp-3.1.1.tgz
-
+sha256  d27d5ef296bb3d285e22e69f75ae023b4b42a2f4655130d6d390d8afcbc3d933  linuxptp-4.0.tgz
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 048dd0b896..054442d569 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 3.1.1
+LINUXPTP_VERSION = 4.0
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.38.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A11C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161DD60527
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 161DD60527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2FED80D6A;
	Tue, 26 Oct 2021 12:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otw37uTBp8R5; Tue, 26 Oct 2021 12:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D2080D83;
	Tue, 26 Oct 2021 12:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E025C1BF9AA
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFCF6607AB
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiwBXbMTO3sD for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:27:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 354FA6068A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 006A888DD4; Tue, 26 Oct 2021 12:24:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:26:00 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: fccedaf0d9e22c102ee9f5d0b2d7a4e41429ebf6
X-Git-Newrev: ab66fc9a5c1a2415610b8b8c439ea0568f9d6b38
X-Patchwork-Hint: ignore
Message-Id: <20211026122410.006A888DD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/asterisk:
 security bump to version 16.21.1
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
Content-Type: multipart/mixed; boundary="===============3326737706745358460=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3326737706745358460==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ab66fc9a5c1a2415610b8b8c439ea0568f9d6b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes the following security issues:

16.15.0:
- ASTERISK-29057: pjsip: Crash on call rejection during high load

16.15.1:
- AST-2020-003: Remote crash in res_pjsip_diversion
  A crash can occur in Asterisk when a SIP message is received that has a
  History-Info header, which contains a tel-uri.
  https://downloads.asterisk.org/pub/security/AST-2020-003.pdf

- AST-2020-004: Remote crash in res_pjsip_diversion
  A crash can occur in Asterisk when a SIP 181 response is received that has
  a Diversion header, which contains a tel-uri.
  https://downloads.asterisk.org/pub/security/AST-2020-004.pdf

16.16.0:
- ASTERISK-29219: res_pjsip_diversion: Crash if Tel URI contains History-Info

16.16.1:
- AST-2021-001: Remote crash in res_pjsip_diversion
  If a registered user is tricked into dialing a malicious number that sends
  lots of 181 responses to Asterisk, each one will cause a 181 to be sent
  back to the original caller with an increasing number of entries in the
  “Supported” header.  Eventually the number of entries in the header
  exceeds the size of the entry array and causes a crash.
  https://downloads.asterisk.org/pub/security/AST-2021-001.pdf

- AST-2021-002: Remote crash possible when negotiating T.38
  When re-negotiating for T.38 if the initial remote response was delayed
  just enough Asterisk would send both audio and T.38 in the SDP.  If this
  happened, and the remote responded with a declined T.38 stream then
  Asterisk would crash.
  https://downloads.asterisk.org/pub/security/AST-2021-002.pdf

- AST-2021-003: Remote attacker could prematurely tear down SRTP calls
  An unauthenticated remote attacker could replay SRTP packets which could
  cause an Asterisk instance configured without strict RTP validation to
  tear down calls prematurely.
  https://downloads.asterisk.org/pub/security/AST-2021-003.pdf

- AST-2021-004: An unsuspecting user could crash Asterisk with multiple
  hold/unhold requests
  Due to a signedness comparison mismatch, an authenticated WebRTC client
  could cause a stack overflow and Asterisk crash by sending multiple
  hold/unhold requests in quick succession.
  https://downloads.asterisk.org/pub/security/AST-2021-004.pdf

- AST-2021-005: Remote Crash Vulnerability in PJSIP channel driver
  Given a scenario where an outgoing call is placed from Asterisk to a
  remote SIP server it is possible for a crash to occur.
  https://downloads.asterisk.org/pub/security/AST-2021-005.pdf

16.16.2:
- AST-2021-006: Crash when negotiating T.38 with a zero port
  When Asterisk sends a re-invite initiating T.38 faxing and the endpoint
  responds with a m=image line and zero port, a crash will occur in
  Asterisk.
  This is a reoccurrence of AST-2019-004.
  https://downloads.asterisk.org/pub/security/AST-2021-006.pdf

16.17.0:
- ASTERISK-29203 / AST-2021-002 — Another scenario is causing a crash

- ASTERISK-29260: sRTP Replay Protection ignored; even tears down long calls

- ASTERISK-29227: res_pjsip_diversion: sending multiple 181 responses causes
  memory corruption and crash

16.19.1:
- AST-2021-007: Remote Crash Vulnerability in PJSIP channel driver
  When Asterisk receives a re-INVITE without SDP after having sent a BYE
  request a crash will occur.  This occurs due to the Asterisk channel no
  longer being present while code assumes it is.
  https://downloads.asterisk.org/pub/security/AST-2021-007.pdf

- AST-2021-008: Remote crash when using IAX2 channel driver
  If the IAX2 channel driver receives a packet that contains an unsupported
  media format it can cause a crash to occur in Asterisk.
  https://downloads.asterisk.org/pub/security/AST-2021-008.pdf

- AST-2021-009: pjproject/pjsip: crash when SSL socket destroyed during
  handshake
  Depending on the timing, it’s possible for Asterisk to crash when using a
  TLS connection if the underlying socket parent/listener gets destroyed
  during the handshake.
  https://downloads.asterisk.org/pub/security/AST-2021-009.pdf

16.20.0:
- ASTERISK-29415: Crash in PJSIP TLS transport

- ASTERISK-29381: chan_pjsip: Remote denial of service by an authenticated
  user

In addition, a large number of bugfixes.

Drop now upstreamed
0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 289a15f33b522ca5c90bef0cdb0851412b00c811)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uses-a-compile-failure-with-autoconf-2-70.patch | 171 ---------------------
 package/asterisk/asterisk.hash                     |   2 +-
 package/asterisk/asterisk.mk                       |   2 +-
 3 files changed, 2 insertions(+), 173 deletions(-)

diff --git a/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch b/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
deleted file mode 100644
index cced0bbae7..0000000000
--- a/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From 060ce10163e46a740c15036fc56214468abc710b Mon Sep 17 00:00:00 2001
-From: Jaco Kroon <jaco@uls.co.za>
-Date: Fri, 8 Jan 2021 18:02:47 +0200
-Subject: [PATCH] AC_HEADER_STDC causes a compile failure with autoconf 2.70
-
-From https://www.mail-archive.com/bug-autoconf@gnu.org/msg04408.html
-
-> ... the long-obsolete AC_HEADER_STDC, previously used internally by
-> AC_INCLUDES_DEFAULT, used AC_EGREP_HEADER.  The AC_HEADER_STDC macro
-> is now a no-op (and is not used at all within Autoconf anymore), so
-> that change is likely what made the first use of AC_EGREP_HEADER the
-> one inside the if condition, causing the observed results.
-
-The implication is that the test does nothing anyway, and due to it
-being a no-op from 2.70 onwards, results in the required not being set
-to yes, resulting in ./configure to fail.
-
-Change-Id: Ic1ff38d87f791fbf1f2a80512f81bb7110392460
-Signed-off-by: Jaco Kroon <jaco@uls.co.za>
-
-[Retrieved from:
-https://github.com/asterisk/asterisk/commit/060ce10163e46a740c15036fc56214468abc710b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure    | 116 ---------------------------------------------------
- configure.ac |   5 ---
- 2 files changed, 121 deletions(-)
-
-diff --git a/configure b/configure
-index 3594ac62f0c..735a8e98c7f 100755
---- a/configure
-+++ b/configure
-@@ -13129,122 +13129,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
-   as_fn_error $? "*** Could not find dirent header that defines 'DIR'." "$LINENO" 5
- fi
- 
--{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ANSI C header files" >&5
--$as_echo_n "checking for ANSI C header files... " >&6; }
--if ${ac_cv_header_stdc+:} false; then :
--  $as_echo_n "(cached) " >&6
--else
--  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
--/* end confdefs.h.  */
--#include <stdlib.h>
--#include <stdarg.h>
--#include <string.h>
--#include <float.h>
--
--int
--main ()
--{
--
--  ;
--  return 0;
--}
--_ACEOF
--if ac_fn_c_try_compile "$LINENO"; then :
--  ac_cv_header_stdc=yes
--else
--  ac_cv_header_stdc=no
--fi
--rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
--
--if test $ac_cv_header_stdc = yes; then
--  # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
--  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
--/* end confdefs.h.  */
--#include <string.h>
--
--_ACEOF
--if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "memchr" >/dev/null 2>&1; then :
--
--else
--  ac_cv_header_stdc=no
--fi
--rm -f conftest*
--
--fi
--
--if test $ac_cv_header_stdc = yes; then
--  # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
--  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
--/* end confdefs.h.  */
--#include <stdlib.h>
--
--_ACEOF
--if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "free" >/dev/null 2>&1; then :
--
--else
--  ac_cv_header_stdc=no
--fi
--rm -f conftest*
--
--fi
--
--if test $ac_cv_header_stdc = yes; then
--  # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
--  if test "$cross_compiling" = yes; then :
--  :
--else
--  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
--/* end confdefs.h.  */
--#include <ctype.h>
--#include <stdlib.h>
--#if ((' ' & 0x0FF) == 0x020)
--# define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
--# define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
--#else
--# define ISLOWER(c) \
--		   (('a' <= (c) && (c) <= 'i') \
--		     || ('j' <= (c) && (c) <= 'r') \
--		     || ('s' <= (c) && (c) <= 'z'))
--# define TOUPPER(c) (ISLOWER(c) ? ((c) | 0x40) : (c))
--#endif
--
--#define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
--int
--main ()
--{
--  int i;
--  for (i = 0; i < 256; i++)
--    if (XOR (islower (i), ISLOWER (i))
--	|| toupper (i) != TOUPPER (i))
--      return 2;
--  return 0;
--}
--_ACEOF
--if ac_fn_c_try_run "$LINENO"; then :
--
--else
--  ac_cv_header_stdc=no
--fi
--rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
--  conftest.$ac_objext conftest.beam conftest.$ac_ext
--fi
--
--fi
--fi
--{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_header_stdc" >&5
--$as_echo "$ac_cv_header_stdc" >&6; }
--if test $ac_cv_header_stdc = yes; then
--
--$as_echo "#define STDC_HEADERS 1" >>confdefs.h
--
--fi
--
--if test "$ac_cv_header_stdc" != "yes"; then
--  as_fn_error $? "*** ANSI C header files not found." "$LINENO" 5
--fi
--
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sys/wait.h that is POSIX.1 compatible" >&5
- $as_echo_n "checking for sys/wait.h that is POSIX.1 compatible... " >&6; }
- if ${ac_cv_header_sys_wait_h+:} false; then :
-diff --git a/configure.ac b/configure.ac
-index 9ae3769d02e..2260fe63268 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -616,11 +616,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
-   AC_MSG_ERROR([*** Could not find dirent header that defines 'DIR'.])
- fi
- 
--AC_HEADER_STDC
--if test "$ac_cv_header_stdc" != "yes"; then
--  AC_MSG_ERROR([*** ANSI C header files not found.])
--fi
--
- AC_HEADER_SYS_WAIT
- if test "$ac_cv_header_sys_wait_h" != "yes"; then
-   AC_MSG_ERROR([*** POSIX.1 compatible sys/wait.h is required.])
diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index bd83636271..eabe11e052 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  226eaef400d2d335ce29d7b3c8aca8dfdfc5e854c215e0c47615c095ced12171  asterisk-16.14.1.tar.gz
+sha256  1ba86666072b903e24b5cfef3d6d607d0d090c0fd232429ed410496e8f93ac40  asterisk-16.21.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 5a125c3abd..d3a1cd08ff 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.14.1
+ASTERISK_VERSION = 16.21.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

--===============3326737706745358460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3326737706745358460==--

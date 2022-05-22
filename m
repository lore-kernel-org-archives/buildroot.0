Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE070C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68C5041845;
	Sun, 22 May 2022 10:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AHewkQqb6Ok; Sun, 22 May 2022 10:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FD441834;
	Sun, 22 May 2022 10:24:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 080811BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7282F4152D
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sud4lGxp6h3 for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40AF9415C7
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A262E85FD5; Sun, 22 May 2022 10:10:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 22 May 2022 12:09:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5b773b382d4285933891c503b62a2f541292af4f
X-Git-Newrev: 95fe8b2276a983e420b05acbd1691edf22bac56a
X-Patchwork-Hint: ignore
Message-Id: <20220522101055.A262E85FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/asterisk:
 security bump to version 16.25.2
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
Content-Type: multipart/mixed; boundary="===============0859281804128054650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0859281804128054650==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=95fe8b2276a983e420b05acbd1691edf22bac56a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

16.24.1:

CVE-2021-37706 / AST-2022-004: pjproject: integer underflow on STUN message

The header length on incoming STUN messages that contain an ERROR-CODE
attribute is not properly checked.  This can result in an integer underflow.
Note, this requires ICE or WebRTC support to be in use with a malicious
remote party.

https://seclists.org/fulldisclosure/2022/Mar/0

CVE-2022-23608 / AST-2022-005: pjproject: undefined behavior after freeing a
dialog set

When acting as a UAC, and when placing an outgoing call to a target that then
forks Asterisk may experience undefined behavior (crashes, hangs, etc…)
after a dialog set is prematurely freed.

https://seclists.org/fulldisclosure/2022/Mar/1

CVE-2022-21723 / AST-2022-006: pjproject: unconstrained malformed multipart
SIP message

If an incoming SIP message contains a malformed multi-part body an out of
bounds read access may occur, which can result in undefined behavior.  Note,
it’s currently uncertain if there is any externally exploitable vector
within Asterisk for this issue, but providing this as a security issue out
of caution.

https://seclists.org/fulldisclosure/2022/Mar/2

16.25.2:

CVE-2022-26498 / AST-2022-001: res_stir_shaken: resource exhaustion with
large files

When using STIR/SHAKEN, it’s possible to download files that are not
certificates. These files could be much larger than what you would expect to
download.

https://seclists.org/fulldisclosure/2022/Apr/17

CVE-2022-26499 / AST-2022-002: res_stir_shaken: SSRF vulnerability with
Identity header

When using STIR/SHAKEN, it’s possible to send arbitrary requests like GET to
interfaces such as localhost using the Identity header.

https://seclists.org/fulldisclosure/2022/Apr/18

CVE-2022-26651 / AST-2022-003: func_odbc: Possible SQL Injection

Some databases can use backslashes to escape certain characters, such as
backticks.  If input is provided to func_odbc which includes backslashes it
is possible for func_odbc to construct a broken SQL query and the SQL query
to fail.

https://seclists.org/fulldisclosure/2022/Apr/19

Update hash of sha1.c after a doxygen comment update:
https://github.com/asterisk/asterisk/commit/37c29b6a281d7f69e891117269dbf8c20bacc904

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 607162a09c5dcbc630895cb9a44b1dff83b02929)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index eabe11e052..fe59483b73 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1ba86666072b903e24b5cfef3d6d607d0d090c0fd232429ed410496e8f93ac40  asterisk-16.21.1.tar.gz
+sha256  0fb817943a276f5e540c2a9432e8841cd3393e7c1bd1250055c620902f6eafc8  asterisk-16.25.2.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
@@ -10,6 +10,6 @@ sha256  449fb810d16502c3052fedf02f7e77b36206ac5a145f3dacf4177843a2fcb538  asteri
 
 # License files, locally computed
 sha256  82af40ed7f49c08685360811993d9396320842f021df828801d733e8fdc0312f  COPYING
-sha256  ac5571f00e558e3b7c9b3f13f421b874cc12cf4250c4f70094c71544cf486312  main/sha1.c
+sha256  3ce4755b8da872a0de93ecdbbe2f940763cc95c9027bbf3c4a2e914fcd8bf4c6  main/sha1.c
 sha256  6215e3ed73c3982a5c6701127d681ec0b9f1121ac78a28805bd93f93c3eb84c0  codecs/speex/speex_resampler.h
 sha256  ea69cc96ab8a779c180a362377caeada71926897d1b55b980f04d74ba5aaa388  utils/db1-ast/include/db.h
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 2b7854b982..9b59997b80 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.21.1
+ASTERISK_VERSION = 16.25.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

--===============0859281804128054650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0859281804128054650==--

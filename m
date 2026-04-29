Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4CEFF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4A4423B9;
	Wed, 29 Apr 2026 12:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaofXPKgqJRI; Wed, 29 Apr 2026 12:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E2114232E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777465465;
	bh=uE16yIfUFoat6Xj8vJfnsxgZNYyEyGYjNXQKJLNJlKk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GDUgr8oJYxcW4noE2Dxp0a3paVars1dfEbyxpaZKCnUQBQQGAY6dMlOp2R4XAUj/e
	 oix2vQa1nNFDjvzukHttOzqv70TYTtEx1L93yM3UbP9loo7LL9Q2fDvlHiZHBMItrF
	 Rnfpk9UhwvAj/8o7vrQMmUDp3fZHU+a7ByidhNhBQIznpNTYocKeg2UMAhacD3VS/Y
	 4yi6G37fWp62x8LoV6/xMwrg8EBtThRS7DgDPaOUJYltNXiqtR2h80l359qDhrJroG
	 F4l+UZi3SjHrq54zjE04XGMBGeMYnr0JSg4iLyMqa33zd50WJcknxFCsWdXzWjK37y
	 SayPR77F5Cw3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E2114232E;
	Wed, 29 Apr 2026 12:24:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D2DA1B8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03488422D2
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0z54-dJfqjNY for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 12:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65671422D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65671422D1
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:24:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2996283AB9; Wed, 29 Apr 2026 12:24:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 14:22:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baa0a1365335560bdfec6339cfb4b5785dafe3c9
X-Git-Newrev: 30e38505e4bc6f8313509bdee2418024693088fa
X-Patchwork-Hint: ignore
Message-Id: <20260429122421.2996283AB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: security bump to
 version 1.7.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2457577465297712545=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2457577465297712545==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30e38505e4bc6f8313509bdee2418024693088fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes (in 1.7.1): CVE-2025-6020 - pam_namespace: potential privilege escalation

https://github.com/linux-pam/linux-pam/security/advisories/GHSA-f9p8-gjr4-j9gx

The build system was changed from autotools to meson in 1.7.0.

Changelog:
https://github.com/linux-pam/linux-pam/releases/tag/v1.7.0
https://github.com/linux-pam/linux-pam/releases/tag/v1.7.1
https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Marcus: add note about the CVE fixed in this bump]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...build-consistently-include-config.h-first.patch | 180 ----------------
 ...ss-rework-resolving-of-tokens-as-hostname.patch | 229 ---------------------
 package/linux-pam/linux-pam.hash                   |   6 +-
 package/linux-pam/linux-pam.mk                     |  34 ++-
 4 files changed, 17 insertions(+), 432 deletions(-)

diff --git a/package/linux-pam/0001-build-consistently-include-config.h-first.patch b/package/linux-pam/0001-build-consistently-include-config.h-first.patch
deleted file mode 100644
index e9f36b8a60..0000000000
--- a/package/linux-pam/0001-build-consistently-include-config.h-first.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From cdba2c8cdba9b3500595624fb375c0dda266631b Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@strace.io>
-Date: Fri, 30 Aug 2024 08:00:00 +0000
-Subject: [PATCH] build: consistently include config.h first
-
-Make sure that config.h is included before any system header.
-
-Upstream: https://github.com/linux-pam/linux-pam/commit/5d7eefb1883c557c7a027f68e966e2fae294a9b6
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libpam/pam_prelude.c                | 8 ++++----
- modules/pam_namespace/argv_parse.c  | 2 ++
- modules/pam_setquota/pam_setquota.c | 3 ++-
- modules/pam_timestamp/sha1.c        | 2 +-
- modules/pam_unix/audit.c            | 3 +--
- modules/pam_unix/bigcrypt_main.c    | 2 ++
- modules/pam_unix/md5.c              | 4 ++--
- modules/pam_unix/md5_crypt.c        | 2 +-
- modules/pam_unix/yppasswd.h         | 2 ++
- 9 files changed, 17 insertions(+), 11 deletions(-)
-
-diff --git a/libpam/pam_prelude.c b/libpam/pam_prelude.c
-index 6c73bf5d..c62e2f2c 100644
---- a/libpam/pam_prelude.c
-+++ b/libpam/pam_prelude.c
-@@ -5,17 +5,17 @@
-  * (C) Sebastien Tricaud 2005 <toady@gscore.org>
-  */
- 
--#include <stdio.h>
--#include <syslog.h>
--
- #ifdef PRELUDE
- 
-+#include "pam_private.h"
-+
-+#include <stdio.h>
-+#include <syslog.h>
- #include <libprelude/prelude.h>
- #include <libprelude/prelude-log.h>
- #include <libprelude/idmef-message-print.h>
- 
- #include "pam_prelude.h"
--#include "pam_private.h"
- 
- 
- #define ANALYZER_CLASS "pam"
-diff --git a/modules/pam_namespace/argv_parse.c b/modules/pam_namespace/argv_parse.c
-index ac7c9ae0..cbae7831 100644
---- a/modules/pam_namespace/argv_parse.c
-+++ b/modules/pam_namespace/argv_parse.c
-@@ -28,6 +28,8 @@
-  * Version 1.1, modified 2/27/1999
-  */
- 
-+#include "config.h"
-+
- #include <limits.h>
- #include <stdlib.h>
- #include <ctype.h>
-diff --git a/modules/pam_setquota/pam_setquota.c b/modules/pam_setquota/pam_setquota.c
-index c15fc669..73445e29 100644
---- a/modules/pam_setquota/pam_setquota.c
-+++ b/modules/pam_setquota/pam_setquota.c
-@@ -8,6 +8,8 @@
-    Copyright © 2016 Keller Fuchs <kellerfuchs@hashbang.sh>
- */
- 
-+#include "pam_inline.h"
-+
- #include <sys/types.h>
- #include <sys/quota.h>
- #include <linux/quota.h>
-@@ -22,7 +24,6 @@
- #include <security/_pam_macros.h>
- #include <security/pam_ext.h>
- #include <security/pam_modutil.h>
--#include "pam_inline.h"
- 
- #ifndef PATH_LOGIN_DEFS
- # define PATH_LOGIN_DEFS "/etc/login.defs"
-diff --git a/modules/pam_timestamp/sha1.c b/modules/pam_timestamp/sha1.c
-index dff454cf..f21b2870 100644
---- a/modules/pam_timestamp/sha1.c
-+++ b/modules/pam_timestamp/sha1.c
-@@ -37,6 +37,7 @@
-  */
- /* See http://www.itl.nist.gov/fipspubs/fip180-1.htm for descriptions. */
- 
-+#include "pam_inline.h"
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <netinet/in.h>
-@@ -47,7 +48,6 @@
- #include <endian.h>
- #include <unistd.h>
- #include "sha1.h"
--#include "pam_inline.h"
- 
- static const unsigned char
- padding[SHA1_BLOCK_SIZE] = {
-diff --git a/modules/pam_unix/audit.c b/modules/pam_unix/audit.c
-index 1547a652..9513aaa9 100644
---- a/modules/pam_unix/audit.c
-+++ b/modules/pam_unix/audit.c
-@@ -1,5 +1,3 @@
--#include "audit.h"
--
- #include "config.h"
- 
- #ifdef HAVE_LIBAUDIT
-@@ -11,6 +9,7 @@
- 
- #include <security/_pam_types.h>
- 
-+#include "audit.h"
- #include "passverify.h"
- 
- int audit_log(int type, const char *uname, int retval)
-diff --git a/modules/pam_unix/bigcrypt_main.c b/modules/pam_unix/bigcrypt_main.c
-index fab212d9..22d325da 100644
---- a/modules/pam_unix/bigcrypt_main.c
-+++ b/modules/pam_unix/bigcrypt_main.c
-@@ -1,3 +1,5 @@
-+#include "config.h"
-+
- #include <stdio.h>
- #include <string.h>
- 
-diff --git a/modules/pam_unix/md5.c b/modules/pam_unix/md5.c
-index 95b8de4c..78e9af27 100644
---- a/modules/pam_unix/md5.c
-+++ b/modules/pam_unix/md5.c
-@@ -18,11 +18,11 @@
-  *
-  */
- 
-+#include "pam_inline.h"
-+
- #include <string.h>
- #include "md5.h"
- 
--#include "pam_inline.h"
--
- #ifndef HIGHFIRST
- #define byteReverse(buf, len)	/* Nothing */
- #else
-diff --git a/modules/pam_unix/md5_crypt.c b/modules/pam_unix/md5_crypt.c
-index 9a6bd4f9..9451f376 100644
---- a/modules/pam_unix/md5_crypt.c
-+++ b/modules/pam_unix/md5_crypt.c
-@@ -12,11 +12,11 @@
-  *
-  */
- 
-+#include "pam_inline.h"
- #include <string.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include "md5.h"
--#include "pam_inline.h"
- 
- static const unsigned char itoa64[] =	/* 0 ... 63 => ascii - 64 */
- "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
-diff --git a/modules/pam_unix/yppasswd.h b/modules/pam_unix/yppasswd.h
-index dc686cd7..3a40c3ea 100644
---- a/modules/pam_unix/yppasswd.h
-+++ b/modules/pam_unix/yppasswd.h
-@@ -6,6 +6,8 @@
- #ifndef _YPPASSWD_H_RPCGEN
- #define _YPPASSWD_H_RPCGEN
- 
-+#include "config.h"
-+
- #include <rpc/rpc.h>
- 
- 
--- 
-2.47.1
-
diff --git a/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch b/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
deleted file mode 100644
index 367cdf6202..0000000000
--- a/package/linux-pam/0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From d82b7ef5fc8afd7841735a4d0fcef6237193e183 Mon Sep 17 00:00:00 2001
-From: Thorsten Kukuk <kukuk@suse.com>
-Date: Thu, 14 Nov 2024 10:27:28 +0100
-Subject: [PATCH] pam_access: rework resolving of tokens as hostname
-
-* modules/pam_access/pam_access.c: separate resolving of IP addresses
-  from hostnames. Don't resolve TTYs or display variables as hostname
-  (#834).
-  Add "nodns" option to disallow resolving of tokens as hostname.
-* modules/pam_access/pam_access.8.xml: document nodns option
-* modules/pam_access/access.conf.5.xml: document that hostnames should
-  be written as FQHN.
-
-CVE: CVE-2024-10963
-Upstream: https://github.com/linux-pam/linux-pam/commit/940747f88c16e029b69a74e80a2e94f65cb3e628
-Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
----
- modules/pam_access/access.conf.5.xml |  4 ++
- modules/pam_access/pam_access.8.xml  | 46 ++++++++++++------
- modules/pam_access/pam_access.c      | 72 +++++++++++++++++++++++++++-
- 3 files changed, 105 insertions(+), 17 deletions(-)
-
-diff --git a/modules/pam_access/access.conf.5.xml b/modules/pam_access/access.conf.5.xml
-index 2dc5d477..b2997e10 100644
---- a/modules/pam_access/access.conf.5.xml
-+++ b/modules/pam_access/access.conf.5.xml
-@@ -232,6 +232,10 @@
-       An IPv6 link local host address must contain the interface
-       identifier. IPv6 link local network/netmask is not supported.
-     </para>
-+    <para>
-+      Hostnames should be written as Fully-Qualified Host Name (FQHN) to avoid
-+      confusion with device names or PAM service names.
-+    </para>
-   </refsect1>
- 
-   <refsect1 xml:id="access.conf-see_also">
-diff --git a/modules/pam_access/pam_access.8.xml b/modules/pam_access/pam_access.8.xml
-index c991d7a0..71a4f7ee 100644
---- a/modules/pam_access/pam_access.8.xml
-+++ b/modules/pam_access/pam_access.8.xml
-@@ -22,11 +22,14 @@
-       <arg choice="opt" rep="norepeat">
-         debug
-       </arg>
-+      <arg choice="opt" rep="norepeat">
-+        noaudit
-+      </arg>
-       <arg choice="opt" rep="norepeat">
-         nodefgroup
-       </arg>
-       <arg choice="opt" rep="norepeat">
--        noaudit
-+        nodns
-       </arg>
-       <arg choice="opt" rep="norepeat">
-         quiet_log
-@@ -132,6 +135,33 @@
-         </listitem>
-       </varlistentry>
- 
-+      <varlistentry>
-+        <term>
-+          nodefgroup
-+        </term>
-+        <listitem>
-+          <para>
-+            User tokens which are not enclosed in parentheses will not be
-+	    matched against the group database. The backwards compatible default is
-+            to try the group database match even for tokens not enclosed
-+            in parentheses.
-+          </para>
-+        </listitem>
-+      </varlistentry>
-+
-+      <varlistentry>
-+        <term>
-+          nodns
-+        </term>
-+        <listitem>
-+          <para>
-+	    Do not try to resolve tokens as hostnames, only IPv4 and IPv6
-+	    addresses will be resolved. Which means to allow login from a
-+	    remote host, the IP addresses need to be specified in <filename>access.conf</filename>.
-+          </para>
-+        </listitem>
-+      </varlistentry>
-+
-       <varlistentry>
-         <term>
-           quiet_log
-@@ -185,20 +215,6 @@
-         </listitem>
-       </varlistentry>
- 
--      <varlistentry>
--        <term>
--          nodefgroup
--        </term>
--        <listitem>
--          <para>
--            User tokens which are not enclosed in parentheses will not be
--	    matched against the group database. The backwards compatible default is
--            to try the group database match even for tokens not enclosed
--            in parentheses.
--          </para>
--        </listitem>
--      </varlistentry>
--
-     </variablelist>
-   </refsect1>
- 
-diff --git a/modules/pam_access/pam_access.c b/modules/pam_access/pam_access.c
-index 2ab1ca94..fdb5dd86 100644
---- a/modules/pam_access/pam_access.c
-+++ b/modules/pam_access/pam_access.c
-@@ -100,6 +100,7 @@ struct login_info {
-     int only_new_group_syntax;		/* Only allow group entries of the form "(xyz)" */
-     int noaudit;			/* Do not audit denials */
-     int quiet_log;			/* Do not log denials */
-+    int nodns;                          /* Do not try to resolve tokens as hostnames */
-     const char *fs;			/* field separator */
-     const char *sep;			/* list-element separator */
-     int from_remote_host;               /* If PAM_RHOST was used for from */
-@@ -154,6 +155,8 @@ parse_args(pam_handle_t *pamh, struct login_info *loginfo,
- 	    loginfo->noaudit = YES;
- 	} else if (strcmp (argv[i], "quiet_log") == 0) {
- 	    loginfo->quiet_log = YES;
-+	} else if (strcmp (argv[i], "nodns") == 0) {
-+	    loginfo->nodns = YES;
- 	} else {
- 	    pam_syslog(pamh, LOG_ERR, "unrecognized option [%s]", argv[i]);
- 	}
-@@ -741,7 +744,7 @@ remote_match (pam_handle_t *pamh, char *tok, struct login_info *item)
-       if ((str_len = strlen(string)) > tok_len
- 	  && strcasecmp(tok, string + str_len - tok_len) == 0)
- 	return YES;
--    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers (end with ".") */
-+    } else if (tok[tok_len - 1] == '.') {       /* internet network numbers/subnet (end with ".") */
-       struct addrinfo hint;
- 
-       memset (&hint, '\0', sizeof (hint));
-@@ -816,6 +819,39 @@ string_match (pam_handle_t *pamh, const char *tok, const char *string,
- }
- 
- 
-+static int
-+is_device (pam_handle_t *pamh, const char *tok)
-+{
-+  struct stat st;
-+  const char *dev = "/dev/";
-+  char *devname;
-+
-+  devname = malloc (strlen(dev) + strlen (tok) + 1);
-+  if (devname == NULL) {
-+      pam_syslog(pamh, LOG_ERR, "Cannot allocate memory for device name: %m");
-+      /*
-+       * We should return an error and abort, but pam_access has no good
-+       * error handling.
-+       */
-+      return NO;
-+  }
-+
-+  char *cp = stpcpy (devname, dev);
-+  strcpy (cp, tok);
-+
-+  if (lstat(devname, &st) != 0)
-+    {
-+      free (devname);
-+      return NO;
-+    }
-+  free (devname);
-+
-+  if (S_ISCHR(st.st_mode))
-+    return YES;
-+
-+  return NO;
-+}
-+
- /* network_netmask_match - match a string against one token
-  * where string is a hostname or ip (v4,v6) address and tok
-  * represents either a hostname, a single ip (v4,v6) address
-@@ -877,10 +913,42 @@ network_netmask_match (pam_handle_t *pamh,
- 	    return NO;
- 	  }
-       }
-+    else if (isipaddr(tok, NULL, NULL) == YES)
-+      {
-+	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
-+	  {
-+	    if (item->debug)
-+	      pam_syslog(pamh, LOG_DEBUG, "cannot resolve IP address \"%s\"", tok);
-+
-+	    return NO;
-+	  }
-+	netmask_ptr = NULL;
-+      }
-+    else if (item->nodns)
-+      {
-+	/* Only hostnames are left, which we would need to resolve via DNS */
-+	return NO;
-+      }
-     else
-       {
-+	/* Bail out on X11 Display entries and ttys. */
-+	if (tok[0] == ':')
-+	  {
-+	    if (item->debug)
-+	      pam_syslog (pamh, LOG_DEBUG,
-+			  "network_netmask_match: tok=%s is X11 display", tok);
-+	    return NO;
-+	  }
-+	if (is_device (pamh, tok))
-+	  {
-+	    if (item->debug)
-+	      pam_syslog (pamh, LOG_DEBUG,
-+			  "network_netmask_match: tok=%s is a TTY", tok);
-+	    return NO;
-+	  }
-+
-         /*
--	 * It is either an IP address or a hostname.
-+	 * It is most likely a hostname.
- 	 * Let getaddrinfo sort everything out
- 	 */
- 	if (getaddrinfo (tok, NULL, NULL, &ai) != 0)
--- 
-2.53.0
-
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index 353613e6e6..8688dc2af6 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,6 +1,6 @@
 # Locally computed hashes after checking signature at
-# https://github.com/linux-pam/linux-pam/releases/download/v1.6.1/Linux-PAM-1.6.1.tar.xz.asc
-# signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256  f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e  Linux-PAM-1.6.1.tar.xz
+# https://github.com/linux-pam/linux-pam/releases/download/v1.7.2/Linux-PAM-1.7.2.tar.xz.asc
+# signed with the key 7BECFE3AF7B280BB52FF77F104BA4521C996DDE1
+sha256  3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a  Linux-PAM-1.7.2.tar.xz
 # Locally computed
 sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index f4e488428d..799e74c911 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,18 +4,15 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.6.1
+LINUX_PAM_VERSION = 1.7.2
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
 LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES
 LINUX_PAM_CONF_OPTS = \
-	--disable-prelude \
-	--disable-isadir \
-	--disable-nis \
-	--disable-db \
-	--disable-regenerate-docu \
-	--enable-securedir=/lib/security \
-	--libdir=/lib
+	-Disadir=disabled \
+	-Dnis=disabled \
+	-Dpam_userdb=disabled \
+	-Ddocs=disabled
 LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
@@ -25,46 +22,43 @@ LINUX_PAM_LIBS = $(TARGET_NLS_LIBS)
 LINUX_PAM_MAKE_OPTS += LIBS="$(LINUX_PAM_LIBS)"
 LINUX_PAM_CPE_ID_VENDOR = linux-pam
 
-# 0002-pam_access-rework-resolving-of-tokens-as-hostname.patch
-LINUX_PAM_IGNORE_CVES += CVE-2024-10963
-
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LINUX_PAM_LIBS += -latomic
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-LINUX_PAM_CONF_OPTS += --enable-selinux
+LINUX_PAM_CONF_OPTS += -Dselinux=enabled
 LINUX_PAM_DEPENDENCIES += libselinux
 define LINUX_PAM_SELINUX_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
 		$(TARGET_DIR)/etc/pam.d/login
 endef
 else
-LINUX_PAM_CONF_OPTS += --disable-selinux
+LINUX_PAM_CONF_OPTS += -Dselinux=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
-LINUX_PAM_CONF_OPTS += --enable-audit
+LINUX_PAM_CONF_OPTS += -Daudit=enabled
 LINUX_PAM_DEPENDENCIES += audit
 else
-LINUX_PAM_CONF_OPTS += --disable-audit
+LINUX_PAM_CONF_OPTS += -Daudit=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LINUX_PAM_CONF_OPTS += --enable-openssl
+LINUX_PAM_CONF_OPTS += -Dopenssl=enabled
 LINUX_PAM_DEPENDENCIES += openssl
 else
-LINUX_PAM_CONF_OPTS += --disable-openssl
+LINUX_PAM_CONF_OPTS += -Dopenssl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
-LINUX_PAM_CONF_OPTS += --enable-lastlog
+LINUX_PAM_CONF_OPTS += -Dpam_lastlog=enabled
 define LINUX_PAM_LASTLOG_PAMFILE_TWEAK
 	$(SED) 's/^# \(.*pam_lastlog.so.*\)$$/\1/' \
 		$(TARGET_DIR)/etc/pam.d/login
 endef
 else
-LINUX_PAM_CONF_OPTS += --disable-lastlog
+LINUX_PAM_CONF_OPTS += -Dpam_lastlog=disabled
 endif
 
 # Install default pam config (deny everything except login)
@@ -79,4 +73,4 @@ endef
 
 LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
 
-$(eval $(autotools-package))
+$(eval $(meson-package))

--===============2457577465297712545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2457577465297712545==--

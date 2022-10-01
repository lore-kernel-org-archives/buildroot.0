Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D66DC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 19:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE794161A;
	Sat,  1 Oct 2022 19:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE794161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJngNa7EB2hu; Sat,  1 Oct 2022 19:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4280B4161F;
	Sat,  1 Oct 2022 19:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4280B4161F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DEC91BF3BA
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 586264161C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 19:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 586264161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCLxzDa21mvN for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 19:15:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F8644161A
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 19:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F8644161A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8339286703; Sat,  1 Oct 2022 19:15:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 21:15:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db3a039e27f65f6cb5a24019741c21e6f741b6dd
X-Git-Newrev: 22d6788619b17ebbe90eeccf7d754a45ab10c05a
X-Patchwork-Hint: ignore
Message-Id: <20221001191532.8339286703@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: security bump to version
 2.87
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

commit: https://git.buildroot.net/buildroot/commit/?id=22d6788619b17ebbe90eeccf7d754a45ab10c05a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2022-0934:
  https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2022q1/016274.html
- Drop patches (already in version)
- Update hash of COPYING, slight updates:
  https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commitdiff;h=858bfcf261e12a0baf4de6dbbf3b8858bab7cc53

https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2022q3/016560.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-src-option.c-fix-build-with-gcc-4.8.patch | 52 --------------------
 ...2909d9080ff8743133fbd52427b4b2213171-typo.patch | 36 --------------
 ...S-but-not-DNSSEC-compile-options-selected.patch | 34 -------------
 ...0004-src-pattern.c-fix-build-with-gcc-4.8.patch | 57 ----------------------
 package/dnsmasq/dnsmasq.hash                       |  6 +--
 package/dnsmasq/dnsmasq.mk                         |  2 +-
 6 files changed, 4 insertions(+), 183 deletions(-)

diff --git a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 50ecf2f18a..0000000000
--- a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 46312909d9080ff8743133fbd52427b4b2213171 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 31 Dec 2021 17:29:44 +0100
-Subject: [PATCH] src/option.c: fix build with gcc 4.8
-
-Fix the following build failure with gcc 4.8 raised since version 2.86:
-
-option.c: In function 'one_opt':
-option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
-           for (char *p = arg; *p; p++) {
-           ^
-option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
-option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
-           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
-           ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream commit 46312909d9080ff8743133fbd52427b4b2213171]
----
- src/option.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/option.c b/src/option.c
-index ff54def..c57f6d8 100644
---- a/src/option.c
-+++ b/src/option.c
-@@ -2525,7 +2525,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
-           arg += 9;
-           if (strlen(arg) != 16)
-               ret_err(gen_err);
--          for (char *p = arg; *p; p++) {
-+          char *p;
-+          for (*p = arg; *p; p++) {
-             if (!isxdigit((int)*p))
-               ret_err(gen_err);
-           }
-@@ -2533,7 +2534,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
- 
-           u8 *u = daemon->umbrella_device;
-           char word[3];
--          for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
-+          u8 i;
-+          for (i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
-             memcpy(word, &(arg[0]), 2);
-             *u++ = strtoul(word, NULL, 16);
-           }
--- 
-2.33.0
-
diff --git a/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
deleted file mode 100644
index 8cdf5b3f1b..0000000000
--- a/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2748fb81e23b71e2c44956e99321816aca91905d Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Sat, 1 Jan 2022 23:03:26 +0000
-Subject: [PATCH] Fix 46312909d9080ff8743133fbd52427b4b2213171 typo.
-
-[Upstream commit 2748fb81e23b71e2c44956e99321816aca91905d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com> 
----
- src/option.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/option.c b/src/option.c
-index c57f6d8..6f56ce8 100644
---- a/src/option.c
-+++ b/src/option.c
-@@ -357,7 +357,7 @@ static const struct myoption opts[] =
-     { "dhcp-ignore-clid", 0, 0,  LOPT_IGNORE_CLID },
-     { "dynamic-host", 1, 0, LOPT_DYNHOST },
-     { "log-debug", 0, 0, LOPT_LOG_DEBUG },
--	{ "umbrella", 2, 0, LOPT_UMBRELLA },
-+    { "umbrella", 2, 0, LOPT_UMBRELLA },
-     { "quiet-tftp", 0, 0, LOPT_QUIET_TFTP },
-     { NULL, 0, 0, 0 }
-   };
-@@ -2526,7 +2526,7 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
-           if (strlen(arg) != 16)
-               ret_err(gen_err);
-           char *p;
--          for (*p = arg; *p; p++) {
-+          for (p = arg; *p; p++) {
-             if (!isxdigit((int)*p))
-               ret_err(gen_err);
-           }
--- 
-2.33.0
-
diff --git a/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
deleted file mode 100644
index 9c98af2be5..0000000000
--- a/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2c60441239e1c10c4987cb586653b1ea08f703c0 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Tue, 28 Sep 2021 23:42:15 +0100
-Subject: [PATCH] Fix FTBFS when CONNTRACK and UBUS but not DNSSEC compile
- options selected.
-
-[Retrieved from:
-https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=2c60441239e1c10c4987cb586653b1ea08f703c0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/dnsmasq.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/dnsmasq.h b/src/dnsmasq.h
-index c8a918a..3fdc1b0 100644
---- a/src/dnsmasq.h
-+++ b/src/dnsmasq.h
-@@ -1173,9 +1173,12 @@ extern struct daemon {
-   char *packet; /* packet buffer */
-   int packet_buff_sz; /* size of above */
-   char *namebuff; /* MAXDNAME size buffer */
-+#if (defined(HAVE_CONNTRACK) && defined(HAVE_UBUS)) || defined(HAVE_DNSSEC)
-+  /* CONNTRACK UBUS code uses this buffer, as well as DNSSEC code. */
-+  char *workspacename;
-+#endif
- #ifdef HAVE_DNSSEC
-   char *keyname; /* MAXDNAME size buffer */
--  char *workspacename; /* ditto */
-   unsigned long *rr_status; /* ceiling in TTL from DNSSEC or zero for insecure */
-   int rr_status_sz;
-   int dnssec_no_time_check;
--- 
-2.20.1
-
diff --git a/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 90bb02b23a..0000000000
--- a/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 0c89dd2fa0fe50b00bca638dbbacfbd361526e0a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 2 Jan 2022 21:57:52 +0100
-Subject: [PATCH] src/pattern.c: fix build with gcc 4.8
-
-Fix the following build failure:
-
-pattern.c: In function 'is_valid_dns_name':
-pattern.c:134:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (const char *c = value;; c++)
-   ^
-pattern.c:134:3: note: use option -std=c99 or -std=gnu99 to compile your code
-pattern.c: In function 'is_valid_dns_name_pattern':
-pattern.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (const char *c = value;; c++)
-   ^
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=b2690415bfa1bc105e61b75f642fb5c1aaf0fae8]
----
- src/pattern.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/pattern.c b/src/pattern.c
-index 03e23b9..928d259 100644
---- a/src/pattern.c
-+++ b/src/pattern.c
-@@ -129,9 +129,9 @@ int is_valid_dns_name(const char *value)
-   
-   size_t num_bytes = 0;
-   size_t num_labels = 0;
--  const char *label = NULL;
-+  const char *c, *label = NULL;
-   int is_label_numeric = 1;
--  for (const char *c = value;; c++)
-+  for (c = value;; c++)
-     {
-       if (*c &&
- 	  *c != '-' && *c != '.' &&
-@@ -242,11 +242,11 @@ int is_valid_dns_name_pattern(const char *value)
-   
-   size_t num_bytes = 0;
-   size_t num_labels = 0;
--  const char *label = NULL;
-+  const char *c, *label = NULL;
-   int is_label_numeric = 1;
-   size_t num_wildcards = 0;
-   int previous_label_has_wildcard = 1;
--  for (const char *c = value;; c++)
-+  for (c = value;; c++)
-     {
-       if (*c &&
- 	  *c != '*' && /* Wildcard. */
--- 
-2.20.1
-
diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 804012821e..78127ca714 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.86.tar.xz.asc
-sha256  28d52cfc9e2004ac4f85274f52b32e1647b4dbc9761b82e7de1e41c49907eb08  dnsmasq-2.86.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.87.tar.xz.asc
+sha256  0228c0364a7f2356fd7e7f1549937cbf3099a78d3b2eb1ba5bb0c31e2b89de7a  dnsmasq-2.87.tar.xz
 # Locally calculated
-sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 230e4a8116..46a40c4bbb 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.86
+DNSMASQ_VERSION = 2.87
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDB9C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 19:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 791716066C;
	Sat, 17 May 2025 19:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSqqiJOCBXyf; Sat, 17 May 2025 19:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C56A607C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C56A607C4;
	Sat, 17 May 2025 19:08:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACC2F204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E9AB40A25
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koPzB193Z-wO for <buildroot@buildroot.org>;
 Sat, 17 May 2025 19:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7F394023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F394023C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7F394023C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:08:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEB5B43A54;
 Sat, 17 May 2025 19:08:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uGMtf-00EaRL-1n;
 Sat, 17 May 2025 21:08:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 21:08:34 +0200
Message-Id: <20250517190834.3476656-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeigeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptdetgeekkeejudeggeelleeuueehteduvddvjeekgfehgfdtieelheffvdeitddtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepkhgrshiirghksehgmhgrihhlrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/openvmtools: add upstream security
 patch for CVE-2025-22247
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
Cc: Karoly Kasza <kaszak@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

CVE-2025-22247: open-vm-tools contains an insecure file handling
vulnerability.

https://github.com/vmware/open-vm-tools/tree/CVE-2025-22247.patch

The upstream patch needs to be applied with -p2, so drop the open-vm-tools
prefix (sed -i 's|open-vm-tools/||g') and include it here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-2025-22247-1100-1225-VGAuth-updates.patch | 382 ++++++++++++++++++
 package/openvmtools/openvmtools.mk            |   3 +
 2 files changed, 385 insertions(+)
 create mode 100644 package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch

diff --git a/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
new file mode 100644
index 0000000000..f47fabb71b
--- /dev/null
+++ b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
@@ -0,0 +1,382 @@
+From 2a2607c6bd94ae22a937fd2adde7472d9a6d506c Mon Sep 17 00:00:00 2001
+From: John Wolfe <john.wolfe@broadcom.com>
+Date: Mon, 5 May 2025 16:10:07 -0700
+Subject: [PATCH] Validate user names and file paths
+
+Prevent usage of illegal characters in user names and file paths.
+Also, disallow unexpected symlinks in file paths.
+
+This patch contains changes to common source files not applicable
+to open-vm-tools.
+
+All files being updated should be consider to have the copyright to
+be updated to:
+
+ * Copyright (c) XXXX-2025 Broadcom. All Rights Reserved.
+ * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+
+The 2025 Broadcom copyright information update is not part of this
+patch set to allow the patch to be easily applied to previous
+open-vm-tools source releases.
+
+Upstream: https://github.com/vmware/blob/CVE-2025-22247.patch/CVE-2025-22247-1100-1225-VGAuth-updates.patch
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ vgauth/common/VGAuthUtil.c      | 33 +++++++++
+ vgauth/common/VGAuthUtil.h      |  2 +
+ vgauth/common/prefs.h           |  3 +
+ vgauth/common/usercheck.c       | 28 +++++--
+ vgauth/serviceImpl/alias.c      | 74 ++++++++++++++++++-
+ vgauth/serviceImpl/service.c    | 27 +++++++
+ vgauth/serviceImpl/serviceInt.h |  1 +
+ 7 files changed, 160 insertions(+), 8 deletions(-)
+
+diff --git a/vgauth/common/VGAuthUtil.c b/vgauth/common/VGAuthUtil.c
+index 76383c462..9c2adb8d0 100644
+--- a/vgauth/common/VGAuthUtil.c
++++ b/vgauth/common/VGAuthUtil.c
+@@ -309,3 +309,36 @@ Util_Assert(const char *cond,
+ #endif
+    g_assert(0);
+ }
++
++
++/*
++ ******************************************************************************
++ * Util_Utf8CaseCmp --                                                   */ /**
++ *
++ * Case insensitive comparison for utf8 strings which can have non-ascii
++ * characters.
++ *
++ * @param[in]  str1      Null terminated utf8 string.
++ * @param[in]  str2      Null terminated utf8 string.
++ *
++ ******************************************************************************
++ */
++
++int
++Util_Utf8CaseCmp(const gchar *str1,
++                 const gchar *str2)
++{
++   int ret;
++   gchar *str1Case;
++   gchar *str2Case;
++
++   str1Case = g_utf8_casefold(str1, -1);
++   str2Case = g_utf8_casefold(str2, -1);
++
++   ret = g_strcmp0(str1Case, str2Case);
++
++   g_free(str1Case);
++   g_free(str2Case);
++
++   return ret;
++}
+diff --git a/vgauth/common/VGAuthUtil.h b/vgauth/common/VGAuthUtil.h
+index f7f3aa216..ef32a91da 100644
+--- a/vgauth/common/VGAuthUtil.h
++++ b/vgauth/common/VGAuthUtil.h
+@@ -105,4 +105,6 @@ gboolean Util_CheckExpiration(const GTimeVal *start, unsigned int duration);
+ 
+ void Util_Assert(const char *cond, const char *file, int lineNum);
+ 
++int Util_Utf8CaseCmp(const gchar *str1, const gchar *str2);
++
+ #endif
+diff --git a/vgauth/common/prefs.h b/vgauth/common/prefs.h
+index ff116928c..7cddb3e17 100644
+--- a/vgauth/common/prefs.h
++++ b/vgauth/common/prefs.h
+@@ -165,6 +165,9 @@ msgCatalog = /etc/vmware-tools/vgauth/messages
+ /** Where the localized version of the messages were installed. */
+ #define VGAUTH_PREF_LOCALIZATION_DIR        "msgCatalog"
+ 
++/** If symlinks or junctions are allowed in alias store file path */
++#define VGAUTH_PREF_ALLOW_SYMLINKS  "allowSymlinks"
++
+ /*
+  * Pref values
+  */
+diff --git a/vgauth/common/usercheck.c b/vgauth/common/usercheck.c
+index 31eeb5a77..145f1f056 100644
+--- a/vgauth/common/usercheck.c
++++ b/vgauth/common/usercheck.c
+@@ -78,6 +78,8 @@
+  * Solaris as well, but that path is untested.
+  */
+ 
++#define MAX_USER_NAME_LEN 256
++
+ /*
+  * A single retry works for the LDAP case, but try more often in case NIS
+  * or something else has a related issue.  Note that a bad username/uid won't
+@@ -354,17 +356,29 @@ Usercheck_UsernameIsLegal(const gchar *userName)
+     *
+     */
+    size_t len;
+-#ifdef _WIN32
+-   // allow '\' in for Windows domain usernames
+-   char *illegalChars = "<>/";
+-#else
+-   char *illegalChars = "\\<>/";
+-#endif
++   size_t i = 0;
++   int backSlashCnt = 0;
++   /*
++    * As user names are used to generate its alias store file name/path, it
++    * should not contain path traversal characters ('/' and '\').
++    */
++   char *illegalChars = "<>/\\";
+ 
+    len = strlen(userName);
+-   if (strcspn(userName, illegalChars) != len) {
++   if (len > MAX_USER_NAME_LEN) {
+       return FALSE;
+    }
++
++   while ((i += strcspn(userName + i, illegalChars)) < len) {
++      /*
++       * One backward slash is allowed for domain\username separator.
++       */
++      if (userName[i] != '\\' || ++backSlashCnt > 1) {
++         return FALSE;
++      }
++      ++i;
++   }
++
+    return TRUE;
+ }
+ 
+diff --git a/vgauth/serviceImpl/alias.c b/vgauth/serviceImpl/alias.c
+index b28351eea..687d1b373 100644
+--- a/vgauth/serviceImpl/alias.c
++++ b/vgauth/serviceImpl/alias.c
+@@ -41,6 +41,7 @@
+ #include "certverify.h"
+ #include "VGAuthProto.h"
+ #include "vmxlog.h"
++#include "VGAuthUtil.h"
+ 
+ // puts the identity store in an easy to find place
+ #undef WIN_TEST_MODE
+@@ -66,6 +67,7 @@
+ #define ALIASSTORE_FILE_PREFIX   "user-"
+ #define ALIASSTORE_FILE_SUFFIX   ".xml"
+ 
++static gboolean allowSymlinks = FALSE;
+ static gchar *aliasStoreRootDir = DEFAULT_ALIASSTORE_ROOT_DIR;
+ 
+ #ifdef _WIN32
+@@ -252,6 +254,12 @@ mapping file layout:
+ 
+  */
+ 
++#ifdef _WIN32
++#define ISPATHSEP(c)  ((c) == '\\' || (c) == '/')
++#else
++#define ISPATHSEP(c)  ((c) == '/')
++#endif
++
+ 
+ /*
+  ******************************************************************************
+@@ -466,6 +474,7 @@ ServiceLoadFileContentsWin(const gchar *fileName,
+    gunichar2 *fileNameW = NULL;
+    BOOL ok;
+    DWORD bytesRead;
++   gchar *realPath = NULL;
+ 
+    *fileSize = 0;
+    *contents = NULL;
+@@ -622,6 +631,22 @@ ServiceLoadFileContentsWin(const gchar *fileName,
+       goto done;
+    }
+ 
++   if (!allowSymlinks) {
++      /*
++       * Check if fileName is real path.
++       */
++      if ((realPath = ServiceFileGetPathByHandle(hFile)) == NULL) {
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++      if (Util_Utf8CaseCmp(realPath, fileName) != 0) {
++         Warning("%s: Real path (%s) is not same as file path (%s)\n",
++                 __FUNCTION__, realPath, fileName);
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++   }
++
+    /*
+     * Now finally read the contents.
+     */
+@@ -650,6 +675,7 @@ done:
+       CloseHandle(hFile);
+    }
+    g_free(fileNameW);
++   g_free(realPath);
+ 
+    return err;
+ }
+@@ -672,6 +698,7 @@ ServiceLoadFileContentsPosix(const gchar *fileName,
+    gchar *buf;
+    gchar *bp;
+    int fd = -1;
++   gchar realPath[PATH_MAX] = { 0 };
+ 
+    *fileSize = 0;
+    *contents = NULL;
+@@ -817,6 +844,23 @@ ServiceLoadFileContentsPosix(const gchar *fileName,
+       goto done;
+    }
+ 
++   if (!allowSymlinks) {
++      /*
++       * Check if fileName is real path.
++       */
++      if (realpath(fileName, realPath) == NULL) {
++         Warning("%s: realpath() failed. errno (%d)\n", __FUNCTION__, errno);
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++      if (g_strcmp0(realPath, fileName) != 0) {
++         Warning("%s: Real path (%s) is not same as file path (%s)\n",
++                 __FUNCTION__, realPath, fileName);
++         err = VGAUTH_E_FAIL;
++         goto done;
++      }
++   }
++
+    /*
+     * All sanity checks passed; read the bits.
+     */
+@@ -2803,8 +2847,13 @@ ServiceAliasRemoveAlias(const gchar *reqUserName,
+ 
+    /*
+     * We don't verify the user exists in a Remove operation, to allow
+-    * cleanup of deleted user's stores.
++    * cleanup of deleted user's stores, but we do check whether the
++    * user name is legal or not.
+     */
++   if (!Usercheck_UsernameIsLegal(userName)) {
++      Warning("%s: Illegal user name '%s'\n", __FUNCTION__, userName);
++      return VGAUTH_E_FAIL;
++   }
+ 
+    if (!CertVerify_IsWellFormedPEMCert(pemCert)) {
+       return VGAUTH_E_INVALID_CERTIFICATE;
+@@ -3036,6 +3085,16 @@ ServiceAliasQueryAliases(const gchar *userName,
+    }
+ #endif
+ 
++   /*
++    * We don't verify the user exists in a Query operation to allow
++    * cleaning up after a deleted user, but we do check whether the
++    * user name is legal or not.
++    */
++   if (!Usercheck_UsernameIsLegal(userName)) {
++      Warning("%s: Illegal user name '%s'\n", __FUNCTION__, userName);
++      return VGAUTH_E_FAIL;
++   }
++
+    err = AliasLoadAliases(userName, num, aList);
+    if (VGAUTH_E_OK != err) {
+       Warning("%s: failed to load Aliases for '%s'\n", __FUNCTION__, userName);
+@@ -3294,6 +3353,7 @@ ServiceAliasInitAliasStore(void)
+    VGAuthError err = VGAUTH_E_OK;
+    gboolean saveBadDir = FALSE;
+    char *defaultDir = NULL;
++   size_t len;
+ 
+ #ifdef _WIN32
+    {
+@@ -3324,6 +3384,10 @@ ServiceAliasInitAliasStore(void)
+    defaultDir = g_strdup(DEFAULT_ALIASSTORE_ROOT_DIR);
+ #endif
+ 
++   allowSymlinks = Pref_GetBool(gPrefs,
++                                VGAUTH_PREF_ALLOW_SYMLINKS,
++                                VGAUTH_PREF_GROUP_NAME_SERVICE,
++                                FALSE);
+    /*
+     * Find the alias store directory.  This allows an installer to put
+     * it somewhere else if necessary.
+@@ -3337,6 +3401,14 @@ ServiceAliasInitAliasStore(void)
+                                       VGAUTH_PREF_GROUP_NAME_SERVICE,
+                                       defaultDir);
+ 
++   /*
++    * Remove the trailing separator if any from aliasStoreRootDir path.
++    */
++   len = strlen(aliasStoreRootDir);
++   if (ISPATHSEP(aliasStoreRootDir[len - 1])) {
++      aliasStoreRootDir[len - 1] = '\0';
++   }
++
+    Log("Using '%s' for alias store root directory\n", aliasStoreRootDir);
+ 
+    g_free(defaultDir);
+diff --git a/vgauth/serviceImpl/service.c b/vgauth/serviceImpl/service.c
+index d4716526c..e053ed0fa 100644
+--- a/vgauth/serviceImpl/service.c
++++ b/vgauth/serviceImpl/service.c
+@@ -28,6 +28,7 @@
+ #include "VGAuthUtil.h"
+ #ifdef _WIN32
+ #include "winUtil.h"
++#include <glib.h>
+ #endif
+ 
+ static ServiceStartListeningForIOFunc startListeningIOFunc = NULL;
+@@ -283,9 +284,35 @@ static gchar *
+ ServiceUserNameToPipeName(const char *userName)
+ {
+    gchar *escapedName = ServiceEncodeUserName(userName);
++#ifdef _WIN32
++   /*
++    * Adding below pragma only in windows to suppress the compile time warning
++    * about unavailability of g_uuid_string_random() since compiler flag
++    * GLIB_VERSION_MAX_ALLOWED is defined to GLIB_VERSION_2_34.
++    * TODO: Remove below pragma when GLIB_VERSION_MAX_ALLOWED is bumped up to
++    * or greater than GLIB_VERSION_2_52.
++    */
++#pragma warning(suppress : 4996)
++   gchar *uuidStr = g_uuid_string_random();
++   /*
++    * Add a unique suffix to avoid a name collision with an existing named pipe
++    * created by someone else (intentionally or by accident).
++    * This is not needed for Linux; name collisions on sockets are already
++    * avoided there since (1) file system paths to VGAuthService sockets are in
++    * a directory that is writable only by root and (2) VGAuthService unlinks a
++    * socket path before binding it to a newly created socket.
++    */
++   gchar *pipeName = g_strdup_printf("%s-%s-%s",
++                                     SERVICE_PUBLIC_PIPE_NAME,
++                                     escapedName,
++                                     uuidStr);
++
++   g_free(uuidStr);
++#else
+    gchar *pipeName = g_strdup_printf("%s-%s",
+                                      SERVICE_PUBLIC_PIPE_NAME,
+                                      escapedName);
++#endif
+ 
+    g_free(escapedName);
+    return pipeName;
+diff --git a/vgauth/serviceImpl/serviceInt.h b/vgauth/serviceImpl/serviceInt.h
+index ef49f42c2..c37f42fa6 100644
+--- a/vgauth/serviceImpl/serviceInt.h
++++ b/vgauth/serviceImpl/serviceInt.h
+@@ -441,6 +441,7 @@ VGAuthError ServiceFileVerifyAdminGroupOwnedByHandle(const HANDLE hFile);
+ VGAuthError ServiceFileVerifyEveryoneReadableByHandle(const HANDLE hFile);
+ VGAuthError ServiceFileVerifyUserAccessByHandle(const HANDLE hFile,
+                                                 const char *userName);
++gchar *ServiceFileGetPathByHandle(HANDLE hFile);
+ #else
+ VGAuthError ServiceFileVerifyFileOwnerAndPerms(const char *fileName,
+                                                const char *userName,
+-- 
+2.43.5
+
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 3106b9ecd6..bc547a8af7 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -16,6 +16,9 @@ OPENVMTOOLS_CPE_ID_PRODUCT = tools
 # 0013-Properly-check-authorization-on-incoming-guestOps-re.patch
 OPENVMTOOLS_IGNORE_CVES += CVE-2022-31676
 
+# 0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
+OPENVMTOOLS_IGNORE_CVES += CVE-2025-22247
+
 # configure.ac is patched
 OPENVMTOOLS_AUTORECONF = YES
 OPENVMTOOLS_CONF_OPTS = --with-dnet \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

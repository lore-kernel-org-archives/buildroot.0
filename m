Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F51BC4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 21:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 453C383A6D;
	Fri, 26 Apr 2024 21:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrGtjgGPiHiL; Fri, 26 Apr 2024 21:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22ED583A7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22ED583A7A;
	Fri, 26 Apr 2024 21:57:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76F4F1BF20D
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 21:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F281614B9
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 21:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSSIKQ_ACvDX for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 21:57:10 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 26 Apr 2024 21:57:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE1556149A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE1556149A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE1556149A
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 21:57:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.221]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryXH-1sUZeh1M1d-00n4zL; Fri, 26
 Apr 2024 23:52:02 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 23:51:44 +0200
Message-ID: <20240426215144.1107186-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5KCb4DPN3Sm7sXKAk5a4x9uPibMRx0Q8eiG3Bn/0m6nFxhvnvlx
 jVwHS3tJjnriuGuXw4OUiY18n7v75XH3PWS5HOuzl9JGsIKZOpJc0i4Vf3Ec+l9f5RL3Io5
 wlysN80/CpDJd2fcrXqIPKlR61yP/tc6CHwp2AB2Ef23tg74oGRX0RQ5H2vu3f4EwGPIkKE
 jz066CpJEpVjWcNkwUN3A==
UI-OutboundReport: notjunk:1;M01:P0:qkQEhjwhYro=;NqcXNu+z6HEWqggAivgxEEWRQ4z
 cE4J2exCedGSMPSI/hpa4MS17XbxLjXAa5AF/ZuXYAyE07qhZ6xKjlzMOm0H0CvylNrUQrxwY
 nr32odu+v8PfUC9JX+mVkDaeGmiQ9yhHtM5DcPzLt684PoNkrb/x7MNLWMDcJXGg3g7D+kVJU
 ylBD0pUEAkqSXkXh+sw2N7iFEPn4cf9lC1hFDamOlhIcm0wlLIDu6SstKbcqIwk0hLJyOvJJ5
 ps/T1I8O0qf7Sj4qEyyj/4uh5mJWEVCWvPJ+URfGNVnAaaRYnekatJDZgH1tjDHdKPoho5A77
 fswmvs2Unije93R3zJQUxjVnj9MaE+VJ5GswU+7VkaMw9mxkW9LpTpG7foEb/t3tfcdXpE1LA
 zP60nwujlUpOhtpLiuX5ieBtYNG5IPyR5wxy5BgDSdKuugHVCN+dY1yyXtjLAq9ZQ+FOTAC5m
 W4yXJswI1qsyzXsWww5Py9HkMJCqbO7QtUMYUcceeF/RTOQbJ8gRaM/a707WHOxnbuo3Nlstg
 7AyhbFDzDRNEgmeXNfjw4F5JhqyVm3bbsnueitkbZ0iA3Iw+ibpyFPFhpm3Q/vOCIEo5mKSD3
 e1NpI9SYnDsKfcABd/AcBvK6BPdV+Wt0HN0gTWhytuZH3H2MBRy1KccJZDdpOSf5FlZp+bv3C
 Wi6mf8ddT2R0FLPWJXub/Hbr+gafUecr13T4ptmD3WzSWlWNmJuC41o7Ywt4KxExoJBRU8kN9
 lpnvan+xkUnkeXEYXsvuVTTZf7TbAC7J3aSOkTtK/eVaay9JaH2fd68+YJ5rAFKw15kTbCS/x
 xlDs3KGPaYWZd1YMBDiMxBQ3tSDXQfFzGQgF5YbOYnnug=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1714168627; x=1714773427; i=fiona.klute@gmx.de;
 bh=KV19nCHsjj+fsLZAVA50G2bAT226tNliBtHkmBxKnxY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fMrxEgy74tHRYYi6L2HqZ+t4L7Ya3dUiCHsB3tzuy7oO2wFeWfnha3eRyDFhx+Ht
 6pQ8gQeB8ssk05G7zwkvIIw2DfdWyhYKHSCGkRGFDKOX8UV5gtP18Wc7wNohaFEc9
 9O0uUOjwRqqLlbFThmaXsHWLt/TYJMIiSpUVncykbplT6B419j//BzpBb3KGZcG0u
 FYJRPWf0VIkMCFXsZieOz5SUc9CuQAiNyD31Bf0jVaB9ne6zoW0OFUnx0DASGVYQK
 6hfG5ADy8Qne6GtDaGILFgvB8nUjzzShlhTmN9lZjGo4tsXQxXXjCSbM16U7xTMct
 j788YmsVtkKnxj3oWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=fMrxEgy7
Subject: [Buildroot] [PATCH 1/1] package/kmod: fix build with musl
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: fiona.klute@gmx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fiona Klute <fiona.klute+wiwa@gmx.de>

Patch from upstream PR still being discussed:
https://github.com/kmod-project/kmod/pull/32

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 ...able-implementation-for-basename-API.patch | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 package/kmod/0002-Use-portable-implementation-for-basename-API.patch

diff --git a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
new file mode 100644
index 0000000000..46d23f4fa9
--- /dev/null
+++ b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
@@ -0,0 +1,131 @@
+From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Dec 2023 17:35:59 -0800
+Subject: [PATCH] Use portable implementation for basename API
+
+musl has removed the non-prototype declaration of basename from
+string.h [1] which now results in build errors with clang-17+ compiler
+
+Implement GNU basename behavior using strchr which is portable across libcs
+
+Fixes
+../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+71 | "Commands:\n", basename(argv[0]));
+| ^
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Suggested-by: Rich Felker
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libkmod/libkmod-config.c | 2 +-
+ shared/util.c            | 4 ++--
+ shared/util.h            | 7 +++++++
+ testsuite/testsuite.c    | 2 +-
+ tools/depmod.c           | 2 +-
+ tools/kmod.c             | 4 ++--
+ 6 files changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
+index e83621b3..8aa555a4 100644
+--- a/libkmod/libkmod-config.c
++++ b/libkmod/libkmod-config.c
+@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
+ 	bool is_single = false;
+
+ 	if (name == NULL) {
+-		name = basename(path);
++		name = gnu_basename(path);
+ 		is_single = true;
+ 	}
+
+diff --git a/shared/util.c b/shared/util.c
+index e2bab83a..0e16670e 100644
+--- a/shared/util.c
++++ b/shared/util.c
+@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
+
+ char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
+ {
+-	char *modname;
++	const char *modname;
+
+-	modname = basename(path);
++	modname = gnu_basename(path);
+ 	if (modname == NULL || modname[0] == '\0')
+ 		return NULL;
+
+diff --git a/shared/util.h b/shared/util.h
+index c4a3916b..073dc5a7 100644
+--- a/shared/util.h
++++ b/shared/util.h
+@@ -5,6 +5,7 @@
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <time.h>
+@@ -76,6 +77,12 @@ do {						\
+ 	__p->__v = (val);			\
+ } while(0)
+
++static _always_inline_ const char *gnu_basename(const char *s)
++{
++  const char *p = strrchr(s, '/');
++  return p ? p+1 : s;
++}
++
+ static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
+ {
+ 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
+diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
+index 318343ac..aafc9873 100644
+--- a/testsuite/testsuite.c
++++ b/testsuite/testsuite.c
+@@ -70,7 +70,7 @@ static void help(void)
+
+ 	printf("Usage:\n"
+ 	       "\t%s [options] <test>\n"
+-	       "Options:\n", basename(progname));
++	       "Options:\n", gnu_basename(progname));
+
+ 	for (itr = options, itr_short = options_short;
+ 				itr->name != NULL; itr++, itr_short++)
+diff --git a/tools/depmod.c b/tools/depmod.c
+index 43fc354a..cfb15b11 100644
+--- a/tools/depmod.c
++++ b/tools/depmod.c
+@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
+ 	if (name != NULL)
+ 		namelen = strlen(name);
+ 	else {
+-		name = basename(dir);
++		name = gnu_basename(dir);
+ 		namelen = strlen(name);
+ 		dirlen -= namelen + 1;
+ 	}
+diff --git a/tools/kmod.c b/tools/kmod.c
+index 55689c07..df91e5c6 100644
+--- a/tools/kmod.c
++++ b/tools/kmod.c
+@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
+ 			"Options:\n"
+ 			"\t-V, --version     show version\n"
+ 			"\t-h, --help        show this help\n\n"
+-			"Commands:\n", basename(argv[0]));
++			"Commands:\n", gnu_basename(argv[0]));
+
+ 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
+ 		if (kmod_cmds[i]->help != NULL) {
+@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
+ 	const char *cmd;
+ 	size_t i;
+
+-	cmd = basename(argv[0]);
++	cmd = gnu_basename(argv[0]);
+
+ 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
+ 		if (streq(kmod_compat_cmds[i]->name, cmd))
--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

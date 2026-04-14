Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897F5F9D0EE
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2BE84A59;
	Tue, 14 Apr 2026 17:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JSJq8RGHxck; Tue, 14 Apr 2026 17:49:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B68984DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188955;
	bh=nhUEXsBvJ1lNl5MqeVVOf/dHCFp85OG7fnKHrHm5G4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EW9VJhs3IDb1OgFD6AnB//KvzzMFFe2nYbZhxg5JcoKHKLGTMzAYjvtFDz+aFg/jg
	 TuAV7MbhdDI6EGhoA8QmtXXMTEjiEOjRU9p0a6MbEBl7mQZbRdCotSSrLKJoEr5vHd
	 V2IJGxctz+UCQTB7bzuy+vzl4taI71jligOD9ClFu5CvT3KGmb52CiC9DJbZSJ6KFz
	 iiHU/NWhuovO6WtCCZzxUr7DYCdZEfSXr2dr9+jpv/8u6l+nHDAeTIY/hITFX4OrAs
	 9/oEe3jy2Vc3IqJP3nHA1mXz+OVhVUBqAk4D0K+omEP5EcQsJuexMNwLdnSe/W+46L
	 4SstB3lc5RN2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B68984DCB;
	Tue, 14 Apr 2026 17:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41E00283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 238296ECE9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXaFwuiHbDnK for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 930D861C9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 930D861C9E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 346087FB2E; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4aaad59da2dd744803636ea2447aba348f540c1
X-Git-Newrev: 3a71efc10e052eff225907cc65c00fe9f46ccbc4
X-Patchwork-Hint: ignore
Message-Id: <20260414174852.346087FB2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: switch to pcre2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3528888305017609080=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3528888305017609080==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a71efc10e052eff225907cc65c00fe9f46ccbc4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://bbs.archlinux.org/viewtopic.php?pid=2129384#p2129384

Patches 0003 and 0004 add upstream commits to support pcre2.

Patch 0002 is a prerequisite for patch 0003 to apply cleanly to
Src/Modules/pcre.c.

Renamed ac_cv_prog_ variable due to changes in patch 0004.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Enable-to-switch-between-C-UTF-8-locales-.patch |  68 +++
 .../0003-51723-migrate-pcre-module-to-pcre2.patch  | 539 +++++++++++++++++++++
 ...t-build-pcre-module-if-pcre2-config-is-no.patch | 108 +++++
 package/zsh/zsh.mk                                 |   8 +-
 4 files changed, 720 insertions(+), 3 deletions(-)

diff --git a/package/zsh/0002-50658-test-Enable-to-switch-between-C-UTF-8-locales-.patch b/package/zsh/0002-50658-test-Enable-to-switch-between-C-UTF-8-locales-.patch
new file mode 100644
index 0000000000..937fd2ee9a
--- /dev/null
+++ b/package/zsh/0002-50658-test-Enable-to-switch-between-C-UTF-8-locales-.patch
@@ -0,0 +1,68 @@
+From 6e0862221f2fadef0ec4153c7f0ca41a016144b8 Mon Sep 17 00:00:00 2001
+From: Jun-ichi Takimoto <takimoto-j@kba.biglobe.ne.jp>
+Date: Mon, 26 Sep 2022 10:52:50 +0900
+Subject: [PATCH] 50658 + test: Enable to switch between C/UTF-8 locales in
+ PCRE
+
+Upstream: https://github.com/zsh-users/zsh/commit/1b421e4978440234fb73117c8505dad1ccc68d46
+
+[Bernd: backported to 5.9]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Src/Modules/pcre.c | 10 ++--------
+ Test/V07pcre.ztst  | 11 +++++++++++
+ 2 files changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/Src/Modules/pcre.c b/Src/Modules/pcre.c
+index 6289e003e..46875a59b 100644
+--- a/Src/Modules/pcre.c
++++ b/Src/Modules/pcre.c
+@@ -47,8 +47,6 @@ zpcre_utf8_enabled(void)
+ #if defined(MULTIBYTE_SUPPORT) && defined(HAVE_NL_LANGINFO) && defined(CODESET)
+     static int have_utf8_pcre = -1;
+ 
+-    /* value can toggle based on MULTIBYTE, so don't
+-     * be too eager with caching */
+     if (have_utf8_pcre < -1)
+ 	return 0;
+ 
+@@ -56,15 +54,11 @@ zpcre_utf8_enabled(void)
+ 	return 0;
+ 
+     if ((have_utf8_pcre == -1) &&
+-        (!strcmp(nl_langinfo(CODESET), "UTF-8"))) {
+-
+-	if (pcre_config(PCRE_CONFIG_UTF8, &have_utf8_pcre))
++	(pcre_config(PCRE_CONFIG_UTF8, &have_utf8_pcre))) {
+ 	    have_utf8_pcre = -2; /* erk, failed to ask */
+     }
+ 
+-    if (have_utf8_pcre < 0)
+-	return 0;
+-    return have_utf8_pcre;
++    return (have_utf8_pcre == 1) && (!strcmp(nl_langinfo(CODESET), "UTF-8"));
+ 
+ #else
+     return 0;
+diff --git a/Test/V07pcre.ztst b/Test/V07pcre.ztst
+index c9c844d2a..ca35d43f0 100644
+--- a/Test/V07pcre.ztst
++++ b/Test/V07pcre.ztst
+@@ -174,3 +174,14 @@
+     echo $match[2] )
+ 0:regression for segmentation fault, workers/38307
+ >test
++
++  LANG_SAVE=$LANG
++  [[ é =~ '^.\z' ]]; echo $?
++  LANG=C
++  [[ é =~ '^..\z' ]]; echo $?
++  LANG=$LANG_SAVE
++  [[ é =~ '^.\z' ]]; echo $?
++0:swich between C/UTF-8 locales
++>0
++>0
++>0
+-- 
+2.47.3
+
diff --git a/package/zsh/0003-51723-migrate-pcre-module-to-pcre2.patch b/package/zsh/0003-51723-migrate-pcre-module-to-pcre2.patch
new file mode 100644
index 0000000000..a6444292fa
--- /dev/null
+++ b/package/zsh/0003-51723-migrate-pcre-module-to-pcre2.patch
@@ -0,0 +1,539 @@
+From 87cfc6e480742ac9721699530085cc07f07045b1 Mon Sep 17 00:00:00 2001
+From: Oliver Kiddle <opk@zsh.org>
+Date: Sat, 13 May 2023 00:53:32 +0200
+Subject: [PATCH] 51723: migrate pcre module to pcre2
+
+Upstream: https://github.com/zsh-users/zsh/commit/b62e911341c8ec7446378b477c47da4256053dc0
+
+[Bernd: backported to 5.9]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Src/Modules/pcre.c | 223 ++++++++++++++++++---------------------------
+ Test/V07pcre.ztst  |  13 ++-
+ configure.ac       |  20 ++--
+ 3 files changed, 107 insertions(+), 149 deletions(-)
+
+diff --git a/Src/Modules/pcre.c b/Src/Modules/pcre.c
+index 46875a59b..079ecc2c5 100644
+--- a/Src/Modules/pcre.c
++++ b/Src/Modules/pcre.c
+@@ -34,11 +34,11 @@
+ #define CPCRE_PLAIN 0
+ 
+ /**/
+-#if defined(HAVE_PCRE_COMPILE) && defined(HAVE_PCRE_EXEC)
+-#include <pcre.h>
++#if defined(HAVE_PCRE2_COMPILE_8) && defined(HAVE_PCRE2_H)
++#define PCRE2_CODE_UNIT_WIDTH 8
++#include <pcre2.h>
+ 
+-static pcre *pcre_pattern;
+-static pcre_extra *pcre_hints;
++static pcre2_code *pcre_pattern;
+ 
+ /**/
+ static int
+@@ -54,8 +54,8 @@ zpcre_utf8_enabled(void)
+ 	return 0;
+ 
+     if ((have_utf8_pcre == -1) &&
+-	(pcre_config(PCRE_CONFIG_UTF8, &have_utf8_pcre))) {
+-	    have_utf8_pcre = -2; /* erk, failed to ask */
++       (pcre2_config(PCRE2_CONFIG_UNICODE, &have_utf8_pcre))) {
++           have_utf8_pcre = -2; /* erk, failed to ask */
+     }
+ 
+     return (have_utf8_pcre == 1) && (!strcmp(nl_langinfo(CODESET), "UTF-8"));
+@@ -69,115 +69,87 @@ zpcre_utf8_enabled(void)
+ static int
+ bin_pcre_compile(char *nam, char **args, Options ops, UNUSED(int func))
+ {
+-    int pcre_opts = 0, pcre_errptr, target_len;
+-    const char *pcre_error;
++    uint32_t pcre_opts = 0;
++    int target_len;
++    int pcre_error;
++    PCRE2_SIZE pcre_offset;
+     char *target;
+     
+-    if(OPT_ISSET(ops,'a')) pcre_opts |= PCRE_ANCHORED;
+-    if(OPT_ISSET(ops,'i')) pcre_opts |= PCRE_CASELESS;
+-    if(OPT_ISSET(ops,'m')) pcre_opts |= PCRE_MULTILINE;
+-    if(OPT_ISSET(ops,'x')) pcre_opts |= PCRE_EXTENDED;
+-    if(OPT_ISSET(ops,'s')) pcre_opts |= PCRE_DOTALL;
++    if (OPT_ISSET(ops, 'a')) pcre_opts |= PCRE2_ANCHORED;
++    if (OPT_ISSET(ops, 'i')) pcre_opts |= PCRE2_CASELESS;
++    if (OPT_ISSET(ops, 'm')) pcre_opts |= PCRE2_MULTILINE;
++    if (OPT_ISSET(ops, 'x')) pcre_opts |= PCRE2_EXTENDED;
++    if (OPT_ISSET(ops, 's')) pcre_opts |= PCRE2_DOTALL;
+     
+     if (zpcre_utf8_enabled())
+-	pcre_opts |= PCRE_UTF8;
+-
+-#ifdef HAVE_PCRE_STUDY
+-    if (pcre_hints)
+-#ifdef PCRE_CONFIG_JIT
+-	pcre_free_study(pcre_hints);
+-#else
+-	pcre_free(pcre_hints);
+-#endif
+-    pcre_hints = NULL;
+-#endif
++	pcre_opts |= PCRE2_UTF;
+ 
+     if (pcre_pattern)
+-	pcre_free(pcre_pattern);
++	pcre2_code_free(pcre_pattern);
+     pcre_pattern = NULL;
+ 
+     target = ztrdup(*args);
+     unmetafy(target, &target_len);
+ 
+-    if ((int)strlen(target) != target_len) {
+-	zwarnnam(nam, "embedded NULs in PCRE pattern terminate pattern");
+-    }
+-
+-    pcre_pattern = pcre_compile(target, pcre_opts, &pcre_error, &pcre_errptr, NULL);
++    pcre_pattern = pcre2_compile((PCRE2_SPTR) target, (PCRE2_SIZE) target_len,
++	    pcre_opts, &pcre_error, &pcre_offset, NULL);
+ 
+     free(target);
+ 
+     if (pcre_pattern == NULL)
+     {
+-	zwarnnam(nam, "error in regex: %s", pcre_error);
++	PCRE2_UCHAR buffer[256];
++	pcre2_get_error_message(pcre_error, buffer, sizeof(buffer));
++	zwarnnam(nam, "error in regex: %s", buffer);
+ 	return 1;
+     }
+     
+     return 0;
+ }
+ 
+-/**/
+-#ifdef HAVE_PCRE_STUDY
+-
+ /**/
+ static int
+ bin_pcre_study(char *nam, UNUSED(char **args), UNUSED(Options ops), UNUSED(int func))
+ {
+-    const char *pcre_error;
+-
+     if (pcre_pattern == NULL)
+     {
+ 	zwarnnam(nam, "no pattern has been compiled for study");
+ 	return 1;
+     }
+-    
+-    if (pcre_hints)
+-#ifdef PCRE_CONFIG_JIT
+-	pcre_free_study(pcre_hints);
+-#else
+-	pcre_free(pcre_hints);
+-#endif
+-    pcre_hints = NULL;
+ 
+-    pcre_hints = pcre_study(pcre_pattern, 0, &pcre_error);
+-    if (pcre_error != NULL)
+-    {
+-	zwarnnam(nam, "error while studying regex: %s", pcre_error);
+-	return 1;
++    int jit = 0;
++    if (!pcre2_config(PCRE2_CONFIG_JIT, &jit) && jit) {
++	if (pcre2_jit_compile(pcre_pattern, PCRE2_JIT_COMPLETE) < 0) {
++	    zwarnnam(nam, "error while studying regex");
++	    return 1;
++	}
+     }
+     
+     return 0;
+ }
+ 
+-/**/
+-#else /* !HAVE_PCRE_STUDY */
+-
+-# define bin_pcre_study bin_notavail
+-
+-/**/
+-#endif /* !HAVE_PCRE_STUDY */
+-
+-/**/
+ static int
+-zpcre_get_substrings(char *arg, int *ovec, int captured_count, char *matchvar,
+-		     char *substravar, int want_offset_pair, int matchedinarr,
+-		     int want_begin_end)
++zpcre_get_substrings(char *arg, pcre2_match_data *mdata, int captured_count,
++	char *matchvar, char *substravar, int want_offset_pair,
++	int matchedinarr, int want_begin_end)
+ {
+-    char **captures, *match_all, **matches;
++    PCRE2_SIZE *ovec;
++    char *match_all, **matches;
+     char offset_all[50];
+     int capture_start = 1;
+ 
+     if (matchedinarr) {
+-	/* bash-style captures[0] entire-matched string in the array */
++	/* bash-style ovec[0] entire-matched string in the array */
+ 	capture_start = 0;
+     }
+ 
+-    /* captures[0] will be entire matched string, [1] first substring */
+-    if (!pcre_get_substring_list(arg, ovec, captured_count, (const char ***)&captures)) {
+-	int nelem = arrlen(captures)-1;
++    /* ovec[0] will be entire matched string, [1] first substring */
++    ovec = pcre2_get_ovector_pointer(mdata);
++    if (ovec) {
++	int nelem = captured_count - 1;
+ 	/* Set to the offsets of the complete match */
+ 	if (want_offset_pair) {
+-	    sprintf(offset_all, "%d %d", ovec[0], ovec[1]);
++	    sprintf(offset_all, "%ld %ld", ovec[0], ovec[1]);
+ 	    setsparam("ZPCRE_OP", ztrdup(offset_all));
+ 	}
+ 	/*
+@@ -186,7 +158,7 @@ zpcre_get_substrings(char *arg, int *ovec, int captured_count, char *matchvar,
+ 	 * ovec is length 2*(1+capture_list_length)
+ 	 */
+ 	if (matchvar) {
+-	    match_all = metafy(captures[0], ovec[1] - ovec[0], META_DUP);
++	    match_all = metafy(arg + ovec[0], ovec[1] - ovec[0], META_DUP);
+ 	    setsparam(matchvar, match_all);
+ 	}
+ 	/*
+@@ -201,16 +173,12 @@ zpcre_get_substrings(char *arg, int *ovec, int captured_count, char *matchvar,
+ 	 */
+ 	if (substravar &&
+ 	    (!want_begin_end || nelem)) {
+-	    char **x, **y;
++	    char **x;
+ 	    int vec_off, i;
+-	    y = &captures[capture_start];
+ 	    matches = x = (char **) zalloc(sizeof(char *) * (captured_count+1-capture_start));
+-	    for (i = capture_start; i < captured_count; i++, y++) {
++	    for (i = capture_start; i < captured_count; i++) {
+ 		vec_off = 2*i;
+-		if (*y)
+-		    *x++ = metafy(*y, ovec[vec_off+1]-ovec[vec_off], META_DUP);
+-		else
+-		    *x++ = NULL;
++		*x++ = metafy(arg + ovec[vec_off], ovec[vec_off+1]-ovec[vec_off], META_DUP);
+ 	    }
+ 	    *x = NULL;
+ 	    setaparam(substravar, matches);
+@@ -247,7 +215,8 @@ zpcre_get_substrings(char *arg, int *ovec, int captured_count, char *matchvar,
+ 	    setiparam("MEND", offs + !isset(KSHARRAYS) - 1);
+ 	    if (nelem) {
+ 		char **mbegin, **mend, **bptr, **eptr;
+-		int i, *ipair;
++		int i;
++		size_t *ipair;
+ 
+ 		bptr = mbegin = zalloc(sizeof(char*)*(nelem+1));
+ 		eptr = mend = zalloc(sizeof(char*)*(nelem+1));
+@@ -287,8 +256,6 @@ zpcre_get_substrings(char *arg, int *ovec, int captured_count, char *matchvar,
+ 		setaparam("mend", mend);
+ 	    }
+ 	}
+-
+-	pcre_free_substring_list((const char **)captures);
+     }
+ 
+     return 0;
+@@ -314,7 +281,8 @@ getposint(char *instr, char *nam)
+ static int
+ bin_pcre_match(char *nam, char **args, Options ops, UNUSED(int func))
+ {
+-    int ret, capcount, *ovec, ovecsize, c;
++    int ret, c;
++    pcre2_match_data *pcre_mdata = NULL;
+     char *matched_portion = NULL;
+     char *plaintext = NULL;
+     char *receptacle = NULL;
+@@ -344,36 +312,30 @@ bin_pcre_match(char *nam, char **args, Options ops, UNUSED(int func))
+     /* For the entire match, 'Return' the offset byte positions instead of the matched string */
+     if(OPT_ISSET(ops,'b')) want_offset_pair = 1;
+ 
+-    if ((ret = pcre_fullinfo(pcre_pattern, pcre_hints, PCRE_INFO_CAPTURECOUNT, &capcount)))
+-    {
+-	zwarnnam(nam, "error %d in fullinfo", ret);
+-	return 1;
+-    }
+-
+-    ovecsize = (capcount+1)*3;
+-    ovec = zalloc(ovecsize*sizeof(int));
+-
+     plaintext = ztrdup(*args);
+     unmetafy(plaintext, &subject_len);
+ 
+     if (offset_start > 0 && offset_start >= subject_len)
+-	ret = PCRE_ERROR_NOMATCH;
+-    else
+-	ret = pcre_exec(pcre_pattern, pcre_hints, plaintext, subject_len, offset_start, 0, ovec, ovecsize);
++	ret = PCRE2_ERROR_NOMATCH;
++    else {
++	pcre_mdata = pcre2_match_data_create_from_pattern(pcre_pattern, NULL);
++	ret = pcre2_match(pcre_pattern, (PCRE2_SPTR) plaintext, subject_len,
++		offset_start, 0, pcre_mdata, NULL);
++    }
+ 
+     if (ret==0) return_value = 0;
+-    else if (ret==PCRE_ERROR_NOMATCH) /* no match */;
++    else if (ret == PCRE2_ERROR_NOMATCH) /* no match */;
+     else if (ret>0) {
+-	zpcre_get_substrings(plaintext, ovec, ret, matched_portion, receptacle,
++	zpcre_get_substrings(plaintext, pcre_mdata, ret, matched_portion, receptacle,
+ 			     want_offset_pair, 0, 0);
+ 	return_value = 0;
+     }
+     else {
+-	zwarnnam(nam, "error in pcre_exec [%d]", ret);
++	zwarnnam(nam, "error in pcre2_match [%d]", ret);
+     }
+     
+-    if (ovec)
+-	zfree(ovec, ovecsize*sizeof(int));
++    if (pcre_mdata)
++	pcre2_match_data_free(pcre_mdata);
+     zsfree(plaintext);
+ 
+     return return_value;
+@@ -383,17 +345,19 @@ bin_pcre_match(char *nam, char **args, Options ops, UNUSED(int func))
+ static int
+ cond_pcre_match(char **a, int id)
+ {
+-    pcre *pcre_pat;
+-    const char *pcre_err;
++    pcre2_code *pcre_pat = NULL;
++    int pcre_err;
++    PCRE2_SIZE pcre_erroff;
+     char *lhstr, *rhre, *lhstr_plain, *rhre_plain, *avar, *svar;
+-    int r = 0, pcre_opts = 0, pcre_errptr, capcnt, *ov, ovsize;
++    int r = 0, pcre_opts = 0;
++    pcre2_match_data *pcre_mdata = NULL;
+     int lhstr_plain_len, rhre_plain_len;
+     int return_value = 0;
+ 
+     if (zpcre_utf8_enabled())
+-	pcre_opts |= PCRE_UTF8;
++	pcre_opts |= PCRE2_UTF;
+     if (isset(REMATCHPCRE) && !isset(CASEMATCH))
+-	pcre_opts |= PCRE_CASELESS;
++	pcre_opts |= PCRE2_CASELESS;
+ 
+     lhstr = cond_str(a,0,0);
+     rhre = cond_str(a,1,0);
+@@ -401,9 +365,6 @@ cond_pcre_match(char **a, int id)
+     rhre_plain = ztrdup(rhre);
+     unmetafy(lhstr_plain, &lhstr_plain_len);
+     unmetafy(rhre_plain, &rhre_plain_len);
+-    pcre_pat = NULL;
+-    ov = NULL;
+-    ovsize = 0;
+ 
+     if (isset(BASHREMATCH)) {
+ 	svar = NULL;
+@@ -415,27 +376,27 @@ cond_pcre_match(char **a, int id)
+ 
+     switch(id) {
+ 	 case CPCRE_PLAIN:
+-		if ((int)strlen(rhre_plain) != rhre_plain_len) {
+-		    zwarn("embedded NULs in PCRE pattern terminate pattern");
+-		}
+-		pcre_pat = pcre_compile(rhre_plain, pcre_opts, &pcre_err, &pcre_errptr, NULL);
+-		if (pcre_pat == NULL) {
+-		    zwarn("failed to compile regexp /%s/: %s", rhre, pcre_err);
++		if (!(pcre_pat = pcre2_compile((PCRE2_SPTR) rhre_plain,
++			(PCRE2_SIZE) rhre_plain_len, pcre_opts,
++			&pcre_err, &pcre_erroff, NULL)))
++		{
++		    PCRE2_UCHAR buffer[256];
++		    pcre2_get_error_message(pcre_err, buffer, sizeof(buffer));
++		    zwarn("failed to compile regexp /%s/: %s", rhre, buffer);
+ 		    break;
+ 		}
+-                pcre_fullinfo(pcre_pat, NULL, PCRE_INFO_CAPTURECOUNT, &capcnt);
+-    		ovsize = (capcnt+1)*3;
+-		ov = zalloc(ovsize*sizeof(int));
+-    		r = pcre_exec(pcre_pat, NULL, lhstr_plain, lhstr_plain_len, 0, 0, ov, ovsize);
+-		/* r < 0 => error; r==0 match but not enough size in ov
++		pcre_mdata = pcre2_match_data_create_from_pattern(pcre_pat, NULL);
++		r = pcre2_match(pcre_pat, (PCRE2_SPTR8) lhstr_plain, lhstr_plain_len,
++			0, 0, pcre_mdata, NULL);
++		/* r < 0 => error; r==0 match but not enough size in match data
+ 		 * r > 0 => (r-1) substrings found; r==1 => no substrings
+ 		 */
+     		if (r==0) {
+-		    zwarn("reportable zsh problem: pcre_exec() returned 0");
++		    zwarn("reportable zsh problem: pcre2_match() returned 0");
+ 		    return_value = 1;
+ 		    break;
+ 		}
+-	        else if (r==PCRE_ERROR_NOMATCH) {
++		else if (r == PCRE2_ERROR_NOMATCH) {
+ 		    return_value = 0; /* no match */
+ 		    break;
+ 		}
+@@ -444,7 +405,7 @@ cond_pcre_match(char **a, int id)
+ 		    break;
+ 		}
+                 else if (r>0) {
+-		    zpcre_get_substrings(lhstr_plain, ov, r, svar, avar, 0,
++		    zpcre_get_substrings(lhstr_plain, pcre_mdata, r, svar, avar, 0,
+ 					 isset(BASHREMATCH),
+ 					 !isset(BASHREMATCH));
+ 		    return_value = 1;
+@@ -457,10 +418,10 @@ cond_pcre_match(char **a, int id)
+ 	free(lhstr_plain);
+     if(rhre_plain)
+ 	free(rhre_plain);
++    if (pcre_mdata)
++	pcre2_match_data_free(pcre_mdata);
+     if (pcre_pat)
+-	pcre_free(pcre_pat);
+-    if (ov)
+-	zfree(ov, ovsize*sizeof(int));
++	pcre2_code_free(pcre_pat);
+ 
+     return return_value;
+ }
+@@ -489,11 +450,11 @@ static struct builtin bintab[] = {
+ 
+ static struct features module_features = {
+     bintab, sizeof(bintab)/sizeof(*bintab),
+-#if defined(HAVE_PCRE_COMPILE) && defined(HAVE_PCRE_EXEC)
++#if defined(HAVE_PCRE2_COMPILE_8) && defined(HAVE_PCRE2_H)
+     cotab, sizeof(cotab)/sizeof(*cotab),
+-#else /* !(HAVE_PCRE_COMPILE && HAVE_PCRE_EXEC) */
++#else /* !(HAVE_PCRE2_COMPILE_8 && HAVE_PCRE2_H) */
+     NULL, 0,
+-#endif /* !(HAVE_PCRE_COMPILE && HAVE_PCRE_EXEC) */
++#endif /* !(HAVE_PCRE2_COMPILE_8 && HAVE_PCRE2_H) */
+     NULL, 0,
+     NULL, 0,
+     0
+@@ -540,19 +501,9 @@ cleanup_(Module m)
+ int
+ finish_(UNUSED(Module m))
+ {
+-#if defined(HAVE_PCRE_COMPILE) && defined(HAVE_PCRE_EXEC)
+-#ifdef HAVE_PCRE_STUDY
+-    if (pcre_hints)
+-#ifdef PCRE_CONFIG_JIT
+-	pcre_free_study(pcre_hints);
+-#else
+-	pcre_free(pcre_hints);
+-#endif
+-    pcre_hints = NULL;
+-#endif
+-
++#if defined(HAVE_PCRE2_COMPILE_8) && defined(HAVE_PCRE2_H)
+     if (pcre_pattern)
+-	pcre_free(pcre_pattern);
++	pcre2_code_free(pcre_pattern);
+     pcre_pattern = NULL;
+ #endif
+ 
+diff --git a/Test/V07pcre.ztst b/Test/V07pcre.ztst
+index ca35d43f0..0129ddc94 100644
+--- a/Test/V07pcre.ztst
++++ b/Test/V07pcre.ztst
+@@ -129,12 +129,17 @@
+ >78884; ZPCRE_OP: 25 30
+ >90210; ZPCRE_OP: 31 36
+ 
+-# Embedded NULs allowed in plaintext, but not in RE (although \0 as two-chars allowed)
++# Embedded NULs allowed in plaintext, in RE, pcre supports \0 as two-chars
+   [[ $'a\0bc\0d' =~ '^(a\0.)(.+)$' ]]
+   print "${#MATCH}; ${#match[1]}; ${#match[2]}"
+ 0:ensure ASCII NUL passes in and out of matched plaintext
+ >6; 3; 3
+ 
++# PCRE2 supports NULs also in the RE
++  [[ $'a\0b\0c' =~ $'^(.\0)+' ]] && print "${#MATCH}; ${#match[1]}"
++0:ensure ASCII NUL works also in the regex
++>4; 2
++
+ # Ensure the long-form infix operator works
+   [[ foo -pcre-match ^f..$ ]]
+   print $?
+@@ -181,7 +186,11 @@
+   [[ é =~ '^..\z' ]]; echo $?
+   LANG=$LANG_SAVE
+   [[ é =~ '^.\z' ]]; echo $?
+-0:swich between C/UTF-8 locales
++0:switch between C/UTF-8 locales
+ >0
+ >0
+ >0
++
++  [[ abc =~ 'a(d*)bc' ]] && print "$#MATCH; $#match; ${#match[1]}"
++0:empty capture
++>3; 1; 0
+diff --git a/configure.ac b/configure.ac
+index b4d3e1f96..a31b32b4e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -438,7 +438,7 @@ fi],
+ 
+ dnl Do you want to look for pcre support?
+ AC_ARG_ENABLE(pcre,
+-AS_HELP_STRING([--enable-pcre],[enable the search for the pcre library (may create run-time library dependencies)]))
++AS_HELP_STRING([--enable-pcre],[enable the search for the pcre2 library (may create run-time library dependencies)]))
+ 
+ dnl Do you want to look for capability support?
+ AC_ARG_ENABLE(cap,
+@@ -662,13 +662,12 @@ AC_HEADER_SYS_WAIT
+ 
+ oldcflags="$CFLAGS"
+ if test x$enable_pcre = xyes; then
+-AC_CHECK_PROG([PCRECONF], pcre-config, pcre-config)
+-dnl Typically (meaning on this single RedHat 9 box in front of me)
+-dnl pcre-config --cflags produces a -I output which needs to go into
++AC_CHECK_PROG([PCRECONF], pcre2-config, pcre2-config)
++dnl pcre2-config --cflags may produce a -I output which needs to go into
+ dnl CPPFLAGS else configure's preprocessor tests don't pick it up,
+ dnl producing a warning.
+-if test "x$ac_cv_prog_PCRECONF" = xpcre-config; then
+-  CPPFLAGS="$CPPFLAGS `pcre-config --cflags`"
++if test "x$ac_cv_prog_PCRECONF" = xpcre2-config; then
++  CPPFLAGS="$CPPFLAGS `pcre2-config --cflags`"
+ fi
+ fi
+ 
+@@ -678,9 +677,10 @@ AC_CHECK_HEADERS(sys/time.h sys/times.h sys/select.h termcap.h termio.h \
+ 		 locale.h errno.h stdio.h stdarg.h varargs.h stdlib.h \
+ 		 unistd.h sys/capability.h \
+ 		 utmp.h utmpx.h sys/types.h pwd.h grp.h poll.h sys/mman.h \
+-		 netinet/in_systm.h pcre.h langinfo.h wchar.h stddef.h \
++		 netinet/in_systm.h langinfo.h wchar.h stddef.h \
+ 		 sys/stropts.h iconv.h ncurses.h ncursesw/ncurses.h \
+ 		 ncurses/ncurses.h)
++AC_CHECK_HEADERS([pcre2.h],,,[#define PCRE2_CODE_UNIT_WIDTH 8])
+ if test x$dynamic = xyes; then
+   AC_CHECK_HEADERS(dlfcn.h)
+   AC_CHECK_HEADERS(dl.h)
+@@ -958,9 +958,7 @@ if test "x$ac_found_iconv" = "xyes"; then
+ fi
+ 
+ if test x$enable_pcre = xyes; then
+-dnl pcre-config should probably be employed here
+-dnl AC_SEARCH_LIBS(pcre_compile, pcre)
+-  LIBS="`$ac_cv_prog_PCRECONF --libs` $LIBS"
++  LIBS="`$ac_cv_prog_PCRECONF --libs8` $LIBS"
+ fi
+ 
+ dnl ---------------------
+@@ -1323,7 +1321,7 @@ AC_CHECK_FUNCS(strftime strptime mktime timelocal \
+ 	       pathconf sysconf \
+ 	       tgetent tigetflag tigetnum tigetstr setupterm initscr resize_term \
+ 	       getcchar setcchar waddwstr wget_wch win_wch use_default_colors \
+-	       pcre_compile pcre_study pcre_exec \
++	       pcre2_compile_8 \
+ 	       nl_langinfo \
+ 	       erand48 open_memstream \
+ 	       posix_openpt \
+-- 
+2.47.3
+
diff --git a/package/zsh/0004-51877-do-not-build-pcre-module-if-pcre2-config-is-no.patch b/package/zsh/0004-51877-do-not-build-pcre-module-if-pcre2-config-is-no.patch
new file mode 100644
index 0000000000..78ab9e7b1e
--- /dev/null
+++ b/package/zsh/0004-51877-do-not-build-pcre-module-if-pcre2-config-is-no.patch
@@ -0,0 +1,108 @@
+From 041c553ed62e2c3f5a9444b82463a330555ad347 Mon Sep 17 00:00:00 2001
+From: Jun-ichi Takimoto <takimoto-j@kba.biglobe.ne.jp>
+Date: Tue, 20 Jun 2023 18:14:27 +0900
+Subject: [PATCH] 51877: do not build pcre module if pcre2-config is not found
+
+Upstream: https://github.com/zsh-users/zsh/commit/10bdbd8b5b0b43445aff23dcd412f25cf6aa328a
+
+[Bernd: backported to 5.9]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Src/Modules/pcre.mdd |  2 +-
+ configure.ac         | 31 +++++++++++++++++++------------
+ 2 files changed, 20 insertions(+), 13 deletions(-)
+
+diff --git a/Src/Modules/pcre.mdd b/Src/Modules/pcre.mdd
+index 6eb3c691b..3e1579117 100644
+--- a/Src/Modules/pcre.mdd
++++ b/Src/Modules/pcre.mdd
+@@ -1,5 +1,5 @@
+ name=zsh/pcre
+-link=`if test x$enable_pcre = xyes && (pcre-config --version >/dev/null 2>/dev/null); then echo dynamic; else echo no; fi`
++link=`if test x$enable_pcre = xyes; then echo dynamic; else echo no; fi`
+ load=no
+ 
+ autofeatures="b:pcre_compile b:pcre_study b:pcre_match"
+diff --git a/configure.ac b/configure.ac
+index a31b32b4e..770a788e8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -440,6 +440,17 @@ dnl Do you want to look for pcre support?
+ AC_ARG_ENABLE(pcre,
+ AS_HELP_STRING([--enable-pcre],[enable the search for the pcre2 library (may create run-time library dependencies)]))
+ 
++AC_ARG_VAR(PCRE_CONFIG, [pathname of pcre2-config if it is not in PATH])
++if test "x$enable_pcre" = xyes; then
++  AC_CHECK_PROG([PCRE_CONFIG], pcre2-config, pcre2-config)
++  if test "x$PCRE_CONFIG" = x; then
++    enable_pcre=no
++    AC_MSG_WARN([pcre2-config not found: pcre module is disabled.])
++    AC_MSG_NOTICE(
++      [Set PCRE_CONFIG to pathname of pcre2-config if it is not in PATH.])
++  fi
++fi
++
+ dnl Do you want to look for capability support?
+ AC_ARG_ENABLE(cap,
+ AS_HELP_STRING([--enable-cap],[enable the search for POSIX capabilities (may require additional headers to be added by hand)]))
+@@ -660,15 +671,12 @@ AC_HEADER_DIRENT
+ AC_HEADER_STAT
+ AC_HEADER_SYS_WAIT
+ 
+-oldcflags="$CFLAGS"
+-if test x$enable_pcre = xyes; then
+-AC_CHECK_PROG([PCRECONF], pcre2-config, pcre2-config)
+ dnl pcre2-config --cflags may produce a -I output which needs to go into
+ dnl CPPFLAGS else configure's preprocessor tests don't pick it up,
+ dnl producing a warning.
+-if test "x$ac_cv_prog_PCRECONF" = xpcre2-config; then
+-  CPPFLAGS="$CPPFLAGS `pcre2-config --cflags`"
+-fi
++if test "x$enable_pcre" = xyes; then
++  CPPFLAGS="`$PCRE_CONFIG --cflags` $CPPFLAGS"
++  AC_CHECK_HEADERS([pcre2.h],,,[#define PCRE2_CODE_UNIT_WIDTH 8])
+ fi
+ 
+ AC_CHECK_HEADERS(sys/time.h sys/times.h sys/select.h termcap.h termio.h \
+@@ -680,7 +688,6 @@ AC_CHECK_HEADERS(sys/time.h sys/times.h sys/select.h termcap.h termio.h \
+ 		 netinet/in_systm.h langinfo.h wchar.h stddef.h \
+ 		 sys/stropts.h iconv.h ncurses.h ncursesw/ncurses.h \
+ 		 ncurses/ncurses.h)
+-AC_CHECK_HEADERS([pcre2.h],,,[#define PCRE2_CODE_UNIT_WIDTH 8])
+ if test x$dynamic = xyes; then
+   AC_CHECK_HEADERS(dlfcn.h)
+   AC_CHECK_HEADERS(dl.h)
+@@ -957,10 +964,6 @@ if test "x$ac_found_iconv" = "xyes"; then
+     [Define as const if the declaration of iconv() needs const.])
+ fi
+ 
+-if test x$enable_pcre = xyes; then
+-  LIBS="`$ac_cv_prog_PCRECONF --libs8` $LIBS"
+-fi
+-
+ dnl ---------------------
+ dnl CHECK TERMCAP LIBRARY
+ dnl ---------------------
+@@ -1321,7 +1324,6 @@ AC_CHECK_FUNCS(strftime strptime mktime timelocal \
+ 	       pathconf sysconf \
+ 	       tgetent tigetflag tigetnum tigetstr setupterm initscr resize_term \
+ 	       getcchar setcchar waddwstr wget_wch win_wch use_default_colors \
+-	       pcre2_compile_8 \
+ 	       nl_langinfo \
+ 	       erand48 open_memstream \
+ 	       posix_openpt \
+@@ -1376,6 +1378,11 @@ if test x$zsh_cv_func_realpath_accepts_null = xyes; then
+   AC_DEFINE(REALPATH_ACCEPTS_NULL)
+ fi
+ 
++if test x$enable_pcre = xyes; then
++  LIBS="`$PCRE_CONFIG --libs8` $LIBS"
++  AC_CHECK_FUNCS(pcre2_compile_8)
++fi
++
+ if test x$enable_cap = xyes; then
+   AC_CHECK_FUNCS(cap_get_proc)
+ fi
+-- 
+2.47.3
+
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 7e577fa9e1..2c464c33a8 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -14,6 +14,8 @@ ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 ZSH_CPE_ID_VENDOR = zsh
 # 0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
+# 0003-51723-migrate-pcre-module-to-pcre2.patch
+# 0004-51877-do-not-build-pcre-module-if-pcre2-config-is-no.patch
 ZSH_AUTORECONF = YES
 
 # zsh uses TRY_RUN to determine these
@@ -38,10 +40,10 @@ else
 ZSH_CONF_OPTS += --disable-cap
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
 ZSH_CONF_OPTS += --enable-pcre
-ZSH_CONF_ENV += ac_cv_prog_PCRECONF=$(STAGING_DIR)/usr/bin/pcre-config
-ZSH_DEPENDENCIES += pcre
+ZSH_CONF_ENV += ac_cv_prog_PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
+ZSH_DEPENDENCIES += pcre2
 else
 ZSH_CONF_OPTS += --disable-pcre
 endif

--===============3528888305017609080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3528888305017609080==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2DACD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A8A46130B;
	Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZR3-NzU2_zh; Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5325161310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043124;
	bh=p9FvVGmWeTHOOB0s3udmgeJWwIqHuTW6kNGr+PfF7uU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G7Jzno6byfeT14cJrHOesRRKt1gxTsAH9gzWaFpO3Q5uaHSsr6Qe3opQd2yNCCT3r
	 Qyd3t4q+dnvpiRQSTDA5cU+P9J3VPpNrT3xB5AxrMHvwqcHhWPF/9iilXCpjrxUML0
	 4uCkZzT1YbeTk1HzLZbQaVv4yNx+HHO3/5918woC1gfejg8iDfkOA1W894Fs/cvFIp
	 dyLrpvXUVVZ7hDbU9iPCehBRC2GXZ5VkVs6qtutWhMX/io8qVrEawTorG58tvg5vdv
	 D2MxGjZknL3nKYevJ02eO1XVlW+JEGJKRVLIfH9L9aKZnlPc1wgywVBt2xA0RMIQDn
	 omQ1DZvN9gSpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5325161310;
	Fri, 29 May 2026 08:25:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51EF528E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41DCB6130A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaMiMsyUjf_K for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41826612D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41826612D2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C133387391; Fri, 29 May 2026 08:25:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 May 2026 12:51:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 898251ee2b83a9cd5ae0ae5db57828035a5a6f85
X-Git-Newrev: d8a8dd14f6f275173e610c79974c624847672f36
X-Patchwork-Hint: ignore
Message-Id: <20260529082505.C133387391@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dropbear:
 security bump to version 2026.90
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8a8dd14f6f275173e610c79974c624847672f36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.90
https://matt.ucc.asn.au/dropbear/CHANGES

Fixes CVE-2019-6111 & CVE-2026-35385.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5b136c89ffed35c30dff1802924a4dcf9bdab798)
[thomas: reverts commit 30d1791eb26a8ef46a952d1ef66e163de1eade07]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dropbear/0001-CVE-2019-6111.patch  | 364 -----------------------------
 package/dropbear/0002-CVE-2026-35385.patch |  40 ----
 package/dropbear/dropbear.hash             |   2 +-
 package/dropbear/dropbear.mk               |   8 +-
 4 files changed, 2 insertions(+), 412 deletions(-)

diff --git a/package/dropbear/0001-CVE-2019-6111.patch b/package/dropbear/0001-CVE-2019-6111.patch
deleted file mode 100644
index 6ec149444a..0000000000
--- a/package/dropbear/0001-CVE-2019-6111.patch
+++ /dev/null
@@ -1,364 +0,0 @@
-From 143291baca6ebb3407a0c25c85bd53bf041a6ab7 Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Mon, 20 Apr 2026 20:57:11 +0800
-Subject: [PATCH] scp: more CVE-2019-6111 fix
-
-Cherrypicked from OpenSSH portable
-
-commit 3d896c157c722bc47adca51a58dca859225b5874
-djm Sun Feb 10 11:15:52 2019 +0000
-
-upstream: when checking that filenames sent by the server side
-
-match what the client requested, be prepared to handle shell-style brace
-alternations, e.g. "{foo,bar}".
-
-"looks good to me" millert@ + in snaps for the last week courtesy
-deraadt@
-
-Upstream: https://github.com/mkj/dropbear/commit/143291baca6ebb3407a0c25c85bd53bf041a6ab7.patch
-CVE: CVE-2019-6111
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/scp.c | 281 +++++++++++++++++++++++++++++++++++++++++++++++++++---
- 1 file changed, 269 insertions(+), 12 deletions(-)
-
-diff --git a/src/scp.c b/src/scp.c
-index bf98986c..d151587c 100644
---- a/src/scp.c
-+++ b/src/scp.c
-@@ -74,7 +74,6 @@
-  */
- 
- #include "includes.h"
--/*RCSID("$OpenBSD: scp.c,v 1.130 2006/01/31 10:35:43 djm Exp $");*/
- 
- #include <fnmatch.h>
- 
-@@ -600,6 +599,253 @@ tolocal(int argc, char **argv)
- 	}
- }
- 
-+/* Appends a string to an array; returns 0 on success, -1 on alloc failure */
-+static int
-+append(char *cp, char ***ap, size_t *np)
-+{
-+	char **tmp;
-+
-+	if ((tmp = reallocarray(*ap, *np + 1, sizeof(*tmp))) == NULL)
-+		return -1;
-+	tmp[(*np)] = cp;
-+	(*np)++;
-+	*ap = tmp;
-+	return 0;
-+}
-+
-+/*
-+ * Finds the start and end of the first brace pair in the pattern.
-+ * returns 0 on success or -1 for invalid patterns.
-+ */
-+static int
-+find_brace(const char *pattern, int *startp, int *endp)
-+{
-+	int i;
-+	int in_bracket, brace_level;
-+
-+	*startp = *endp = -1;
-+	in_bracket = brace_level = 0;
-+	for (i = 0; i < INT_MAX && *endp < 0 && pattern[i] != '\0'; i++) {
-+		switch (pattern[i]) {
-+		case '\\':
-+			/* skip next character */
-+			if (pattern[i + 1] != '\0')
-+				i++;
-+			break;
-+		case '[':
-+			in_bracket = 1;
-+			break;
-+		case ']':
-+			in_bracket = 0;
-+			break;
-+		case '{':
-+			if (in_bracket)
-+				break;
-+			if (pattern[i + 1] == '}') {
-+				/* Protect a single {}, for find(1), like csh */
-+				i++; /* skip */
-+				break;
-+			}
-+			if (*startp == -1)
-+				*startp = i;
-+			brace_level++;
-+			break;
-+		case '}':
-+			if (in_bracket)
-+				break;
-+			if (*startp < 0) {
-+				/* Unbalanced brace */
-+				return -1;
-+			}
-+			if (--brace_level <= 0)
-+				*endp = i;
-+			break;
-+		}
-+	}
-+	/* unbalanced brackets/braces */
-+	if (*endp < 0 && (*startp >= 0 || in_bracket))
-+		return -1;
-+	return 0;
-+}
-+
-+/*
-+ * Assembles and records a successfully-expanded pattern, returns -1 on
-+ * alloc failure.
-+ */
-+static int
-+emit_expansion(const char *pattern, int brace_start, int brace_end,
-+    int sel_start, int sel_end, char ***patternsp, size_t *npatternsp)
-+{
-+	char *cp;
-+	int o = 0, tail_len = strlen(pattern + brace_end + 1);
-+
-+	if ((cp = malloc(brace_start + (sel_end - sel_start) +
-+	    tail_len + 1)) == NULL)
-+		return -1;
-+
-+	/* Pattern before initial brace */
-+	if (brace_start > 0) {
-+		memcpy(cp, pattern, brace_start);
-+		o = brace_start;
-+	}
-+	/* Current braced selection */
-+	if (sel_end - sel_start > 0) {
-+		memcpy(cp + o, pattern + sel_start,
-+		    sel_end - sel_start);
-+		o += sel_end - sel_start;
-+	}
-+	/* Remainder of pattern after closing brace */
-+	if (tail_len > 0) {
-+		memcpy(cp + o, pattern + brace_end + 1, tail_len);
-+		o += tail_len;
-+	}
-+	cp[o] = '\0';
-+	if (append(cp, patternsp, npatternsp) != 0) {
-+		free(cp);
-+		return -1;
-+	}
-+	return 0;
-+}
-+
-+/*
-+ * Expand the first encountered brace in pattern, appending the expanded
-+ * patterns it yielded to the *patternsp array.
-+ *
-+ * Returns 0 on success or -1 on allocation failure.
-+ *
-+ * Signals whether expansion was performed via *expanded and whether
-+ * pattern was invalid via *invalid.
-+ */
-+static int
-+brace_expand_one(const char *pattern, char ***patternsp, size_t *npatternsp,
-+    int *expanded, int *invalid)
-+{
-+	int i;
-+	int in_bracket, brace_start, brace_end, brace_level;
-+	int sel_start, sel_end;
-+
-+	*invalid = *expanded = 0;
-+
-+	if (find_brace(pattern, &brace_start, &brace_end) != 0) {
-+		*invalid = 1;
-+		return 0;
-+	} else if (brace_start == -1)
-+		return 0;
-+
-+	in_bracket = brace_level = 0;
-+	for (i = sel_start = brace_start + 1; i < brace_end; i++) {
-+		switch (pattern[i]) {
-+		case '{':
-+			if (in_bracket)
-+				break;
-+			brace_level++;
-+			break;
-+		case '}':
-+			if (in_bracket)
-+				break;
-+			brace_level--;
-+			break;
-+		case '[':
-+			in_bracket = 1;
-+			break;
-+		case ']':
-+			in_bracket = 0;
-+			break;
-+		case '\\':
-+			if (i < brace_end - 1)
-+				i++; /* skip */
-+			break;
-+		}
-+		if (pattern[i] == ',' || i == brace_end - 1) {
-+			if (in_bracket || brace_level > 0)
-+				continue;
-+			/* End of a selection, emit an expanded pattern */
-+
-+			/* Adjust end index for last selection */
-+			sel_end = (i == brace_end - 1) ? brace_end : i;
-+			if (emit_expansion(pattern, brace_start, brace_end,
-+			    sel_start, sel_end, patternsp, npatternsp) != 0)
-+				return -1;
-+			/* move on to the next selection */
-+			sel_start = i + 1;
-+			continue;
-+		}
-+	}
-+	if (in_bracket || brace_level > 0) {
-+		*invalid = 1;
-+		return 0;
-+	}
-+	/* success */
-+	*expanded = 1;
-+	return 0;
-+}
-+
-+/* Expand braces from pattern. Returns 0 on success, -1 on failure */
-+static int
-+brace_expand(const char *pattern, char ***patternsp, size_t *npatternsp)
-+{
-+	char *cp, *cp2, **active = NULL, **done = NULL;
-+	size_t i, nactive = 0, ndone = 0;
-+	int ret = -1, invalid = 0, expanded = 0;
-+
-+	*patternsp = NULL;
-+	*npatternsp = 0;
-+
-+	/* Start the worklist with the original pattern */
-+	if ((cp = strdup(pattern)) == NULL)
-+		return -1;
-+	if (append(cp, &active, &nactive) != 0) {
-+		free(cp);
-+		return -1;
-+	}
-+	while (nactive > 0) {
-+		cp = active[nactive - 1];
-+		nactive--;
-+		if (brace_expand_one(cp, &active, &nactive,
-+		    &expanded, &invalid) == -1) {
-+			free(cp);
-+			goto fail;
-+		}
-+		if (invalid)
-+			fatal("%s: invalid brace pattern \"%s\"", __func__, cp);
-+		if (expanded) {
-+			/*
-+			 * Current entry expanded to new entries on the
-+			 * active list; discard the progenitor pattern.
-+			 */
-+			free(cp);
-+			continue;
-+		}
-+		/*
-+		 * Pattern did not expand; append the finename component to
-+		 * the completed list
-+		 */
-+		if ((cp2 = strrchr(cp, '/')) != NULL)
-+			*cp2++ = '\0';
-+		else
-+			cp2 = cp;
-+		if (append(xstrdup(cp2), &done, &ndone) != 0) {
-+			free(cp);
-+			goto fail;
-+		}
-+		free(cp);
-+	}
-+	/* success */
-+	*patternsp = done;
-+	*npatternsp = ndone;
-+	done = NULL;
-+	ndone = 0;
-+	ret = 0;
-+ fail:
-+	for (i = 0; i < nactive; i++)
-+		free(active[i]);
-+	free(active);
-+	for (i = 0; i < ndone; i++)
-+		free(done[i]);
-+	free(done);
-+	return ret;
-+}
-+
- void
- source(int argc, char **argv)
- {
-@@ -841,7 +1087,8 @@ sink(int argc, char **argv, const char *src)
- 	off_t size, statbytes;
- 	int setimes, targisdir, wrerrno = 0;
- 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048];
--	char *src_copy = NULL, *restrict_pattern = NULL;
-+	char **patterns = NULL;
-+	size_t n, npatterns = 0;
- 	struct timeval tv[2];
- 
- #define	atime	tv[0]
-@@ -868,16 +1115,13 @@ sink(int argc, char **argv, const char *src)
- 		 * Prepare to try to restrict incoming filenames to match
- 		 * the requested destination file glob.
- 		 */
--		if ((src_copy = strdup(src)) == NULL)
--			fatal("strdup failed");
--		if ((restrict_pattern = strrchr(src_copy, '/')) != NULL) {
--			*restrict_pattern++ = '\0';
--		}
-+		if (brace_expand(src, &patterns, &npatterns) != 0)
-+			fatal("%s: could not expand pattern", __func__);
- 	}
- 	for (first = 1;; first = 0) {
- 		cp = buf;
- 		if (atomicio(read, remin, cp, 1) != 1)
--			return;
-+			goto done;
- 		if (*cp++ == '\n')
- 			SCREWUP("unexpected <newline>");
- 		do {
-@@ -900,7 +1144,7 @@ sink(int argc, char **argv, const char *src)
- 		}
- 		if (buf[0] == 'E') {
- 			(void) atomicio(vwrite, remout, "", 1);
--			return;
-+			goto done;
- 		}
- 		if (ch == '\n')
- 			*--cp = 0;
-@@ -956,9 +1200,14 @@ sink(int argc, char **argv, const char *src)
- 			run_err("error: unexpected filename: %s", cp);
- 			exit(1);
- 		}
--		if (restrict_pattern != NULL &&
--		    fnmatch(restrict_pattern, cp, 0) != 0)
--			SCREWUP("filename does not match request");
-+		if (npatterns > 0) {
-+			for (n = 0; n < npatterns; n++) {
-+				if (fnmatch(patterns[n], cp, 0) == 0)
-+					break;
-+			}
-+			if (n >= npatterns)
-+				SCREWUP("filename does not match request");
-+		}
- 		if (targisdir) {
- 			static char *namebuf = NULL;
- 			static size_t cursize = 0;
-@@ -1123,7 +1372,15 @@ bad:			run_err("%s: %s", np, strerror(errno));
- 			break;
- 		}
- 	}
-+done:
-+	for (n = 0; n < npatterns; n++)
-+		free(patterns[n]);
-+	free(patterns);
-+	return;
- screwup:
-+	for (n = 0; n < npatterns; n++)
-+		free(patterns[n]);
-+	free(patterns);
- 	run_err("protocol error: %s", why);
- 	exit(1);
- }
diff --git a/package/dropbear/0002-CVE-2026-35385.patch b/package/dropbear/0002-CVE-2026-35385.patch
deleted file mode 100644
index 59c9f4bb69..0000000000
--- a/package/dropbear/0002-CVE-2026-35385.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 443ccc1fd1b9a4e3747f6b5cd644b7af49064308 Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Sat, 2 May 2026 08:17:25 +0800
-Subject: [PATCH] scp: clear setuid/setgid bits on received files
-
-From openssh-portable 487e8ac146f7d6616f65c125d5edb210519b833a
-Tracked as CVE-2026-35385
-
-upstream: when downloading files as root in legacy (-O) mode and
-
-without the -p (preserve modes) flag set, clear setuid/setgid bits from
-downloaded files as one might expect.
-
-AFAIK this bug dates back to the original Berkeley rcp program.
-
-Reported by Christos Papakonstantinou of Cantina and Spearbit.
-
-Upstream: https://github.com/mkj/dropbear/commit/443ccc1fd1b9a4e3747f6b5cd644b7af49064308.patch
-CVE: CVE-2026-35385
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/scp.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/scp.c b/src/scp.c
-index 09297a5b..79b0a12d 100644
---- a/src/scp.c
-+++ b/src/scp.c
-@@ -1106,8 +1106,10 @@ sink(int argc, char **argv, const char *src)
- 
- 	setimes = targisdir = 0;
- 	mask = umask(0);
--	if (!pflag)
-+	if (!pflag) {
-+		mask |= 07000;
- 		(void) umask(mask);
-+	}
- 	if (argc != 1) {
- 		run_err("ambiguous target");
- 		exit(1);
diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index b3f532b1b7..81296375a1 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634  dropbear-2025.89.tar.bz2
+sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 36acd7a4e4..beb635e15e 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2025.89
+DROPBEAR_VERSION = 2026.90
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
@@ -14,12 +14,6 @@ DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 DROPBEAR_CPE_ID_VENDOR = dropbear_ssh_project
 DROPBEAR_CPE_ID_PRODUCT = dropbear_ssh
 
-# 0001-CVE-2019-6111.patch
-DROPBEAR_IGNORE_CVES += CVE-2019-6111
-
-# 0002-CVE-2026-35385.patch
-DROPBEAR_IGNORE_CVES += CVE-2026-35385
-
 # Disable hardening flags added by dropbear configure.ac, and let
 # Buildroot add them when the relevant options are enabled. This
 # prevents dropbear from using SSP support when not available.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

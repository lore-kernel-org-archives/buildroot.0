Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346F3CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A31E41B18;
	Fri, 15 May 2026 13:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d00fArPwnBzI; Fri, 15 May 2026 13:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7456241B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851811;
	bh=wGRFw9Ja2AhjmDlDyCGDoCbisUY56UY8D0YKeoaRF9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qmjjfjj5K4xU3yFWMb5+3BPyqOBCn/hlPPVDNW3QPZUV1w1hDUdJMhwV7Dd1L9luH
	 NQiAa9HdsiaQblP1zPIPXNP4DRDAmZK6uWQ+S+ARF6WqGca6fxGJ/oaVAsBKffN6Vo
	 zKmDCmNHyn4n5iXdFsxyzMRrWHCwqYaA+gqdKI3XH4EDG5dDDINh7Vw21rYWEJloTh
	 u3ZxZSLYpm1nseBdwgHzRNptNv+mPX/UBLynQQLwz9K4qi8LOw+HgkbXnASAAxwiyZ
	 8qGk4zXMQfY1CLvYBzzzHjp5/H+4JY2PTG+rAY9D8TBdmsCVwDYAzXmG6eWB+psKTO
	 snoPbaiJ078qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7456241B3C;
	Fri, 15 May 2026 13:30:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1601A42B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84C9061563
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wS5HoJgRWhp for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C77C861558
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C77C861558
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 274AA86356; Fri, 15 May 2026 13:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 14:49:54 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c8321c0500a37abaa9460810f47e8a5a39744d87
X-Git-Newrev: 3db14ab765265ba6f821b8a843c3fe058f74f792
X-Patchwork-Hint: ignore
Message-Id: <20260515132949.274AA86356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/dropbear: patch
 CVE-2019-6111 CVE-2026-35385
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3db14ab765265ba6f821b8a843c3fe058f74f792
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

While CVE-2019-6111 was already fixed in 2025.89, the version 2026.90
provided a follow up of that fix.

Note that the author provided this note with this patch:

> Note breaking change: "-r" is now disallowed when the target directory exists
> (an additional change in Dropbear's version). If that's required an alternative
> such as rsync could be used.

Adapt your usage of dropbear accordingly.

- CVE-2019-6111:
    An issue was discovered in OpenSSH 7.9. Due to the scp implementation
    being derived from 1983 rcp, the server chooses which
    files/directories are sent to the client. However, the scp client only
    performs cursory validation of the object name returned (only
    directory traversal attacks are prevented). A malicious scp server (or
    Man-in-The-Middle attacker) can overwrite arbitrary files in the scp
    client target directory. If recursive operation (-r) is performed, the
    server can manipulate subdirectories as well (for example, to
    overwrite the .ssh/authorized_keys file).

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2019-6111

- CVE-2026-35385:
    In OpenSSH before 10.3, a file downloaded by scp may be installed
    setuid or setgid, an outcome contrary to some users' expectations, if
    the download is performed as root with -O (legacy scp protocol) and
    without -p (preserve mode).

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2026-35385

[1] https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.90

(cherry picked from commit 5b136c89ffed35c30dff1802924a4dcf9bdab798)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dropbear/0001-CVE-2019-6111.patch  | 364 +++++++++++++++++++++++++++++
 package/dropbear/0002-CVE-2026-35385.patch |  40 ++++
 package/dropbear/dropbear.mk               |   6 +
 3 files changed, 410 insertions(+)

diff --git a/package/dropbear/0001-CVE-2019-6111.patch b/package/dropbear/0001-CVE-2019-6111.patch
new file mode 100644
index 0000000000..6ec149444a
--- /dev/null
+++ b/package/dropbear/0001-CVE-2019-6111.patch
@@ -0,0 +1,364 @@
+From 143291baca6ebb3407a0c25c85bd53bf041a6ab7 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 20 Apr 2026 20:57:11 +0800
+Subject: [PATCH] scp: more CVE-2019-6111 fix
+
+Cherrypicked from OpenSSH portable
+
+commit 3d896c157c722bc47adca51a58dca859225b5874
+djm Sun Feb 10 11:15:52 2019 +0000
+
+upstream: when checking that filenames sent by the server side
+
+match what the client requested, be prepared to handle shell-style brace
+alternations, e.g. "{foo,bar}".
+
+"looks good to me" millert@ + in snaps for the last week courtesy
+deraadt@
+
+Upstream: https://github.com/mkj/dropbear/commit/143291baca6ebb3407a0c25c85bd53bf041a6ab7.patch
+CVE: CVE-2019-6111
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/scp.c | 281 +++++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 269 insertions(+), 12 deletions(-)
+
+diff --git a/src/scp.c b/src/scp.c
+index bf98986c..d151587c 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -74,7 +74,6 @@
+  */
+ 
+ #include "includes.h"
+-/*RCSID("$OpenBSD: scp.c,v 1.130 2006/01/31 10:35:43 djm Exp $");*/
+ 
+ #include <fnmatch.h>
+ 
+@@ -600,6 +599,253 @@ tolocal(int argc, char **argv)
+ 	}
+ }
+ 
++/* Appends a string to an array; returns 0 on success, -1 on alloc failure */
++static int
++append(char *cp, char ***ap, size_t *np)
++{
++	char **tmp;
++
++	if ((tmp = reallocarray(*ap, *np + 1, sizeof(*tmp))) == NULL)
++		return -1;
++	tmp[(*np)] = cp;
++	(*np)++;
++	*ap = tmp;
++	return 0;
++}
++
++/*
++ * Finds the start and end of the first brace pair in the pattern.
++ * returns 0 on success or -1 for invalid patterns.
++ */
++static int
++find_brace(const char *pattern, int *startp, int *endp)
++{
++	int i;
++	int in_bracket, brace_level;
++
++	*startp = *endp = -1;
++	in_bracket = brace_level = 0;
++	for (i = 0; i < INT_MAX && *endp < 0 && pattern[i] != '\0'; i++) {
++		switch (pattern[i]) {
++		case '\\':
++			/* skip next character */
++			if (pattern[i + 1] != '\0')
++				i++;
++			break;
++		case '[':
++			in_bracket = 1;
++			break;
++		case ']':
++			in_bracket = 0;
++			break;
++		case '{':
++			if (in_bracket)
++				break;
++			if (pattern[i + 1] == '}') {
++				/* Protect a single {}, for find(1), like csh */
++				i++; /* skip */
++				break;
++			}
++			if (*startp == -1)
++				*startp = i;
++			brace_level++;
++			break;
++		case '}':
++			if (in_bracket)
++				break;
++			if (*startp < 0) {
++				/* Unbalanced brace */
++				return -1;
++			}
++			if (--brace_level <= 0)
++				*endp = i;
++			break;
++		}
++	}
++	/* unbalanced brackets/braces */
++	if (*endp < 0 && (*startp >= 0 || in_bracket))
++		return -1;
++	return 0;
++}
++
++/*
++ * Assembles and records a successfully-expanded pattern, returns -1 on
++ * alloc failure.
++ */
++static int
++emit_expansion(const char *pattern, int brace_start, int brace_end,
++    int sel_start, int sel_end, char ***patternsp, size_t *npatternsp)
++{
++	char *cp;
++	int o = 0, tail_len = strlen(pattern + brace_end + 1);
++
++	if ((cp = malloc(brace_start + (sel_end - sel_start) +
++	    tail_len + 1)) == NULL)
++		return -1;
++
++	/* Pattern before initial brace */
++	if (brace_start > 0) {
++		memcpy(cp, pattern, brace_start);
++		o = brace_start;
++	}
++	/* Current braced selection */
++	if (sel_end - sel_start > 0) {
++		memcpy(cp + o, pattern + sel_start,
++		    sel_end - sel_start);
++		o += sel_end - sel_start;
++	}
++	/* Remainder of pattern after closing brace */
++	if (tail_len > 0) {
++		memcpy(cp + o, pattern + brace_end + 1, tail_len);
++		o += tail_len;
++	}
++	cp[o] = '\0';
++	if (append(cp, patternsp, npatternsp) != 0) {
++		free(cp);
++		return -1;
++	}
++	return 0;
++}
++
++/*
++ * Expand the first encountered brace in pattern, appending the expanded
++ * patterns it yielded to the *patternsp array.
++ *
++ * Returns 0 on success or -1 on allocation failure.
++ *
++ * Signals whether expansion was performed via *expanded and whether
++ * pattern was invalid via *invalid.
++ */
++static int
++brace_expand_one(const char *pattern, char ***patternsp, size_t *npatternsp,
++    int *expanded, int *invalid)
++{
++	int i;
++	int in_bracket, brace_start, brace_end, brace_level;
++	int sel_start, sel_end;
++
++	*invalid = *expanded = 0;
++
++	if (find_brace(pattern, &brace_start, &brace_end) != 0) {
++		*invalid = 1;
++		return 0;
++	} else if (brace_start == -1)
++		return 0;
++
++	in_bracket = brace_level = 0;
++	for (i = sel_start = brace_start + 1; i < brace_end; i++) {
++		switch (pattern[i]) {
++		case '{':
++			if (in_bracket)
++				break;
++			brace_level++;
++			break;
++		case '}':
++			if (in_bracket)
++				break;
++			brace_level--;
++			break;
++		case '[':
++			in_bracket = 1;
++			break;
++		case ']':
++			in_bracket = 0;
++			break;
++		case '\\':
++			if (i < brace_end - 1)
++				i++; /* skip */
++			break;
++		}
++		if (pattern[i] == ',' || i == brace_end - 1) {
++			if (in_bracket || brace_level > 0)
++				continue;
++			/* End of a selection, emit an expanded pattern */
++
++			/* Adjust end index for last selection */
++			sel_end = (i == brace_end - 1) ? brace_end : i;
++			if (emit_expansion(pattern, brace_start, brace_end,
++			    sel_start, sel_end, patternsp, npatternsp) != 0)
++				return -1;
++			/* move on to the next selection */
++			sel_start = i + 1;
++			continue;
++		}
++	}
++	if (in_bracket || brace_level > 0) {
++		*invalid = 1;
++		return 0;
++	}
++	/* success */
++	*expanded = 1;
++	return 0;
++}
++
++/* Expand braces from pattern. Returns 0 on success, -1 on failure */
++static int
++brace_expand(const char *pattern, char ***patternsp, size_t *npatternsp)
++{
++	char *cp, *cp2, **active = NULL, **done = NULL;
++	size_t i, nactive = 0, ndone = 0;
++	int ret = -1, invalid = 0, expanded = 0;
++
++	*patternsp = NULL;
++	*npatternsp = 0;
++
++	/* Start the worklist with the original pattern */
++	if ((cp = strdup(pattern)) == NULL)
++		return -1;
++	if (append(cp, &active, &nactive) != 0) {
++		free(cp);
++		return -1;
++	}
++	while (nactive > 0) {
++		cp = active[nactive - 1];
++		nactive--;
++		if (brace_expand_one(cp, &active, &nactive,
++		    &expanded, &invalid) == -1) {
++			free(cp);
++			goto fail;
++		}
++		if (invalid)
++			fatal("%s: invalid brace pattern \"%s\"", __func__, cp);
++		if (expanded) {
++			/*
++			 * Current entry expanded to new entries on the
++			 * active list; discard the progenitor pattern.
++			 */
++			free(cp);
++			continue;
++		}
++		/*
++		 * Pattern did not expand; append the finename component to
++		 * the completed list
++		 */
++		if ((cp2 = strrchr(cp, '/')) != NULL)
++			*cp2++ = '\0';
++		else
++			cp2 = cp;
++		if (append(xstrdup(cp2), &done, &ndone) != 0) {
++			free(cp);
++			goto fail;
++		}
++		free(cp);
++	}
++	/* success */
++	*patternsp = done;
++	*npatternsp = ndone;
++	done = NULL;
++	ndone = 0;
++	ret = 0;
++ fail:
++	for (i = 0; i < nactive; i++)
++		free(active[i]);
++	free(active);
++	for (i = 0; i < ndone; i++)
++		free(done[i]);
++	free(done);
++	return ret;
++}
++
+ void
+ source(int argc, char **argv)
+ {
+@@ -841,7 +1087,8 @@ sink(int argc, char **argv, const char *src)
+ 	off_t size, statbytes;
+ 	int setimes, targisdir, wrerrno = 0;
+ 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048];
+-	char *src_copy = NULL, *restrict_pattern = NULL;
++	char **patterns = NULL;
++	size_t n, npatterns = 0;
+ 	struct timeval tv[2];
+ 
+ #define	atime	tv[0]
+@@ -868,16 +1115,13 @@ sink(int argc, char **argv, const char *src)
+ 		 * Prepare to try to restrict incoming filenames to match
+ 		 * the requested destination file glob.
+ 		 */
+-		if ((src_copy = strdup(src)) == NULL)
+-			fatal("strdup failed");
+-		if ((restrict_pattern = strrchr(src_copy, '/')) != NULL) {
+-			*restrict_pattern++ = '\0';
+-		}
++		if (brace_expand(src, &patterns, &npatterns) != 0)
++			fatal("%s: could not expand pattern", __func__);
+ 	}
+ 	for (first = 1;; first = 0) {
+ 		cp = buf;
+ 		if (atomicio(read, remin, cp, 1) != 1)
+-			return;
++			goto done;
+ 		if (*cp++ == '\n')
+ 			SCREWUP("unexpected <newline>");
+ 		do {
+@@ -900,7 +1144,7 @@ sink(int argc, char **argv, const char *src)
+ 		}
+ 		if (buf[0] == 'E') {
+ 			(void) atomicio(vwrite, remout, "", 1);
+-			return;
++			goto done;
+ 		}
+ 		if (ch == '\n')
+ 			*--cp = 0;
+@@ -956,9 +1200,14 @@ sink(int argc, char **argv, const char *src)
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
+-		if (restrict_pattern != NULL &&
+-		    fnmatch(restrict_pattern, cp, 0) != 0)
+-			SCREWUP("filename does not match request");
++		if (npatterns > 0) {
++			for (n = 0; n < npatterns; n++) {
++				if (fnmatch(patterns[n], cp, 0) == 0)
++					break;
++			}
++			if (n >= npatterns)
++				SCREWUP("filename does not match request");
++		}
+ 		if (targisdir) {
+ 			static char *namebuf = NULL;
+ 			static size_t cursize = 0;
+@@ -1123,7 +1372,15 @@ bad:			run_err("%s: %s", np, strerror(errno));
+ 			break;
+ 		}
+ 	}
++done:
++	for (n = 0; n < npatterns; n++)
++		free(patterns[n]);
++	free(patterns);
++	return;
+ screwup:
++	for (n = 0; n < npatterns; n++)
++		free(patterns[n]);
++	free(patterns);
+ 	run_err("protocol error: %s", why);
+ 	exit(1);
+ }
diff --git a/package/dropbear/0002-CVE-2026-35385.patch b/package/dropbear/0002-CVE-2026-35385.patch
new file mode 100644
index 0000000000..59c9f4bb69
--- /dev/null
+++ b/package/dropbear/0002-CVE-2026-35385.patch
@@ -0,0 +1,40 @@
+From 443ccc1fd1b9a4e3747f6b5cd644b7af49064308 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 2 May 2026 08:17:25 +0800
+Subject: [PATCH] scp: clear setuid/setgid bits on received files
+
+From openssh-portable 487e8ac146f7d6616f65c125d5edb210519b833a
+Tracked as CVE-2026-35385
+
+upstream: when downloading files as root in legacy (-O) mode and
+
+without the -p (preserve modes) flag set, clear setuid/setgid bits from
+downloaded files as one might expect.
+
+AFAIK this bug dates back to the original Berkeley rcp program.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+Upstream: https://github.com/mkj/dropbear/commit/443ccc1fd1b9a4e3747f6b5cd644b7af49064308.patch
+CVE: CVE-2026-35385
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/scp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/scp.c b/src/scp.c
+index 09297a5b..79b0a12d 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -1106,8 +1106,10 @@ sink(int argc, char **argv, const char *src)
+ 
+ 	setimes = targisdir = 0;
+ 	mask = umask(0);
+-	if (!pflag)
++	if (!pflag) {
++		mask |= 07000;
+ 		(void) umask(mask);
++	}
+ 	if (argc != 1) {
+ 		run_err("ambiguous target");
+ 		exit(1);
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e4e42cf994..36acd7a4e4 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -14,6 +14,12 @@ DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 DROPBEAR_CPE_ID_VENDOR = dropbear_ssh_project
 DROPBEAR_CPE_ID_PRODUCT = dropbear_ssh
 
+# 0001-CVE-2019-6111.patch
+DROPBEAR_IGNORE_CVES += CVE-2019-6111
+
+# 0002-CVE-2026-35385.patch
+DROPBEAR_IGNORE_CVES += CVE-2026-35385
+
 # Disable hardening flags added by dropbear configure.ac, and let
 # Buildroot add them when the relevant options are enabled. This
 # prevents dropbear from using SSP support when not available.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

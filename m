Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF396CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C84E2821A8;
	Fri,  5 Jun 2026 12:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZluRDfDZsP96; Fri,  5 Jun 2026 12:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE20382124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663215;
	bh=pmajseoYtAY1zdUq5E/LmvsO99RQxw7jtQQOA8NX5Jo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HSNoKm3uJlkUnPKoZ4wRTJu45K3Ak2BQgoMcu9fUakZhJj9eyiClzgTBlOFJK6jAb
	 pTEdRi+nlUz4ZFnc2d8EPVTrhtyiHZP9vMfR8+Ib55KJ4WisGuIy7BOW1LgSR5wp60
	 ALskF8I/Bm9+PqgIY8Fj2pyywSPEPIs08vxED1LTuVIVtgJCsZdAzfFXeYyVIB2VPU
	 zFU9ltltJoMfjzT6W+NCdbDjGMpVhjkeHMn6/+UxTo+s4ucbHzL0HhbxwJISOQLQgR
	 /L7KMYcFzah/NTIm76DrrBPvznUi9rQncPFQiPnxPOZ6A4pU7vWVrmnU6oEH3CcVCM
	 7QxO/4JuOQHAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE20382124;
	Fri,  5 Jun 2026 12:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 021D4F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56B8481ED8
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8U5FLQt55utr for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6073081E5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6073081E5C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DCF687B22; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:54:02 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 76db7e8a107598823de9656f77edbbcd10c00add
X-Git-Newrev: d3108998390b9bbeffda3d030a2efffc830fefde
X-Patchwork-Hint: ignore
Message-Id: <20260605123834.7DCF687B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/heirloom-mailx:
 import patches from Debian
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
Content-Type: multipart/mixed; boundary="===============0994772089610225862=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0994772089610225862==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3108998390b9bbeffda3d030a2efffc830fefde
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

In Buildroot there are multiple way to apply patches on a package [1]

- Adding `.patch` file in the package directory.
- Define `<pkg>_PATCH` variable with the location of the patch tar.gz.
  It used to download Debian patches tarball.
- Implement custom patching logic with `PRE`/`POST` patches hooks.

To make the CycloneDX SBOM generation not dependant on downloading the
packages, the two last options have the downside of not appearing on the
generated SBOM.

The heirloom-mailx package is downloading a tarball from the Debian
mirror with the `<pkg>_PATCH` method [2].

To improve the tracking of the patched vulnerabilities for the
heirloom-mailx package this commit import the patches previously
downloaded with the `_PATCH` variable in the Buildroot tree. This allows
to add the `CVE:` trailer [3] on the patches that fix vulnerabilities to
better track which patch is fixing the vulnerability.

[1] https://buildroot.org/downloads/manual/manual.html#patch-policy
[2] http://snapshot.debian.org/archive/debian/20150815T155609Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
[3] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9659fd9e8475a43d4dafc6df19962882046d252)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |   1 -
 ...e-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch |  57 +++++++++++
 ...-SSL2-support-since-it-is-no-longer-suppo.patch |  39 ++++++++
 ...ntian-warning-warning-macro-N-not-defined.patch |  23 +++++
 .../0011-outof-Introduce-expandaddr-flag.patch     |  69 +++++++++++++
 ...ble-option-processing-for-email-addresses.patch |  77 ++++++++++++++
 ...c-Unconditionally-require-wordexp-support.patch | 111 +++++++++++++++++++++
 ...4-globname-Invoke-wordexp-with-WRDE_NOCMD.patch |  29 ++++++
 .../heirloom-mailx/0015-usr-sbin-sendmail.patch    |  36 +++++++
 ...pport.patch => 0101-fix-libressl-support.patch} |   1 +
 package/heirloom-mailx/heirloom-mailx.mk           |   5 +-
 11 files changed, 444 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3056655394..88d89d42ca 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -420,7 +420,6 @@ package/gutenprint/0002-cups-support-replaces-static-with-static-libtool-lib.pat
 package/harfbuzz/0001-meson.build-check-for-pthread.h.patch lib_patch.Upstream
 package/haserl/0001-add-haserl_lualib.inc.patch lib_patch.Upstream
 package/haveged/S21haveged Shellcheck lib_sysv.Variables
-package/heirloom-mailx/0001-fix-libressl-support.patch lib_patch.Upstream
 package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstream
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/heirloom-mailx/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch b/package/heirloom-mailx/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
new file mode 100644
index 0000000000..967344159e
--- /dev/null
+++ b/package/heirloom-mailx/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
@@ -0,0 +1,57 @@
+From: Luk Claes <luk@debian.org>
+Date: Sat, 4 Jul 2009 10:54:53 +0200
+Subject: Don't reuse weak symbol optopt to fix FTBFS on mips*
+
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ getopt.c |   10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/getopt.c b/getopt.c
+index 83ce628..82e983c 100644
+--- a/getopt.c
++++ b/getopt.c
+@@ -43,7 +43,7 @@ typedef	int	ssize_t;
+ char	*optarg;
+ int	optind = 1;
+ int	opterr = 1;
+-int	optopt;
++int	optoptc;
+ 
+ static void
+ error(const char *s, int c)
+@@ -69,7 +69,7 @@ error(const char *s, int c)
+ 		*bp++ = *s++;
+ 	while (*msg)
+ 		*bp++ = *msg++;
+-	*bp++ = optopt;
++	*bp++ = optoptc;
+ 	*bp++ = '\n';
+ 	write(2, buf, bp - buf);
+ 	ac_free(buf);
+@@ -101,13 +101,13 @@ getopt(int argc, char *const argv[], const char *optstring)
+ 		}
+ 		curp = &argv[optind][1];
+ 	}
+-	optopt = curp[0] & 0377;
++	optoptc = curp[0] & 0377;
+ 	while (optstring[0]) {
+ 		if (optstring[0] == ':') {
+ 			optstring++;
+ 			continue;
+ 		}
+-		if ((optstring[0] & 0377) == optopt) {
++		if ((optstring[0] & 0377) == optoptc) {
+ 			if (optstring[1] == ':') {
+ 				if (curp[1] != '\0') {
+ 					optarg = (char *)&curp[1];
+@@ -127,7 +127,7 @@ getopt(int argc, char *const argv[], const char *optstring)
+ 					optind++;
+ 				optarg = 0;
+ 			}
+-			return optopt;
++			return optoptc;
+ 		}
+ 		optstring++;
+ 	}
diff --git a/package/heirloom-mailx/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch b/package/heirloom-mailx/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
new file mode 100644
index 0000000000..156aea7a37
--- /dev/null
+++ b/package/heirloom-mailx/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
@@ -0,0 +1,39 @@
+From: Hilko Bengen <bengen@debian.org>
+Date: Wed, 27 Apr 2011 00:18:42 +0200
+Subject: Patched out SSL2 support since it is no longer supported by OpenSSL.
+
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mailx.1   |    2 +-
+ openssl.c |    4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/mailx.1 b/mailx.1
+index 417ea04..a02e430 100644
+--- a/mailx.1
++++ b/mailx.1
+@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using OpenSSL.
+ .TP
+ .B ssl-method
+ Selects a SSL/TLS protocol version;
+-valid values are `ssl2', `ssl3', and `tls1'.
++valid values are `ssl3', and `tls1'.
+ If unset, the method is selected automatically,
+ if possible.
+ .TP
+diff --git a/openssl.c b/openssl.c
+index b4e33fc..44fe4e5 100644
+--- a/openssl.c
++++ b/openssl.c
+@@ -216,9 +216,7 @@ ssl_select_method(const char *uhp)
+ 
+ 	cp = ssl_method_string(uhp);
+ 	if (cp != NULL) {
+-		if (equal(cp, "ssl2"))
+-			method = SSLv2_client_method();
+-		else if (equal(cp, "ssl3"))
++		if (equal(cp, "ssl3"))
+ 			method = SSLv3_client_method();
+ 		else if (equal(cp, "tls1"))
+ 			method = TLSv1_client_method();
diff --git a/package/heirloom-mailx/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch b/package/heirloom-mailx/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
new file mode 100644
index 0000000000..724f7c8b81
--- /dev/null
+++ b/package/heirloom-mailx/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
@@ -0,0 +1,23 @@
+From: Hilko Bengen <bengen@debian.org>
+Date: Sat, 14 Apr 2012 20:22:43 +0200
+Subject: Fixed Lintian warning (warning: macro `N' not defined)
+
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mailx.1 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mailx.1 b/mailx.1
+index a02e430..b0723bd 100644
+--- a/mailx.1
++++ b/mailx.1
+@@ -3781,7 +3781,7 @@ you could examine the first message by giving the command:
+ .sp
+ .fi
+ which might cause
+-.N mailx
++.I mailx
+ to respond with, for example:
+ .nf
+ .sp
diff --git a/package/heirloom-mailx/0011-outof-Introduce-expandaddr-flag.patch b/package/heirloom-mailx/0011-outof-Introduce-expandaddr-flag.patch
new file mode 100644
index 0000000000..7825b788bc
--- /dev/null
+++ b/package/heirloom-mailx/0011-outof-Introduce-expandaddr-flag.patch
@@ -0,0 +1,69 @@
+From 9984ae5cb0ea0d61df1612b06952a61323c083d9 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 11:13:38 +0100
+Subject: [PATCH] outof: Introduce expandaddr flag
+
+Document that address expansion is disabled unless the expandaddr
+binary option is set.
+
+This has been assigned CVE-2014-7844 for BSD mailx, but it is not
+a vulnerability in Heirloom mailx because this feature was documented.
+
+CVE: CVE-2014-7844
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0011-outof-Introduce-expandaddr-flag.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mailx.1 | 14 ++++++++++++++
+ names.c |  3 +++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/mailx.1 b/mailx.1
+index 70a7859..22a171b 100644
+--- a/mailx.1
++++ b/mailx.1
+@@ -656,6 +656,14 @@ but any reply returned to the machine
+ will have the system wide alias expanded
+ as all mail goes through sendmail.
+ .SS "Recipient address specifications"
++If the
++.I expandaddr
++option is not set (the default), recipient addresses must be names of
++local mailboxes or Internet mail addresses.
++.PP
++If the
++.I expandaddr
++option is set, the following rules apply:
+ When an address is used to name a recipient
+ (in any of To, Cc, or Bcc),
+ names of local mail folders
+@@ -2391,6 +2399,12 @@ and exits immediately.
+ If this option is set,
+ \fImailx\fR starts even with an empty mailbox.
+ .TP
++.B expandaddr
++Causes
++.I mailx
++to expand message recipient addresses, as explained in the section,
++Recipient address specifications.
++.TP
+ .B flipr
+ Exchanges the
+ .I Respond
+diff --git a/names.c b/names.c
+index 66e976b..c69560f 100644
+--- a/names.c
++++ b/names.c
+@@ -268,6 +268,9 @@ outof(struct name *names, FILE *fo, struct header *hp)
+ 	FILE *fout, *fin;
+ 	int ispipe;
+ 
++	if (value("expandaddr") == NULL)
++		return names;
++
+ 	top = names;
+ 	np = names;
+ 	time(&now);
+-- 
+1.9.3
+
+
diff --git a/package/heirloom-mailx/0012-unpack-Disable-option-processing-for-email-addresses.patch b/package/heirloom-mailx/0012-unpack-Disable-option-processing-for-email-addresses.patch
new file mode 100644
index 0000000000..64a1e7f246
--- /dev/null
+++ b/package/heirloom-mailx/0012-unpack-Disable-option-processing-for-email-addresses.patch
@@ -0,0 +1,77 @@
+From e34e2ac67b80497080ebecccec40c3b61456167d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 11:14:06 +0100
+Subject: [PATCH] unpack: Disable option processing for email addresses
+ when calling sendmail
+
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0012-unpack-Disable-option-processing-for-email-addresses.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ extern.h  | 2 +-
+ names.c   | 8 ++++++--
+ sendout.c | 2 +-
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/extern.h b/extern.h
+index 6b85ba0..8873fe8 100644
+--- a/extern.h
++++ b/extern.h
+@@ -396,7 +396,7 @@ struct name *outof(struct name *names, FILE *fo, struct header *hp);
+ int is_fileaddr(char *name);
+ struct name *usermap(struct name *names);
+ struct name *cat(struct name *n1, struct name *n2);
+-char **unpack(struct name *np);
++char **unpack(struct name *smopts, struct name *np);
+ struct name *elide(struct name *names);
+ int count(struct name *np);
+ struct name *delete_alternates(struct name *np);
+diff --git a/names.c b/names.c
+index c69560f..45bbaed 100644
+--- a/names.c
++++ b/names.c
+@@ -549,7 +549,7 @@ cat(struct name *n1, struct name *n2)
+  * Return an error if the name list won't fit.
+  */
+ char **
+-unpack(struct name *np)
++unpack(struct name *smopts, struct name *np)
+ {
+ 	char **ap, **top;
+ 	struct name *n;
+@@ -564,7 +564,7 @@ unpack(struct name *np)
+ 	 * the terminating 0 pointer.  Additional spots may be needed
+ 	 * to pass along -f to the host mailer.
+ 	 */
+-	extra = 2;
++	extra = 3 + count(smopts);
+ 	extra++;
+ 	metoo = value("metoo") != NULL;
+ 	if (metoo)
+@@ -581,6 +581,10 @@ unpack(struct name *np)
+ 		*ap++ = "-m";
+ 	if (verbose)
+ 		*ap++ = "-v";
++	for (; smopts != NULL; smopts = smopts->n_flink)
++		if ((smopts->n_type & GDEL) == 0)
++			*ap++ = smopts->n_name;
++	*ap++ = "--";
+ 	for (; n != NULL; n = n->n_flink)
+ 		if ((n->n_type & GDEL) == 0)
+ 			*ap++ = n->n_name;
+diff --git a/sendout.c b/sendout.c
+index 7b7f2eb..c52f15d 100644
+--- a/sendout.c
++++ b/sendout.c
+@@ -835,7 +835,7 @@ start_mta(struct name *to, struct name *mailargs, FILE *input,
+ #endif	/* HAVE_SOCKETS */
+ 
+ 	if ((smtp = value("smtp")) == NULL) {
+-		args = unpack(cat(mailargs, to));
++		args = unpack(mailargs, to);
+ 		if (debug || value("debug")) {
+ 			printf(catgets(catd, CATSET, 181,
+ 					"Sendmail arguments:"));
+-- 
+1.9.3
+
+
diff --git a/package/heirloom-mailx/0013-fio.c-Unconditionally-require-wordexp-support.patch b/package/heirloom-mailx/0013-fio.c-Unconditionally-require-wordexp-support.patch
new file mode 100644
index 0000000000..6938daec12
--- /dev/null
+++ b/package/heirloom-mailx/0013-fio.c-Unconditionally-require-wordexp-support.patch
@@ -0,0 +1,111 @@
+From 2bae8ecf04ec2ba6bb9f0af5b80485dd0edb427d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 12:48:25 +0100
+Subject: [PATCH] fio.c: Unconditionally require wordexp support
+
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0013-fio.c-Unconditionally-require-wordexp-support.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ fio.c | 67 +++++--------------------------------------------------------------
+ 1 file changed, 5 insertions(+), 62 deletions(-)
+
+diff --git a/fio.c b/fio.c
+index 65e8f10..1529236 100644
+--- a/fio.c
++++ b/fio.c
+@@ -43,12 +43,15 @@ static char sccsid[] = "@(#)fio.c	2.76 (gritter) 9/16/09";
+ #endif /* not lint */
+ 
+ #include "rcv.h"
++
++#ifndef HAVE_WORDEXP
++#error wordexp support is required
++#endif
++
+ #include <sys/stat.h>
+ #include <sys/file.h>
+ #include <sys/wait.h>
+-#ifdef	HAVE_WORDEXP
+ #include <wordexp.h>
+-#endif	/* HAVE_WORDEXP */
+ #include <unistd.h>
+ 
+ #if defined (USE_NSS)
+@@ -481,7 +484,6 @@ next:
+ static char *
+ globname(char *name)
+ {
+-#ifdef	HAVE_WORDEXP
+ 	wordexp_t we;
+ 	char *cp;
+ 	sigset_t nset;
+@@ -527,65 +529,6 @@ globname(char *name)
+ 	}
+ 	wordfree(&we);
+ 	return cp;
+-#else	/* !HAVE_WORDEXP */
+-	char xname[PATHSIZE];
+-	char cmdbuf[PATHSIZE];		/* also used for file names */
+-	int pid, l;
+-	char *cp, *shell;
+-	int pivec[2];
+-	extern int wait_status;
+-	struct stat sbuf;
+-
+-	if (pipe(pivec) < 0) {
+-		perror("pipe");
+-		return name;
+-	}
+-	snprintf(cmdbuf, sizeof cmdbuf, "echo %s", name);
+-	if ((shell = value("SHELL")) == NULL)
+-		shell = SHELL;
+-	pid = start_command(shell, 0, -1, pivec[1], "-c", cmdbuf, NULL);
+-	if (pid < 0) {
+-		close(pivec[0]);
+-		close(pivec[1]);
+-		return NULL;
+-	}
+-	close(pivec[1]);
+-again:
+-	l = read(pivec[0], xname, sizeof xname);
+-	if (l < 0) {
+-		if (errno == EINTR)
+-			goto again;
+-		perror("read");
+-		close(pivec[0]);
+-		return NULL;
+-	}
+-	close(pivec[0]);
+-	if (wait_child(pid) < 0 && WTERMSIG(wait_status) != SIGPIPE) {
+-		fprintf(stderr, catgets(catd, CATSET, 81,
+-				"\"%s\": Expansion failed.\n"), name);
+-		return NULL;
+-	}
+-	if (l == 0) {
+-		fprintf(stderr, catgets(catd, CATSET, 82,
+-					"\"%s\": No match.\n"), name);
+-		return NULL;
+-	}
+-	if (l == sizeof xname) {
+-		fprintf(stderr, catgets(catd, CATSET, 83,
+-				"\"%s\": Expansion buffer overflow.\n"), name);
+-		return NULL;
+-	}
+-	xname[l] = 0;
+-	for (cp = &xname[l-1]; *cp == '\n' && cp > xname; cp--)
+-		;
+-	cp[1] = '\0';
+-	if (strchr(xname, ' ') && stat(xname, &sbuf) < 0) {
+-		fprintf(stderr, catgets(catd, CATSET, 84,
+-				"\"%s\": Ambiguous.\n"), name);
+-		return NULL;
+-	}
+-	return savestr(xname);
+-#endif	/* !HAVE_WORDEXP */
+ }
+ 
+ /*
+-- 
+1.9.3
+
+
diff --git a/package/heirloom-mailx/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch b/package/heirloom-mailx/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
new file mode 100644
index 0000000000..378b157d8a
--- /dev/null
+++ b/package/heirloom-mailx/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
@@ -0,0 +1,29 @@
+From 73fefa0c1ac70043ec84f2d8b8f9f683213f168d Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Nov 2014 13:11:32 +0100
+Subject: [PATCH] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)
+
+CVE: CVE-2004-2771
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ fio.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fio.c b/fio.c
+index 1529236..774a204 100644
+--- a/fio.c
++++ b/fio.c
+@@ -497,7 +497,7 @@ globname(char *name)
+ 	sigemptyset(&nset);
+ 	sigaddset(&nset, SIGCHLD);
+ 	sigprocmask(SIG_BLOCK, &nset, NULL);
+-	i = wordexp(name, &we, 0);
++	i = wordexp(name, &we, WRDE_NOCMD);
+ 	sigprocmask(SIG_UNBLOCK, &nset, NULL);
+ 	switch (i) {
+ 	case 0:
+-- 
+1.9.3
+
+
diff --git a/package/heirloom-mailx/0015-usr-sbin-sendmail.patch b/package/heirloom-mailx/0015-usr-sbin-sendmail.patch
new file mode 100644
index 0000000000..195b606c01
--- /dev/null
+++ b/package/heirloom-mailx/0015-usr-sbin-sendmail.patch
@@ -0,0 +1,36 @@
+Description: Sendmail is at /usr/sbin/sendmail
+ As per Debian Policy §11.6
+Author: Ryan Kavanagh <rak@debian.org>
+Origin: Debian
+Forwarded: no
+
+Upstream: https://sources.debian.org/patches/heirloom-mailx/12.5-4/0015-usr-sbin-sendmail.patch/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+Index: heirloom-mailx-12.5/Makefile
+===================================================================
+--- heirloom-mailx-12.5.orig/Makefile	2011-04-26 17:23:22.000000000 -0400
++++ heirloom-mailx-12.5/Makefile	2015-01-27 13:20:04.733542801 -0500
+@@ -13,7 +13,7 @@
+ 
+ MAILRC		= $(SYSCONFDIR)/nail.rc
+ MAILSPOOL	= /var/mail
+-SENDMAIL	= /usr/lib/sendmail
++SENDMAIL	= /usr/sbin/sendmail
+ 
+ DESTDIR		=
+ 
+Index: heirloom-mailx-12.5/mailx.1
+===================================================================
+--- heirloom-mailx-12.5.orig/mailx.1	2015-01-27 13:18:49.000000000 -0500
++++ heirloom-mailx-12.5/mailx.1	2015-01-27 13:20:32.382336867 -0500
+@@ -4922,7 +4922,7 @@
+ which just acts as a proxy.
+ .PP
+ \fIMailx\fR immediately contacts the SMTP server (or
+-.IR \%/usr/lib/sendmail )
++.IR \%/usr/sbin/sendmail )
+ even when operating in
+ .I disconnected
+ mode.
diff --git a/package/heirloom-mailx/0001-fix-libressl-support.patch b/package/heirloom-mailx/0101-fix-libressl-support.patch
similarity index 99%
rename from package/heirloom-mailx/0001-fix-libressl-support.patch
rename to package/heirloom-mailx/0101-fix-libressl-support.patch
index b54aaaf73c..25cc92d580 100644
--- a/package/heirloom-mailx/0001-fix-libressl-support.patch
+++ b/package/heirloom-mailx/0101-fix-libressl-support.patch
@@ -10,6 +10,7 @@ heirloom-mailx has two small issues when compiling against LibreSSL:
   - SSLv3_client_method function is used (LibreSSL does not support SSLv3)
     Solution: "Guard" the code with #ifndef OPENSSL_NO_SSL3
 
+Upstream: N/A
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  openssl.c | 7 +++++++
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index 063fccf5eb..075b5f6a59 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -7,14 +7,13 @@
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
 HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20150815T155609Z/pool/main/h/heirloom-mailx
-HEIRLOOM_MAILX_PATCH = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION)-5.debian.tar.xz
 HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPL-1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
 HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
-# 0011-outof-Introduce-expandaddr-flag.patch in the Debian patches
+# 0011-outof-Introduce-expandaddr-flag.patch
 HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
-# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch in the Debian patches
+# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
 HEIRLOOM_MAILX_IGNORE_CVES += CVE-2004-2771
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)

--===============0994772089610225862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0994772089610225862==--

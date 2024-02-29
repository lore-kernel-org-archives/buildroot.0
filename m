Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949C9C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6266B41A88;
	Thu, 29 Feb 2024 15:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H4jdy1GnM-Cv; Thu, 29 Feb 2024 15:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E69B41A32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E69B41A32;
	Thu, 29 Feb 2024 15:52:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 468F91BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D61141918
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVA5Vtw3JBmd for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7919441912
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7919441912
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10E1C87D71; Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:30:57 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 891a18201a2189c38a6e1ee12fb03680414d24bd
X-Git-Newrev: c4a0b4f3925ccf18fa93e3e2bbca7b0f38e221d4
X-Patchwork-Hint: ignore
Message-Id: <20240229153305.10E1C87D71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openssh: fix
 build error on powerpc
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
Content-Type: multipart/mixed; boundary="===============9111948416386156861=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9111948416386156861==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c4a0b4f3925ccf18fa93e3e2bbca7b0f38e221d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following error message introducted by OpenSSH v9.6p1.

  sshkey.c: In function 'sshkey_set_filename':
  sshkey.c:3705:1: sorry, unimplemented: '-fzero-call-used-regs' not supported on this target
   3705 | }

Fixes:
http://autobuild.buildroot.org/results/ec7/ec780aed5b1c4fdf9b91f6e7be99e8d4c42efa58

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 325fe1aecfd20d2653cce6bc189824c6fdfcafec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-detection-of-broken-fzero-call-used-regs.patch | 57 ++++++++++++++++++++++
 package/openssh/openssh.mk                         |  3 ++
 2 files changed, 60 insertions(+)

diff --git a/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch b/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch
new file mode 100644
index 0000000000..5c056033a9
--- /dev/null
+++ b/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch
@@ -0,0 +1,57 @@
+From 1036d77b34a5fa15e56f516b81b9928006848cbd Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Fri, 22 Dec 2023 17:56:26 +1100
+Subject: [PATCH] better detection of broken -fzero-call-used-regs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc 13.2.0 on ppc64le refuses to compile some function, including
+cipher.c:compression_alg_list() with an error:
+
+> sorry, unimplemented: argument ‘used’ is not supportedcw
+> for ‘-fzero-call-used-regs’ on this target
+
+This extends the autoconf will-it-work test with a similarly-
+structured function that seems to catch this.
+
+Spotted/tested by Colin Watson; bz3645
+
+Upstream: https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f516b81b9928006848cbd.patch
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+---
+ m4/openssh.m4 | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/m4/openssh.m4 b/m4/openssh.m4
+index 5d4c56280fc..033df501c3d 100644
+--- a/m4/openssh.m4
++++ b/m4/openssh.m4
+@@ -20,18 +20,24 @@ char *f2(char *s, ...) {
+ 	va_end(args);
+ 	return strdup(ret);
+ }
++const char *f3(int s) {
++	return s ? "good" : "gooder";
++}
+ int main(int argc, char **argv) {
+-	(void)argv;
+ 	char b[256], *cp;
++	const char *s;
+ 	/* Some math to catch -ftrapv problems in the toolchain */
+ 	int i = 123 * argc, j = 456 + argc, k = 789 - argc;
+ 	float l = i * 2.1;
+ 	double m = l / 0.5;
+ 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
++	(void)argv;
+ 	f(1);
+-	snprintf(b, sizeof b, "%d %d %d %f %f %lld %lld\n", i,j,k,l,m,n,o);
++	s = f3(f(2));
++	snprintf(b, sizeof b, "%d %d %d %f %f %lld %lld %s\n", i,j,k,l,m,n,o,s);
+ 	if (write(1, b, 0) == -1) exit(0);
+-	cp = f2("%d %d %d %f %f %lld %lld\n", i,j,k,l,m,n,o);
++	cp = f2("%d %d %d %f %f %lld %lld %s\n", i,j,k,l,m,n,o,s);
++	if (write(1, cp, 0) == -1) exit(0);
+ 	free(cp);
+ 	/*
+ 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index ec9e6613b0..ef530cc850 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,6 +13,9 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
+# 0001-better-detection-of-broken-fzero-call-used-regs.patch
+OPENSSH_AUTORECONF = YES
+
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \

--===============9111948416386156861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9111948416386156861==--

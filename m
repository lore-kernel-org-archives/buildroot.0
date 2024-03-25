Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50F6C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 09:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CA281E5F;
	Mon, 25 Mar 2024 09:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQ8-ErG7feDf; Mon, 25 Mar 2024 09:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1BB81E60
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D1BB81E60;
	Mon, 25 Mar 2024 09:06:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65F321BF370
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614DD81E58
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yr3e8yQUmCGB for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5B381E53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A5B381E53
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88ADE83DA9; Mon, 25 Mar 2024 09:06:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 09:55:46 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 747eb7172be510d9b39452778e5a455810ce8fa3
X-Git-Newrev: 11c8ff14990c8cf0b2cf7c4c63cad8f916dfba7b
X-Patchwork-Hint: ignore
Message-Id: <20240325090652.88ADE83DA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/openssh: bump to
 version 9.7p1
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
Content-Type: multipart/mixed; boundary="===============2868626518068145292=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2868626518068145292==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=11c8ff14990c8cf0b2cf7c4c63cad8f916dfba7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes - https://www.openssh.com/txt/release-9.7

Drop upstream patch - 001-better-detection-of-broken-fzero-call-used-regs.patch

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9496ff57e54c136d6961294aa2c5f8d560673ebf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-detection-of-broken-fzero-call-used-regs.patch | 57 ----------------------
 package/openssh/openssh.hash                       |  4 +-
 package/openssh/openssh.mk                         |  2 +-
 3 files changed, 3 insertions(+), 60 deletions(-)

diff --git a/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch b/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch
deleted file mode 100644
index 5c056033a9..0000000000
--- a/package/openssh/0001-better-detection-of-broken-fzero-call-used-regs.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 1036d77b34a5fa15e56f516b81b9928006848cbd Mon Sep 17 00:00:00 2001
-From: Damien Miller <djm@mindrot.org>
-Date: Fri, 22 Dec 2023 17:56:26 +1100
-Subject: [PATCH] better detection of broken -fzero-call-used-regs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc 13.2.0 on ppc64le refuses to compile some function, including
-cipher.c:compression_alg_list() with an error:
-
-> sorry, unimplemented: argument ‘used’ is not supportedcw
-> for ‘-fzero-call-used-regs’ on this target
-
-This extends the autoconf will-it-work test with a similarly-
-structured function that seems to catch this.
-
-Spotted/tested by Colin Watson; bz3645
-
-Upstream: https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f516b81b9928006848cbd.patch
-Signed-off-by: Brandon Maier <brandon.maier@collins.com>
----
- m4/openssh.m4 | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/m4/openssh.m4 b/m4/openssh.m4
-index 5d4c56280fc..033df501c3d 100644
---- a/m4/openssh.m4
-+++ b/m4/openssh.m4
-@@ -20,18 +20,24 @@ char *f2(char *s, ...) {
- 	va_end(args);
- 	return strdup(ret);
- }
-+const char *f3(int s) {
-+	return s ? "good" : "gooder";
-+}
- int main(int argc, char **argv) {
--	(void)argv;
- 	char b[256], *cp;
-+	const char *s;
- 	/* Some math to catch -ftrapv problems in the toolchain */
- 	int i = 123 * argc, j = 456 + argc, k = 789 - argc;
- 	float l = i * 2.1;
- 	double m = l / 0.5;
- 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
-+	(void)argv;
- 	f(1);
--	snprintf(b, sizeof b, "%d %d %d %f %f %lld %lld\n", i,j,k,l,m,n,o);
-+	s = f3(f(2));
-+	snprintf(b, sizeof b, "%d %d %d %f %f %lld %lld %s\n", i,j,k,l,m,n,o,s);
- 	if (write(1, b, 0) == -1) exit(0);
--	cp = f2("%d %d %d %f %f %lld %lld\n", i,j,k,l,m,n,o);
-+	cp = f2("%d %d %d %f %f %lld %lld %s\n", i,j,k,l,m,n,o,s);
-+	if (write(1, cp, 0) == -1) exit(0);
- 	free(cp);
- 	/*
- 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 618b13133d..58297aa694 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.4p1
-sha256  910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c  openssh-9.6p1.tar.gz
+# From https://www.openssh.com/txt/release-9.7
+sha256  490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd  openssh-9.7p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index ef530cc850..ce55253120 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.6
+OPENSSH_VERSION_MAJOR = 9.7
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)

--===============2868626518068145292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2868626518068145292==--

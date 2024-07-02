Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B313C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F1E81F99;
	Tue,  2 Jul 2024 06:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wx6GxTLUWh4E; Tue,  2 Jul 2024 06:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A99E281F8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A99E281F8D;
	Tue,  2 Jul 2024 06:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FD681BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AA47400C6
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn5WC451kKjO for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 063754140F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 063754140F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:51:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3579838A4; Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:49:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d64864ab209bc996470eb0f8f538b404ca946d8
X-Git-Newrev: 4ac2cc5beec0eac4991fb28f286707a5659fa67e
X-Patchwork-Hint: ignore
Message-Id: <20240702065131.E3579838A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump to version
 9.8p1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ac2cc5beec0eac4991fb28f286707a5659fa67e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2024-6387: Unauthenticated root login because of signal
handler race condition.

Drop upstream patch and autoreconf.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...ve-detection-of-fzero-call-used-regs-used.patch | 32 ----------------------
 package/openssh/openssh.hash                       |  4 +--
 package/openssh/openssh.mk                         |  5 +---
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch b/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch
deleted file mode 100644
index 1b91b15a79..0000000000
--- a/package/openssh/0001-Improve-detection-of-fzero-call-used-regs-used.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f9193f03db0029fc9c31fbdb5c66a2737446bd8f Mon Sep 17 00:00:00 2001
-From: Darren Tucker <dtucker@dtucker.net>
-Date: Mon, 25 Mar 2024 09:28:02 +1100
-Subject: [PATCH] Improve detection of -fzero-call-used-regs=used.
-
-Should better detect problems with gcc 13 on m68k.  bz#3673 from Colin
-Watson via bz#3673 and https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934
-
-Signed-off-by: Darren Tucker <dtucker@dtucker.net>
-Upstream: https://github.com/openssh/openssh-portable/commit/f9193f03db0029fc9c31fbdb5c66a2737446bd8f
----
- m4/openssh.m4 | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/m4/openssh.m4 b/m4/openssh.m4
-index 033df501c3d8..176a8d1c9282 100644
---- a/m4/openssh.m4
-+++ b/m4/openssh.m4
-@@ -20,7 +20,10 @@ char *f2(char *s, ...) {
- 	va_end(args);
- 	return strdup(ret);
- }
-+int i;
-+double d;
- const char *f3(int s) {
-+	i = (int)d;
- 	return s ? "good" : "gooder";
- }
- int main(int argc, char **argv) {
--- 
-2.43.0
-
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 58297aa694..44f9645035 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.7
-sha256  490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd  openssh-9.7p1.tar.gz
+# From https://www.openssh.com/txt/release-9.8
+sha256  dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3  openssh-9.8p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 5a568d5fd1..6d846f64df 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.7
+OPENSSH_VERSION_MAJOR = 9.8
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
@@ -13,9 +13,6 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
-# 0001-Improve-detection-of-fzero-call-used-regs-used.patch
-OPENSSH_AUTORECONF = YES
-
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

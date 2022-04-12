Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8C3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 10:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDF6460FF5;
	Tue, 12 Apr 2022 10:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1vJemv2yP_n; Tue, 12 Apr 2022 10:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1646C60FB4;
	Tue, 12 Apr 2022 10:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9031BF28A
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 10:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EB8982F6F
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 10:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5S-j59TO1WL for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 10:24:27 +0000 (UTC)
X-Greylist: delayed 00:05:03 by SQLgrey-1.8.0
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.18.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB5AC825E6
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 10:24:26 +0000 (UTC)
Received: from [84.146.220.100] (helo=exchange.go-sys.de)
 by smtprelay04.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1neDct-0002uz-HY
 for buildroot@busybox.net; Tue, 12 Apr 2022 12:19:59 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2375.24; Tue, 12
 Apr 2022 12:19:20 +0200
Received: from go-sys.de (192.168.1.138) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2375.24 via Frontend Transport;
 Tue, 12 Apr 2022 12:19:20 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Tue, 12 Apr 2022 12:19:19 +0200
Message-ID: <20220412101919.7454-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/openssh: bump to version 9.0p1
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
Cc: Michael Fischer <mf@go-sys.de>, Peter Seiderer <ps.report@gmx.net>,
 John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

patch 0001: already applied upstream
patch 0002: already applied upstream

https://www.openssh.com/txt/release-9.0

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...llow-ppoll_time64-in-seccomp-sandbox.patch | 32 ----------------
 ...n-of-fzero-call-used-regs-all-suppor.patch | 38 -------------------
 package/openssh/openssh.hash                  |  4 +-
 package/openssh/openssh.mk                    |  2 +-
 4 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
 delete mode 100644 package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch

diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
deleted file mode 100644
index 16eb6eaba2..0000000000
--- a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
-From: Darren Tucker <dtucker@dtucker.net>
-Date: Sat, 26 Feb 2022 14:06:14 +1100
-Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
-
-Should fix sandbox violations on (some? at least i386 and armhf) 32bit
-Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
-debian.org via bz#3396.
-
-[Upstream: https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch]
-Signed-off-by: John Keeping <john@metanate.com>
----
- sandbox-seccomp-filter.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
-index 2e065ba3..4ce80cb2 100644
---- a/sandbox-seccomp-filter.c
-+++ b/sandbox-seccomp-filter.c
-@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
- #ifdef __NR_ppoll
- 	SC_ALLOW(__NR_ppoll),
- #endif
-+#ifdef __NR_ppoll_time64
-+	SC_ALLOW(__NR_ppoll_time64),
-+#endif
- #ifdef __NR_poll
- 	SC_ALLOW(__NR_poll),
- #endif
--- 
-2.35.1
-
diff --git a/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch b/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch
deleted file mode 100644
index ce5c5539ff..0000000000
--- a/package/openssh/0002-Improve-detection-of-fzero-call-used-regs-all-suppor.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b5fee5fe98f708c1dc61a1564db35eacadbfe8b3 Mon Sep 17 00:00:00 2001
-From: Colin Watson <cjwatson@debian.org>
-Date: Thu, 24 Feb 2022 16:04:18 +0000
-Subject: [PATCH] Improve detection of -fzero-call-used-regs=all support
-
-GCC doesn't tell us whether this option is supported unless it runs into
-the situation where it would need to emit corresponding code.
-
-[Upstream: https://github.com/openssh/openssh-portable/commit/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- m4/openssh.m4 | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/m4/openssh.m4 b/m4/openssh.m4
-index 4f9c379..8c33c70 100644
---- a/m4/openssh.m4
-+++ b/m4/openssh.m4
-@@ -14,6 +14,8 @@ AC_DEFUN([OSSH_CHECK_CFLAG_COMPILE], [{
- 	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- #include <stdlib.h>
- #include <stdio.h>
-+/* Trivial function to help test for -fzero-call-used-regs */
-+void f(int n) {}
- int main(int argc, char **argv) {
- 	(void)argv;
- 	/* Some math to catch -ftrapv problems in the toolchain */
-@@ -21,6 +23,7 @@ int main(int argc, char **argv) {
- 	float l = i * 2.1;
- 	double m = l / 0.5;
- 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
-+	f(0);
- 	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
- 	/*
- 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
--- 
-2.35.1
-
diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index dd123c1bb6..4cfdb91484 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.9 (base64 encoded)
-sha256  fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7  openssh-8.9p1.tar.gz
+# From https://www.openssh.com/txt/release-9.0 (base64 encoded)
+sha256  03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a  openssh-9.0p1.tar.gz
 # Locally calculated
 sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 84add9563d..63a28f3af5 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 8.9
+OPENSSH_VERSION_MAJOR = 9.0
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

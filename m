Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D14C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12A684D32;
	Fri, 26 Jan 2024 08:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12A684D32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ceXOD2hov-w; Fri, 26 Jan 2024 08:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF5E684DCD;
	Fri, 26 Jan 2024 08:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF5E684DCD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDDF41BF98E
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34CB4367C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34CB4367C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urlxfHzwsnCF for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:29:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E75C402B1
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E75C402B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ADF9864F2; Fri, 26 Jan 2024 08:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:28:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bde468127c9d131de380d0dd2849527597ecf5e0
X-Git-Newrev: bb71ff12c691e98028d0123cc573a6c9817100d2
X-Patchwork-Hint: ignore
Message-Id: <20240126082958.3ADF9864F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: bump version to 1.2.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bb71ff12c691e98028d0123cc573a6c9817100d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed 0002-wscript-fix-build-without-stack-protector.patch
  (upstream applied, see [1])

- update license info according to upstream commit [2]
  (add Apache-2.0, Beerware, BSD-4-Clause and ISC, rename license
  file to end with '.txt' suffix)

See [3] for details.

[1] https://gitlab.com/NTPsec/ntpsec/-/commit/15862410de61d478a4b9aee5f5107889cfa9d125
[2] https://gitlab.com/NTPsec/ntpsec/-/commit/e29d66214116ae3679692e04982115863caa95b9
[3] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...wscript-fix-build-without-stack-protector.patch | 50 ----------------------
 package/ntpsec/ntpsec.hash                         | 16 ++++---
 package/ntpsec/ntpsec.mk                           | 26 ++++++++---
 4 files changed, 29 insertions(+), 64 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 914dd6fb63..55a55752a2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -922,7 +922,6 @@ package/ntp/0001-nano.patch Upstream
 package/ntp/0002-ntp-syscalls-fallback.patch Upstream
 package/ntp/S49ntp.in Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch Upstream
-package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch Upstream
 package/numactl/0001-link-with-latomic-if-needed-again.patch Upstream
 package/nuttcp/0001-susv3-legacy.patch Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch Upstream
diff --git a/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch b/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch
deleted file mode 100644
index f494bf479c..0000000000
--- a/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0a3ce09c14eb9c7e36aa30a4dafe40e56676d678 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 24 Feb 2023 11:33:32 +0100
-Subject: [PATCH] wscript: fix build without stack-protector
-
--fstack-protector-all can depends on ssp library availability (e.g. on musl) so
-move the test from cc_test_flags to ld_hardening_flags, this will avoid the
-following build failure:
-
-Checking for library ssp                 : not found
-Checking for library ssp_nonshared       : not found
-Checking if C compiler supports -fstack-protector-all : yes
-
-[...]
-
-The configuration failed
-(complete log in /home/autobuild/autobuild/instance-2/output-1/build/ntpsec-1_2_2/build/config.log)
-
-Fixes:
- - http://autobuild.buildroot.org/results/f38abc6b7f8464836231192cfe078a5b27319a8a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ntpsec/ntpsec/pull/6]
----
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index be396b33b..f301809fc 100644
---- a/wscript
-+++ b/wscript
-@@ -298,7 +298,6 @@ def configure(ctx):
-         ctx.env.LDFLAGS += ["-lssp_nonshared"]
- 
-     cc_test_flags = [
--        ('f_stack_protector_all', '-fstack-protector-all'),
-         ('PIC', '-fPIC'),
-         ('PIE', '-pie -fPIE'),
-         # this quiets most of macOS warnings on -fpie
-@@ -332,6 +331,7 @@ def configure(ctx):
- 
-     # Check which linker flags are supported
-     ld_hardening_flags = [
-+        ('f_stack_protector_all', '-fstack-protector-all'),
-         ("z_now", "-Wl,-z,now"),     # no deferred symbol resolution
-     ]
- 
--- 
-2.39.1
-
diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 8d98b5c411..a3802c11ba 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,8 +1,12 @@
 # Locally calculated
-sha256  ef901df5a05d486563db22f4d0dad3840a3bf5d0a9aceb8c3ecaeb396c67a805  ntpsec-NTPsec_1_2_2a.tar.bz2
-sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2
-sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3
-sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0
-sha256  074415b57c6ba1780483d89e55f40dec3ded96c28aaf47d63c486683ba553e7c  LICENSES/MIT
-sha256  62fec6cd79721af81b7c12f1a679535235fdd22800ab17653042f024187ff274  LICENSES/NTP
+sha256  a9ec4416688a1c1c88833f3f6acc35518e3d63409af372eec010455002b33050  ntpsec-NTPsec_1_2_3.tar.bz2
+sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
+sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
+sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
+sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3-Clause.txt
+sha256  c80d927f03db7212ba43a869a383e249c19b40859ff0d9e2e2f968e4fdcf005f  LICENSES/BSD-4-Clause.txt
+sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0.txt
+sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9  LICENSES/ISC.txt
+sha256  074415b57c6ba1780483d89e55f40dec3ded96c28aaf47d63c486683ba553e7c  LICENSES/MIT.txt
+sha256  62fec6cd79721af81b7c12f1a679535235fdd22800ab17653042f024187ff274  LICENSES/NTP.txt
 sha256  d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fadca3c0856  docs/copyright.adoc
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index f6262cdaca..661af78842 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,16 +4,28 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.2a
+NTPSEC_VERSION = 1.2.3
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
-NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
+NTPSEC_LICENSE = Apache-2.0, \
+	Beerware, \
+	BSD-2-Clause.txt, \
+	BSD-3-Clause.txt, \
+	BSD-4-Clause.txt, \
+	ISC.txt, \
+	MIT.txt, \
+	NTP.txt, \
+	CC-BY-4.0.txt (docs)
 NTPSEC_LICENSE_FILES = \
-	LICENSES/BSD-2 \
-	LICENSES/BSD-3 \
-	LICENSES/CC-BY-4.0 \
-	LICENSES/MIT \
-	LICENSES/NTP \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/Beerware.txt \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSD-4-Clause.txt \
+	LICENSES/ISC.txt \
+	LICENSES/MIT.txt \
+	LICENSES/NTP.txt \
+	LICENSES/CC-BY-4.0.txt \
 	docs/copyright.adoc
 
 NTPSEC_CPE_ID_VENDOR = ntpsec
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

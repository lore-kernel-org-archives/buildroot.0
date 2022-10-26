Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E38C67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0A181371;
	Thu, 27 Oct 2022 06:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0A181371
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVShSljW8yT7; Thu, 27 Oct 2022 06:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B5F8135C;
	Thu, 27 Oct 2022 06:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08B5F8135C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61CA61BF990
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C90B4090B
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C90B4090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZw7RsWQIlcm for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:45:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13B1740904
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B1740904
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3B3E872B2; Thu, 27 Oct 2022 06:45:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 23:30:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c86b69a16dee0281d75890118110be934367430e
X-Git-Newrev: b3f915c6561bcb2f7952faca3bedf1766f299538
X-Patchwork-Hint: ignore
Message-Id: <20221027064525.F3B3E872B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmemd: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b3f915c6561bcb2f7952faca3bedf1766f299538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kmemd let's you inspect a live Linux kernel's memory using GDB.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/kmemd/Config.in  | 20 ++++++++++++++++++++
 package/kmemd/kmemd.hash |  3 +++
 package/kmemd/kmemd.mk   | 20 ++++++++++++++++++++
 5 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e0b765ba1..bc4640685a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2936,6 +2936,9 @@ F:	package/waf/
 F:	support/testing/tests/package/test_crudini.py
 F:	support/testing/tests/package/test_redis.py
 
+N:	Tobias Waldekranz <tobias@waldekranz.com>
+F:	package/kmemd/
+
 N:	Tudor Holton <buildroot@tudorholton.com>
 F:	package/openjdk/
 
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..ebafe11dea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -111,6 +111,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
+	source "package/kmemd/Config.in"
 	source "package/kvm-unit-tests/Config.in"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
diff --git a/package/kmemd/Config.in b/package/kmemd/Config.in
new file mode 100644
index 0000000000..902e636947
--- /dev/null
+++ b/package/kmemd/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_KMEMD
+	bool "kmemd"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libbpf
+	depends on BR2_USE_WCHAR # libbpf
+	depends on !BR2_STATIC_LIBS # libbpf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libbpf
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # libbpf
+	select BR2_PACKAGE_LIBBPF
+	help
+	  Explore a live Linux kernel's memory using GDB
+
+	  https://github.com/wkz/kmemd
+
+comment "kmemd needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/kmemd/kmemd.hash b/package/kmemd/kmemd.hash
new file mode 100644
index 0000000000..aecfea57f8
--- /dev/null
+++ b/package/kmemd/kmemd.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  519ac3cdd367acee5090eec3b7e08400724f9b84486b191f3af534bd7cffca70  kmemd-1.0.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kmemd/kmemd.mk b/package/kmemd/kmemd.mk
new file mode 100644
index 0000000000..902941b981
--- /dev/null
+++ b/package/kmemd/kmemd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# kmemd
+#
+################################################################################
+
+KMEMD_VERSION = 1.0.0
+KMEMD_SITE = https://github.com/wkz/kmemd/releases/download/$(KMEMD_VERSION)
+KMEMD_LICENSE = GPL-2.0
+KMEMD_LICENSE_FILES = COPYING
+KMEMD_DEPENDENCIES = libbpf
+
+define KMEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FTRACE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KPROBES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS)
+endef
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

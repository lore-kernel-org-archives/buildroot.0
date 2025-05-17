Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F752C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7585D70F6F;
	Mon, 19 May 2025 11:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvV5UMcllr3P; Mon, 19 May 2025 11:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3677B70F76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3677B70F76;
	Mon, 19 May 2025 11:02:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6490CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C0A411E3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw8ED53Tz-Sb for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A914841DD8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A914841DD8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A736B83BC0; Mon, 19 May 2025 10:40:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:07:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f93e0ec5850402b2cc0478e864223019277ecc79
X-Git-Newrev: 5cfe10ffb26f5b250fdbce3b1b0a692346349571
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.A736B83BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/refpolicy: bump to
 version 2.20250213
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cfe10ffb26f5b250fdbce3b1b0a692346349571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch (found in an upstream PR) to avoid the following error when
the dbus module is not enabled:

   ```
   policy/modules/system/selinuxutil.te:102:ERROR 'attribute
   dbusd_system_bus_client is not within scope' at token ';'
   on line 155976:
   ```

Remove the patch 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
(upstream commit 65eed16b58015b08f43a096c202dae6cba2f0a37).

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout:
 - Add patch to fix dbus issue.
 - Remove dbus from default modules again.
 - Remove the existing patch which is applied upstream.
]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 ...les-services-smartmon.te-make-fstools-opt.patch | 44 ----------------------
 ...-building-when-dbus-module-is-not-enabled.patch | 40 ++++++++++++++++++++
 package/refpolicy/refpolicy.hash                   |  2 +-
 package/refpolicy/refpolicy.mk                     |  2 +-
 4 files changed, 42 insertions(+), 46 deletions(-)

diff --git a/package/refpolicy/2.20231002/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch b/package/refpolicy/2.20231002/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
deleted file mode 100644
index ddf2943bfa..0000000000
--- a/package/refpolicy/2.20231002/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c6d1345732c463cb45d8ba490081ad92936bfd69 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 28 Nov 2023 22:30:01 +0100
-Subject: [PATCH] policy/modules/services/smartmon.te: make fstools optional
-
-Make fstools optional to avoid the following build failure raised since
-version 2.20231002 and
-https://github.com/SELinuxProject/refpolicy/commit/cb068f09d224f90a97fa63a574fb423bbe1ceeda:
-
- Compiling targeted policy.33
- env LD_LIBRARY_PATH="/home/thomas/autobuild/instance-2/output-1/host/lib:/home/thomas/autobuild/instance-2/output-1/host/usr/lib" /home/thomas/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
- policy/modules/services/smartmon.te:146:ERROR 'type fsadm_exec_t is not within scope' at token ';' on line 237472:
- 	allow smartmon_update_drivedb_t fsadm_exec_t:file { { getattr open map read execute ioctl } ioctl lock execute_no_trans };
- #line 146
- checkpolicy:  error(s) encountered while parsing configuration
- make[1]: *** [Rules.monolithic:80: policy.33] Error 1
-
-Fixes:
- - http://autobuild.buildroot.org/results/a01123de9a8c1927060e7e4748666bebfc82ea44
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/SELinuxProject/refpolicy/pull/738
----
- policy/modules/services/smartmon.te | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/policy/modules/services/smartmon.te b/policy/modules/services/smartmon.te
-index 32c80f712..761280c11 100644
---- a/policy/modules/services/smartmon.te
-+++ b/policy/modules/services/smartmon.te
-@@ -143,7 +143,9 @@ corenet_tcp_connect_http_port(smartmon_update_drivedb_t)
- 
- files_read_etc_files(smartmon_update_drivedb_t)
- 
--fstools_exec(smartmon_update_drivedb_t)
-+optional_policy(`
-+	fstools_exec(smartmon_update_drivedb_t)
-+')
- 
- kernel_dontaudit_read_system_state(smartmon_update_drivedb_t)
- 
--- 
-2.42.0
-
diff --git a/package/refpolicy/2.20250213/0001-fix-building-when-dbus-module-is-not-enabled.patch b/package/refpolicy/2.20250213/0001-fix-building-when-dbus-module-is-not-enabled.patch
new file mode 100644
index 0000000000..4ac9725961
--- /dev/null
+++ b/package/refpolicy/2.20250213/0001-fix-building-when-dbus-module-is-not-enabled.patch
@@ -0,0 +1,40 @@
+From eff537f7be038120ca06fc7c39f9817ae120ce00 Mon Sep 17 00:00:00 2001
+From: Dave Sugar <dsugar100@gmail.com>
+Date: Thu, 15 May 2025 10:05:24 -0400
+Subject: [PATCH] fix building when dbus module is not enabled
+
+Signed-off-by: Dave Sugar <dsugar100@gmail.com>
+Upstream: https://github.com/SELinuxProject/refpolicy/pull/908
+Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
+---
+ policy/modules/system/selinuxutil.te | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/policy/modules/system/selinuxutil.te b/policy/modules/system/selinuxutil.te
+index 86a6e5503..cd0e8762f 100644
+--- a/policy/modules/system/selinuxutil.te
++++ b/policy/modules/system/selinuxutil.te
+@@ -99,7 +99,8 @@ role run_init_roles types run_init_t;
+ 
+ type selinux_dbus_t;
+ type selinux_dbus_exec_t;
+-dbus_system_domain(selinux_dbus_t, selinux_dbus_exec_t)
++domain_type(selinux_dbus_t)
++domain_entry_file(selinux_dbus_t, selinux_dbus_exec_t)
+ 
+ type semanage_t;
+ type semanage_exec_t;
+@@ -504,6 +505,10 @@ miscfiles_read_localization(selinux_dbus_t)
+ 
+ seutil_domtrans_semanage(selinux_dbus_t)
+ 
++optional_policy(`
++	dbus_system_domain(selinux_dbus_t, selinux_dbus_exec_t)
++')
++
+ optional_policy(`
+ 	policykit_dbus_chat(selinux_dbus_t)
+ ')
+-- 
+2.49.0
+
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 5e876d4a43..76bbf482ae 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  7ed41f4f45189b9ee9706da8ac357eccc103651b56daabaddb54c436e8117cf9  refpolicy-2.20240226.tar.bz2
+sha256  d2487c49420e8710e999b18bbe699fbff033fe5adc5127e3f0c7dafaa9b4d209  refpolicy-2.20250213.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 74ccb79624..be27147ec5 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20240226
+REFPOLICY_VERSION = 2.20250213
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17871E8B365
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3423403F5;
	Tue,  3 Feb 2026 21:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZSzHawx1DHv; Tue,  3 Feb 2026 21:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF8EA4046C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154370;
	bh=jK3QPUIR1c4MHBstQgAyjyH6BF4nN/Dr41bMft/13CM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=avFUGBVBd2GOjOzfZWkTKER4gQUleFUIA6UZfGzE3FaOMkMiXF6gQ0Kaog7iEETag
	 6eRk7hPhEAu9ft47SGUm1Ij3NvbARCwcVC7jJyli1UdJItxef1PdjPVtegonspum9s
	 Y2gLpMsoSc0miQ8l7/GIF0+QR/y6yIDTeDnHwUjqiAVoXKbMRNJk2ijXPhQvJTWs3g
	 TpBttGH3ELpCLR/MAKco1fGhHWg4+VHL4KwC/c6Ba1xB/YUbEZVzXJZ0YUbXidZanL
	 PZ76TYs8yCisiPdXq73X6b901VU+lFEuMEHETe9wO2sQB2xgcwC1AMz1uhlPU7XQWS
	 7wB8xVoRcA3eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF8EA4046C;
	Tue,  3 Feb 2026 21:32:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C73C81A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A734F82C3E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOPoNDw2lsBK for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6A5F82B3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6A5F82B3E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF83B86740; Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 22:12:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c104b7f0bb670274408353c9f35fe2153d6822d
X-Git-Newrev: 49e7a554f2814e324b96db45daf8856ea7da0804
X-Patchwork-Hint: ignore
Message-Id: <20260203213244.BF83B86740@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: make apps selectable
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49e7a554f2814e324b96db45daf8856ea7da0804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_PACKAGE_DPDK_APPS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all apps (-Ddisable_apps='*')
  - list  : pass to -Denable_apps= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 4e83f293ae..b658145e5b 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -85,6 +85,27 @@ config BR2_PACKAGE_DPDK_LIBS_LIST
 	  Buildroot packages for external dependencies. DPDK
 	  configuration will fail in case of missing dependencies.
 
+config BR2_PACKAGE_DPDK_APPS_LIST
+	string "List of enabled applications"
+	help
+	  Controls which DPDK applications are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no apps
+	    list   : e.g. "test-cmdline,test-pmd"
+
+	  To list all applications found in the DPDK source tree:
+	    find app -mindepth 2 -maxdepth 2 -type f -name meson.build \
+	      -printf '%h\n' | xargs -n1 basename | sort -u
+
+	  Note: providing manually a list of dpdk libraries to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index d0c7caaa48..080f924329 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -65,6 +65,15 @@ ifneq ($(DPDK_LIBS),)
   endif
 endif
 
+DPDK_APPS := $(call qstrip,$(BR2_PACKAGE_DPDK_APPS_LIST))
+ifneq ($(DPDK_APPS),)
+  ifeq ($(DPDK_APPS),none)
+    DPDK_CONF_OPTS += -Ddisable_apps='*'
+  else
+    DPDK_CONF_OPTS += -Denable_apps='$(DPDK_APPS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

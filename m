Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DB8E8B366
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E4366087F;
	Tue,  3 Feb 2026 21:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuPMtkEZ68fX; Tue,  3 Feb 2026 21:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3640E608A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154367;
	bh=kqmhKmD0Ak1oKTDv2b+1TTLWtPnBOVTlLdg2f/+bVwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ae7WlALa5jSONmTYIYVJCB+6KF0rzdCkUxa9yK0DXrtQNWDKlsVjVxPdzGwtthRU4
	 BxReFe7YEeNmJElCAuAwR9siaX8igIot1QVValjKkJwaS4hJo6kAv9nMELuJYHNaqv
	 uGiXeIduGuQjuRW9xVLGiLMjDg1nGhmQAhT7nx1wN2onsxV9kA083q2V/g2Dci9zqe
	 NgpKk58u9F0+Qkkj1GkvNMZCxHu1x67e7ED9CLGQk5czyAwUAvJ9sySzPj0IdPh6HH
	 HCXLuVU/NKHVOMXwdmUkihUFS6UvOJxZ13BeGv9UNL0gy+9/gaKFlCNZK3bFVXkXM8
	 3XzoJgpTUv5LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3640E608A3;
	Tue,  3 Feb 2026 21:32:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C19C7F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3BA3608A3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnAq_kIcZHue for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBA6E6087F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBA6E6087F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4A8E819A0; Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 22:12:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73a16fe1d3947e6970e20b6edc2c7ccabc3c9ec1
X-Git-Newrev: 5c104b7f0bb670274408353c9f35fe2153d6822d
X-Patchwork-Hint: ignore
Message-Id: <20260203213244.B4A8E819A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: make libraries selectable
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c104b7f0bb670274408353c9f35fe2153d6822d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_PACKAGE_DPDK_LIBS_LIST to control which DPDK libraries are
built:
  - empty : use DPDK defaults
  - none  : disable all libs (-Ddisable_libs='*')
  - list  : pass to -Denable_libs= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 36876e349d..4e83f293ae 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -64,6 +64,27 @@ config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	  Buildroot packages for external dependencies. DPDK
 	  configuration will fail in case of missing dependencies.
 
+config BR2_PACKAGE_DPDK_LIBS_LIST
+	string "List of enabled libraries"
+	help
+	  Controls which DPDK libraries are built.
+
+	  Values:
+	    (empty): use DPDK defaults
+	    none   : build no libraries
+	    list   : e.g. "hash,fib,rib"
+
+	  To list all libraries found in the DPDK source tree:
+	    find lib -mindepth 2 -maxdepth 2 -type f -name meson.build \
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
index 829b0cc640..d0c7caaa48 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -56,6 +56,15 @@ ifneq ($(DPDK_DRIVERS),)
   endif
 endif
 
+DPDK_LIBS := $(call qstrip,$(BR2_PACKAGE_DPDK_LIBS_LIST))
+ifneq ($(DPDK_LIBS),)
+  ifeq ($(DPDK_LIBS),none)
+    DPDK_CONF_OPTS += -Ddisable_libs='*'
+  else
+    DPDK_CONF_OPTS += -Denable_libs='$(DPDK_LIBS)'
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448D9EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 139B084589;
	Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQhwX4MDSQks; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E3C2845A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011421;
	bh=WI0EgqlbzWUM57gHf0BsJfPs4I6W8Gi7/le6PN9ajWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZHZBTduNJG33F8mFBu0sOKw0OrHBwtAuU6LJC2Fzyhdt1FrGfFPPYsnXa/B/wB8ZI
	 f1PJFqp09YMi2/KBpaQMJ2t4xNUNMJXQRj1l991npLZhLRCgY940r3In5o2prs7/F1
	 BRvgs5XgHJ0NSyXBImuOQhRv4ShYdQFCwpfQrI8dm1uy9+8oxxZ63LF7+lN50L1UoF
	 KCCCqkFsSG25rNv/K8lwxN6vKel7B2uPFIy8vAETNY3yvizb+SXtXzFCnSDn0frsxQ
	 fHJW4HQRzra+V9TZ1/qGjzlpfUC1608t1KqJWQ6Z1Y7QISJcXQjq7q+bnErdE9OIis
	 EG/z2rM+Fgxlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E3C2845A6;
	Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD83283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDD2484561
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cR_8VD1iZAMU for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272E684539
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 272E684539
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C11782233; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:18 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 360dd126f6c9fd0a2a403f01f7ca735119397eca
X-Git-Newrev: b70b6a5ac46570e6afa73a0c66eba75300f64e20
X-Patchwork-Hint: ignore
Message-Id: <20260213193530.1C11782233@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swig: add
 host-swig wrapper script
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b70b6a5ac46570e6afa73a0c66eba75300f64e20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Swig has a compiled in absolute path to its data files, which can be
overridden using the SWIG_LIB environment variable:

https://github.com/swig/swig/blob/v4.1.1/Source/Modules/main.cxx#L931-L945

This unfortunately means that host-swig misbehaves when used in the SDK, as
this points to the ${HOST_DIR}/bin of the build, which may not be available
when the SDK is used.

The issue was reported upstream but rejected in
https://github.com/swig/swig/issues/253, so instead add a wrapper script
which calculates a sensible SWIG_LIB relative to the wrapper location unless
SWIG_LIB is set, similar to how we do it for E.G. gcc or pkgconf.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: add quotes to make shellcheck happy]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 20d5e36fe86322fa93b285bbe2c658f163368423)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/swig/swig-wrapper.in |  8 ++++++++
 package/swig/swig.mk         | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
new file mode 100644
index 0000000000..61c885fc90
--- /dev/null
+++ b/package/swig/swig-wrapper.in
@@ -0,0 +1,8 @@
+#!/bin/sh
+# wrapper to make swig relocatable
+
+if [ -z "${SWIG_LIB}" ]; then
+    export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
+fi
+
+exec "${0}.br_real" "$@"
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index ad585c3f97..71e5e05f96 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -15,6 +15,21 @@ HOST_SWIG_CONF_OPTS = \
 SWIG_LICENSE = GPL-3.0+, BSD-2-Clause, BSD-3-Clause
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
+# Swig has a compiled in absolute path to its data files, so it does
+# not work when copied somewhere else for the SDK. Issue was reported
+# upstream but rejected in https://github.com/swig/swig/issues/253 so
+# instead add a wrapper to work around this
+
+define HOST_SWIG_INSTALL_WRAPPER
+	mv -f $(HOST_DIR)/bin/swig $(HOST_DIR)/bin/swig.br_real
+	$(INSTALL) -m 0755 -D package/swig/swig-wrapper.in \
+		$(HOST_DIR)/bin/swig
+	$(SED) 's,@SWIG_VERSION@,$(SWIG_VERSION),g' \
+		$(HOST_DIR)/bin/swig
+endef
+
+HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
+
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
 # when doing the search, it will look into the PATH for swig2.0 first,
 # and then for swig.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

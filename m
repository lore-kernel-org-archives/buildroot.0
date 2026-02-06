Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C1EE6B44
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 17:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD4940903;
	Fri,  6 Feb 2026 17:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sn8KtvlwKXXb; Fri,  6 Feb 2026 17:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9BB740938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770399418;
	bh=r3d57Bn9Ck/YRRE056N5YP47QHLMLbPv9MEruBZcrkY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kCWEYaU4QWIu1wssLB93CKnsmH3r25VbC2nc2H2OuxktyoTpCJelCXNE5h7iT5Y0d
	 yDElvgJNc4nWDdnD75AphytEeg28W4JUJkWHyfHcwDpmMHYcRpfnVXTNXe7xNqVrco
	 BDjw5b15YEPBw15X6pmDZFNgBFYn8J6ZF4umHUn0To3MfTIz2anAn5moF6+yKt0coz
	 JDipwkPa7o60VqH7b52tufbrw//RVDHenol5QR9q2SOpJ+ktPWPNAuglEJeWu7Lua0
	 zNA6U9eaujZCBH3D6WFuJB5IhcZbCccb1LJMGTO3fVCTbEStBXscv6WUxSwlvIrSxu
	 CBsFZylQzXDzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9BB740938;
	Fri,  6 Feb 2026 17:36:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDB432EB
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF21461127
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhcZk4geWDdQ for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 17:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCC3D61125
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCC3D61125
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:36:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EC0986A8E; Fri,  6 Feb 2026 17:36:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 18:36:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: febdbea58be3b5c25b1673d8457fa933b9cb812a
X-Git-Newrev: 20d5e36fe86322fa93b285bbe2c658f163368423
X-Patchwork-Hint: ignore
Message-Id: <20260206173656.9EC0986A8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swig: add host-swig wrapper script
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20d5e36fe86322fa93b285bbe2c658f163368423
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

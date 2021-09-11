Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E956C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:49:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F0161152
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52F0161152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E29404EF;
	Sat, 11 Sep 2021 19:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuG-e-fgbi_S; Sat, 11 Sep 2021 19:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A29407E3;
	Sat, 11 Sep 2021 19:49:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBC461BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2542407E3
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6YRXZRql3HuH for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:49:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6158404E9
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:49:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4397089132; Sat, 11 Sep 2021 19:47:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 20:59:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1c4eeab73de03bb4cbc1786c7be99613bc33e50
X-Git-Newrev: 79c6f25c0264ea68faf3f395f04deb69a0d6e7c9
X-Patchwork-Hint: ignore
Message-Id: <20210911194747.4397089132@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/gobject-introspection/g-ir-scanner.in: Fix shellcheck warnings,
 switch to sh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79c6f25c0264ea68faf3f395f04deb69a0d6e7c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gobject-introspection/g-ir-scanner.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
index 22df7be309..013eb15700 100644
--- a/package/gobject-introspection/g-ir-scanner.in
+++ b/package/gobject-introspection/g-ir-scanner.in
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+#!/usr/bin/env sh
 
 # These environment variables are empty by default, and as such ccompiler.py
 # defaults to either using the system tools (CC, CXX, and CPP) or leaving
@@ -15,8 +15,8 @@ export LDFLAGS="${LDFLAGS:-@TARGET_LDFLAGS@}"
 
 export GI_SCANNER_DISABLE_CACHE=1
 
-${HOST_DIR}/bin/g-ir-scanner \
---lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
---use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
---use-ldd-wrapper=$(dirname $0)/g-ir-scanner-lddwrapper \
---add-include-path=$(dirname $0)/../share/gir-1.0 "$@"
+"${HOST_DIR}"/bin/g-ir-scanner \
+    --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
+    --use-binary-wrapper="$(dirname "$0")"/g-ir-scanner-qemuwrapper \
+    --use-ldd-wrapper="$(dirname "$0")"/g-ir-scanner-lddwrapper \
+    --add-include-path="$(dirname "$0")"/../share/gir-1.0 "$@"
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

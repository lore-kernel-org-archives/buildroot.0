Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC60C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:56:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A4961059
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86A4961059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2821082695;
	Sat, 11 Sep 2021 18:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuQ2U-B6hjZJ; Sat, 11 Sep 2021 18:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BC2A824DC;
	Sat, 11 Sep 2021 18:56:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B95C1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77FC7400FC
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDL0ApV3m2Gh for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 18:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E38B4401B0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 59CD5890FE; Sat, 11 Sep 2021 18:54:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 20:50:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97ab9ffa735c8e82a6ce05c68dade5bd13713a0e
X-Git-Newrev: e1c4eeab73de03bb4cbc1786c7be99613bc33e50
X-Patchwork-Hint: ignore
Message-Id: <20210911185400.59CD5890FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] g-ir-scanner-qemuwrapper.in: Fix
 shellcheck warnings, switch to sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1c4eeab73de03bb4cbc1786c7be99613bc33e50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add double quotes to prevent globbing and word splitting.
  - Add indentations of continuation lines.
  - Disable SC2181 and SC2016 as we explicitly do not want the variables
    expanded in the echo.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../gobject-introspection/g-ir-scanner-qemuwrapper.in    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
index c76553515e..85f0750b4d 100644
--- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -1,19 +1,21 @@
-#!/usr/bin/env bash
+#!/usr/bin/env sh
 
 GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
 
-# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
+# Pass -r to qemu-user as to trick glibc into not erroring out if the host kernel
 # is older than the target kernel.
 # Use a modules directory which does not exist so we don't load random things
 # which may then get deleted (or their dependencies) and potentially segfault
-GIO_MODULE_DIR=$(dirname $0)/../lib/gio/modules-dummy \
+GIO_MODULE_DIR="$(dirname "$0")/../lib/gio/modules-dummy" \
 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
--L $(dirname $0)/../../ \
--E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
-"$@"
+    -L "$(dirname "$0")/../../" \
+    -E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
+    "$@"
 
-if [[ $? -ne 0 ]]; then
+# shellcheck disable=SC2181
+if [ $? -ne 0 ]; then
     echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help."
+    # shellcheck disable=SC2016
     echo 'Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"'
     exit 1
 fi
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

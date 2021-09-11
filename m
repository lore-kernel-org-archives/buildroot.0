Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF7FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7DA61152
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB7DA61152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85E798267C;
	Sat, 11 Sep 2021 19:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZObw6PtBhnWv; Sat, 11 Sep 2021 19:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07C781B36;
	Sat, 11 Sep 2021 19:49:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D41051BF958
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C39D360624
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGlbDuAmYitT for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:49:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F240260620
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:49:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4E1A689135; Sat, 11 Sep 2021 19:47:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 20:59:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79c6f25c0264ea68faf3f395f04deb69a0d6e7c9
X-Git-Newrev: 6df4c37bce222ed8dbc4f708b286ae8e35187c45
X-Patchwork-Hint: ignore
Message-Id: <20210911194747.4E1A689135@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/gobject-introspection/g-ir-scanner-lddwrapper.in: Fix shellcheck
 warnings, switch to sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=6df4c37bce222ed8dbc4f708b286ae8e35187c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gobject-introspection/g-ir-scanner-lddwrapper.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
index c19314566a..2f09bca77a 100644
--- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
@@ -1,3 +1,3 @@
-#!/usr/bin/env bash
+#!/usr/bin/env sh
 
-${HOST_DIR}/sbin/prelink-rtld --root=$(dirname $0)/../../ "$@"
+"${HOST_DIR}"/sbin/prelink-rtld --root="$(dirname "$0")/../../" "$@"
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

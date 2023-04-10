Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4FFC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94EF402D9;
	Mon, 10 Apr 2023 21:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94EF402D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqoh-BL4KnoS; Mon, 10 Apr 2023 21:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EFB9402D4;
	Mon, 10 Apr 2023 21:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFB9402D4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1982A1BF255
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F7C040993
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F7C040993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83IE8o4qNqZQ for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:13:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA2A2405A2
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA2A2405A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4DA683E5C; Mon, 10 Apr 2023 21:13:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:43:11 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f7c17b3e026c832bb57272df2d88e8ed2a6384c7
X-Git-Newrev: 2689e6974a9b3e07c8fd8fb002ad4a22ddf3eadf
X-Patchwork-Hint: ignore
Message-Id: <20230410211317.A4DA683E5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/containerd:
 security bump to version 1.6.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=2689e6974a9b3e07c8fd8fb002ad4a22ddf3eadf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Various bugfixes and improvements. Noteable security fixes:

- CVE-2023-25153: Fix OCI image importer memory exhaustion
  https://github.com/containerd/containerd/security/advisories/GHSA-259w-8hf6-59c2

- CVE-2023-25173: Fix supplementary groups not being set up properly
  https://github.com/containerd/containerd/security/advisories/GHSA-hmfx-3pcx-653p

https://github.com/containerd/containerd/releases/tag/v1.6.20

Signed-off-by: Stefan Agner <stefan@agner.ch>
[Peter: add CVE references]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8bf66c5640c0fafd63dbacadeeb6ac3a9f4f26a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 16474089d1..65a87f25fa 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  e0a893cf67df9dfaecbcde2ba4e896efb3a86ffe48dcfe0d2b26f7cf19b5af3a  containerd-1.6.16.tar.gz
+sha256  819086ccdca44cfc5f108e226c7a9294d8fad3eb32031a621623da80dedbfb11  containerd-1.6.20.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 4a0d6ec38b..bc1dd58611 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.16
+CONTAINERD_VERSION = 1.6.20
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02826C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0CD341779;
	Wed,  5 Jun 2024 21:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BP125dQJ7wor; Wed,  5 Jun 2024 21:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9861741785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9861741785;
	Wed,  5 Jun 2024 21:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5651BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70FCF610FA
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNA4IV5tIsdD for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E8560EE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5E8560EE2
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:54:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FF2787BC3; Wed,  5 Jun 2024 21:54:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 23:31:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6ee0ea47c1dddcafa41a00cb99790321fb60e3f
X-Git-Newrev: 68fd0009e377181ade06cce3bff1a89d548542e5
X-Patchwork-Hint: ignore
Message-Id: <20240605215430.9FF2787BC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: use appropriate TAR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68fd0009e377181ade06cce3bff1a89d548542e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout: quote TAR="..."]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/flutter-engine/flutter-engine.mk | 1 +
 package/flutter-engine/gen-tarball       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d9c2b3dee5..dfc3c03ef9 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -176,6 +176,7 @@ endif
 
 # Generate a tarball if one does not already exist.
 define FLUTTER_ENGINE_GENERATE_TARBALL
+	TAR="$(TAR)" \
 	PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
 	PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
index 2d2117b9be..23b121d1f9 100755
--- a/package/flutter-engine/gen-tarball
+++ b/package/flutter-engine/gen-tarball
@@ -70,7 +70,7 @@ gen_tarball() {
     # - it insists on having a full git repositoy, with .git et al., which means
     #   we can't generate a reproducible archive anyway.
     # So we jsut create a plain tarball.
-    tar -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
+    ${TAR} -C "${SCRATCH_DIR}"/src -czf "${TARBALL_NAME}" .
     mv "${TARBALL_NAME}" "${TARBALL_DL_PATH}"
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

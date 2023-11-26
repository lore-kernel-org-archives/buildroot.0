Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD99C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CF760BEF;
	Sun, 26 Nov 2023 21:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8CF760BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWQfJ94__bcy; Sun, 26 Nov 2023 21:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDAD60671;
	Sun, 26 Nov 2023 21:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DDAD60671
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67F161BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4103B60671
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4103B60671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_FDX-MJJV_q for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:35:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B6176060A
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B6176060A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48FB487431; Sun, 26 Nov 2023 21:35:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 22:34:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8ca87083b9ff7d6d196520b85533cd927369ca9
X-Git-Newrev: 3e76df02b324b0442eec7bfd2451ee2fbb3709e9
X-Patchwork-Hint: ignore
Message-Id: <20231126213554.48FB487431@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-pico: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e76df02b324b0442eec7bfd2451ee2fbb3709e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c9138c32157042aa5bb1bfd3a8446e4c9361d0f5/

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libzenoh-pico/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
index 093c6d4f75..cb61b0de55 100644
--- a/package/libzenoh-pico/Config.in
+++ b/package/libzenoh-pico/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBZENOH_PICO
 	bool "libzenoh-pico"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  zenoh-pico is the Eclipse zenoh implementation that targets
 	  constrained devices and offers a native C API. It is fully
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF274C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7081F40492;
	Fri,  1 Dec 2023 20:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7081F40492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FbvBLNNNPih; Fri,  1 Dec 2023 20:24:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71028404A0;
	Fri,  1 Dec 2023 20:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71028404A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3F411BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C7C8421FE
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C7C8421FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id an929AxRZEy1 for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:24:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C607B421E5
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C607B421E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A550E87768; Fri,  1 Dec 2023 20:24:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 21:18:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67cb7d8d093f57339e622e1f1f5a40d5013194f1
X-Git-Newrev: 89e6b474ea00a62ce95754058eafd390d31b39fa
X-Patchwork-Hint: ignore
Message-Id: <20231201202402.A550E87768@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-pico: add threads comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=89e6b474ea00a62ce95754058eafd390d31b39fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3e76df02b324b0442eec7bfd2451ee2fbb3709e9 forgot to add a comment
about threads dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libzenoh-pico/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
index cb61b0de55..5f7e91c9f6 100644
--- a/package/libzenoh-pico/Config.in
+++ b/package/libzenoh-pico/Config.in
@@ -9,3 +9,6 @@ config BR2_PACKAGE_LIBZENOH_PICO
 	  functionalities.
 
 	  https://github.com/eclipse-zenoh/zenoh-pico
+
+comment "libzenoh-pico needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

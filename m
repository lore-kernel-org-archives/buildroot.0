Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD9DC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 13:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F4C41743;
	Sat, 18 Nov 2023 13:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2F4C41743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pQ9inTJ2WwU; Sat, 18 Nov 2023 13:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15A7641559;
	Sat, 18 Nov 2023 13:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A7641559
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9DB1BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FDD6403C4
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDD6403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-17yBPz32hj for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 13:47:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C320400DD
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 13:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C320400DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AA2E86CC7; Sat, 18 Nov 2023 13:47:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 14:47:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 439c9516e84976741db84f233b9c2816fe1c9b06
X-Git-Newrev: 38923639b0aff90d8a179234cd9b3bd6d85d8121
X-Patchwork-Hint: ignore
Message-Id: <20231118134754.5AA2E86CC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-sdk-bin: add target-os as
 linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=38923639b0aff90d8a179234cd9b3bd6d85d8121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We build for Linux.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 17cd3523a6..e8e71b6ab0 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -77,6 +77,7 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	-Ddart.vm.product=$(HOST_FLUTTER_SDK_BIN_SDK_PRODUCT) \
 	--aot \
 	--tfa \
+	--target-os linux \
 	--packages .dart_tool/package_config.json \
 	--output-dill .dart_tool/flutter_build/*/app.dill \
 	--depfile .dart_tool/flutter_build/*/kernel_snapshot.d
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

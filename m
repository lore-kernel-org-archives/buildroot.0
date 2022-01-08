Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498CCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C087B60B1B;
	Sat,  8 Jan 2022 13:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjE_-bpe5dZK; Sat,  8 Jan 2022 13:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39AE260B22;
	Sat,  8 Jan 2022 13:41:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE981BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7742B400D3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skz1-BX2g0wH for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:41:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E1E400CF
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4174882A92; Sat,  8 Jan 2022 13:34:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 14:40:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6f0e1e58168dfa9194db2e073efd20a98c15728
X-Git-Newrev: d5ecbffe61594ea572da18d1550a7cbdc28b7e1d
X-Patchwork-Hint: ignore
Message-Id: <20220108133456.4174882A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: add !BR2_STATIC_LIBS
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5ecbffe61594ea572da18d1550a7cbdc28b7e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It should have been inherited from libexecinfo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libest/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index 7ba2f32c09..d8271ad69e 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -1,5 +1,9 @@
+comment "libest needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LIBEST
 	bool "libest"
+	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

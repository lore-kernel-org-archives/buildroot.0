Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91F8C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47B6C40CAF;
	Wed, 17 Aug 2022 06:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B6C40CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHBnGK9dl3zP; Wed, 17 Aug 2022 06:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64BF24051D;
	Wed, 17 Aug 2022 06:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64BF24051D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 023C81BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1BB861054
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1BB861054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpVtU4aoo0Xz for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:41:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1232E60AB0
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1232E60AB0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C557787956; Wed, 17 Aug 2022 06:26:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 07:42:26 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c6720de9c0b02c9923574457a6896aa55068083c
X-Git-Newrev: a8c67ea5d18f30cc6e14a10fa83a66312af9664b
X-Patchwork-Hint: ignore
Message-Id: <20220817062655.C557787956@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libiio: drop
 'from' in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8c67ea5d18f30cc6e14a10fa83a66312af9664b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Drop 'from' in comment of Config.in which was added by commit
00deb6a7c11440766767cc07800661e8067df474

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 52b3b3661c336693a0d23cb95bde2f258ec176b8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 98d663e203..21c3a3b439 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -32,7 +32,7 @@ config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 config BR2_PACKAGE_LIBIIO_USB_BACKEND
 	bool "USB backend"
 	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBUSB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2967C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4718940AD8;
	Sun, 24 Jul 2022 12:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4718940AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNAU7158svDg; Sun, 24 Jul 2022 12:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D34940521;
	Sun, 24 Jul 2022 12:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D34940521
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 089091BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D83AC84BA2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83AC84BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmJUTfIL3pl8 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3580284BA3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3580284BA3
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 19DE285C23; Sun, 24 Jul 2022 12:17:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:22:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7d6fda52f1443c50b1ded39fbeec7a6ecf93199
X-Git-Newrev: 52b3b3661c336693a0d23cb95bde2f258ec176b8
X-Patchwork-Hint: ignore
Message-Id: <20220724121731.19DE285C23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: drop 'from' in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=52b3b3661c336693a0d23cb95bde2f258ec176b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 'from' in comment of Config.in which was added by commit
00deb6a7c11440766767cc07800661e8067df474

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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

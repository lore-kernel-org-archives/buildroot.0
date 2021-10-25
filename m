Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498BAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C80E060E0B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C80E060E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7D46089F;
	Mon, 25 Oct 2021 20:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1LIfd7knsKS; Mon, 25 Oct 2021 20:20:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D9BC60807;
	Mon, 25 Oct 2021 20:20:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECD21BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE8F3403DD
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Z-spHc6WmWv for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA701403DF
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2643488984; Mon, 25 Oct 2021 20:15:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95b812188f20dc4be3997d6f9c8e788933c24136
X-Git-Newrev: bfdc91cac0d17442af0f06b8c894f896696f465b
X-Patchwork-Hint: ignore
Message-Id: <20211025201509.2643488984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libusb1: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfdc91cac0d17442af0f06b8c894f896696f465b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python2 support has been dropped since version 1.10.0 and
https://github.com/vpelletier/python-libusb1/commit/69fd5a3ed2f674d412131dfaf24bbc2534f3cf13
resulting in the following build failure since bump to version 2.0.1 in
commit 6703b94f24320316ddfc2a3ec3e40fe3876dc8c8:

Traceback (most recent call last):
  File "setup.py", line 22, in <module>
    from html.parser import HTMLParser
ImportError: No module named html.parser

Fixes:
 - http://autobuild.buildroot.org/results/fe011ccb7eac1be9762919f9feda35114e752d8a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-libusb1/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-libusb1/Config.in b/package/python-libusb1/Config.in
index e464a0394d..fbad70c375 100644
--- a/package/python-libusb1/Config.in
+++ b/package/python-libusb1/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_LIBUSB1
 	bool "python-libusb1"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
@@ -9,5 +10,6 @@ config BR2_PACKAGE_PYTHON_LIBUSB1
 	  http://github.com/vpelletier/python-libusb1
 
 comment "python-libusb1 needs a toolchain w/ threads, gcc >= 4.9"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

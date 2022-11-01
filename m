Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63528C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C2D41635;
	Tue,  1 Nov 2022 22:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C2D41635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fr7Q36m3umxa; Tue,  1 Nov 2022 22:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01519415D8;
	Tue,  1 Nov 2022 22:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01519415D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90F7F1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D01960E59
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D01960E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ei4UdKXvIlRm for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:27:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98F2360E4A
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98F2360E4A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87022879AC; Tue,  1 Nov 2022 22:27:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:27:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbaffb0179b904e4a19a3a13af842f4ba9ee0b96
X-Git-Newrev: f66221589fe9a2107f1ef4709875bb8efdb41d2a
X-Patchwork-Hint: ignore
Message-Id: <20221101222738.87022879AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: install to staging
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f66221589fe9a2107f1ef4709875bb8efdb41d2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UDisks2 provides a Library API [1] for accessing the UDisks2 service
via "libudisks2.so". For development of UDisks2 clients, install to
staging as well!

[1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/udisks/udisks.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 2bf519a2cc..959333d01f 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -10,6 +10,7 @@ UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisk
 UDISKS_LICENSE = GPL-2.0+
 UDISKS_LICENSE_FILES = COPYING
 UDISKS_CPE_ID_VENDOR = freedesktop
+UDISKS_INSTALL_STAGING = YES
 
 UDISKS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDE1C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB0C60A97;
	Sun, 30 Oct 2022 21:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB0C60A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFTzB5lUsqA8; Sun, 30 Oct 2022 21:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4593960A70;
	Sun, 30 Oct 2022 21:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4593960A70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0971BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B56660803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B56660803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARrKW01tG6Ph for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:23:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01E8C60017
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01E8C60017
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1EB087691; Sun, 30 Oct 2022 21:23:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:19:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f0a5cd606f260d85f1a74a3af5fbf2b11edae3c
X-Git-Newrev: 267188242e4edcfbca272168e62c2e9bc70864ce
X-Patchwork-Hint: ignore
Message-Id: <20221030212300.E1EB087691@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: add CPE ID information
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

commit: https://git.buildroot.net/buildroot/commit/?id=267188242e4edcfbca272168e62c2e9bc70864ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avmware%3Atools

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvmtools/openvmtools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 59080c05aa..d536e5e819 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -10,6 +10,8 @@ OPENVMTOOLS_SITE = https://github.com/vmware/open-vm-tools/releases/download/sta
 OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
 OPENVMTOOLS_LICENSE = LGPL-2.1
 OPENVMTOOLS_LICENSE_FILES = COPYING
+OPENVMTOOLS_CPE_ID_VENDOR = vmware
+OPENVMTOOLS_CPE_ID_PRODUCT = tools
 
 # configure.ac is patched
 OPENVMTOOLS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

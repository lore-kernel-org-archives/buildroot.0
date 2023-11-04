Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFBBC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49F2440A90;
	Sat,  4 Nov 2023 15:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49F2440A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23DKxZo7GwFn; Sat,  4 Nov 2023 15:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DA0E40A94;
	Sat,  4 Nov 2023 15:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA0E40A94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2731BF869
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FF3241D9B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF3241D9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HdlLMIFri25 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7222241D99
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7222241D99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61E3E8666C; Sat,  4 Nov 2023 15:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 16:10:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95e00339d1176bda5193d7cf4c904b64f99d8e98
X-Git-Newrev: 64ce823223fece5c106994d9654a126fc6161d6a
X-Patchwork-Hint: ignore
Message-Id: <20231104151126.61E3E8666C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: enable selinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=64ce823223fece5c106994d9654a126fc6161d6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xen/xen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 651442cfdf..ad71b14105 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,6 +6,7 @@
 
 XEN_VERSION = 4.14.6
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
+XEN_SELINUX_MODULES = xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

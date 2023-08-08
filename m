Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE44EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC6740B9B;
	Mon, 21 Aug 2023 20:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC6740B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsLmDF8MvqFP; Mon, 21 Aug 2023 20:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E97A140B5E;
	Mon, 21 Aug 2023 20:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E97A140B5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F6EA1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 788BB81E30
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 788BB81E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLPVVTQ-xDup for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C83EF81F88
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83EF81F88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C61BC86023; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 00:12:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 642b42928eeaf74db7dc7d7bf6670f37b7b7d274
X-Git-Newrev: d74515a3e83b6139aed764a5ef0f40115dc92e22
X-Patchwork-Hint: ignore
Message-Id: <20230821200124.C61BC86023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bwm-ng: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=d74515a3e83b6139aed764a5ef0f40115dc92e22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

bwm-ng_project:bwm-ng is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/DBF33404-2CC8-41FD-B0FF-039B27A19871?namingFormat=2.3&orderBy=CPEURI&keyword=bwm-ng&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bwm-ng/bwm-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index de09eafae5..bf3ed74afc 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -9,6 +9,7 @@ BWM_NG_SITE = $(call github,vgropp,bwm-ng,v$(BWM_NG_VERSION))
 BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPL-2.0+
 BWM_NG_LICENSE_FILES = COPYING
+BWM_NG_CPE_ID_VENDOR = bwm-ng_project
 BWM_NG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

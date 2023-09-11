Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44696EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F080C40A41;
	Mon, 11 Sep 2023 19:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F080C40A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIlvTZ87mghA; Mon, 11 Sep 2023 19:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 284CD4151B;
	Mon, 11 Sep 2023 19:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 284CD4151B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7991BF97A
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B934C81EB9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B934C81EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYtSkc6vFbK5 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:07:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E11F281EC1
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E11F281EC1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0D9286C8E; Mon, 11 Sep 2023 19:07:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 18:20:01 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 5d50259ecca6848e6bf19ad5776f98533787e057
X-Git-Newrev: abbc941e6fe17e3a566f215ef7acbfac7fef21bb
X-Patchwork-Hint: ignore
Message-Id: <20230911190748.D0D9286C8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/sngrep: add CPE ID
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

commit: https://git.buildroot.net/buildroot/commit/?id=abbc941e6fe17e3a566f215ef7acbfac7fef21bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

irontec:sngrep is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/558A213D-A36B-4ED8-8671-2C38110F47FD?namingFormat=2.3&orderBy=CPEURI&keyword=sngrep&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 159e469f53a1220249e8df41e287668a3d726678)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sngrep/sngrep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index eedb99492f..0e344550d3 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -9,6 +9,7 @@ SNGREP_SITE = \
 	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
+SNGREP_CPE_ID_VENDOR = irontec
 SNGREP_AUTORECONF = YES
 SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

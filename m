Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ABDC4332F
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 20:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5072C8400D;
	Thu,  6 Oct 2022 20:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5072C8400D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ol10IssxHUDa; Thu,  6 Oct 2022 20:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B08984002;
	Thu,  6 Oct 2022 20:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B08984002
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5171C2744
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ABAC40FEB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 20:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ABAC40FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SY1gC3SzpU3M for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAC7E40521
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC7E40521
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A78E686AC7; Thu,  6 Oct 2022 20:02:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 22:02:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04ae71b567587977be9d07ade764159b31f1f403
X-Git-Newrev: f76d177dacad9f9f56cfaa955f948398c230bc23
X-Patchwork-Hint: ignore
Message-Id: <20221006200251.A78E686AC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-filters: fix check-package
 warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=f76d177dacad9f9f56cfaa955f948398c230bc23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/cups-filters/cups-filters.mk:83: consecutive empty lines

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups-filters/cups-filters.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 7a3c894112..3250649e07 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -80,7 +80,6 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-exif
 endif
 
-
 define CUPS_FILTERS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
 		$(TARGET_DIR)/etc/init.d/S82cups-browsed
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

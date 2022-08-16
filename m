Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7273C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 430BF4136C;
	Tue, 16 Aug 2022 08:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430BF4136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvxpqTRqM1vp; Tue, 16 Aug 2022 08:37:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1849D408D2;
	Tue, 16 Aug 2022 08:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1849D408D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8640D1BF9B9
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C9F2408D2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C9F2408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoWrRjnRNgbN for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:37:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7177F4086A
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7177F4086A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 42D6287761; Tue, 16 Aug 2022 08:22:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:18:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b614561797756993e60a7ef7708ef8a1a7ac74bb
X-Git-Newrev: 6ae2ead17510cca2ea7e5dd9f541879188a47c7a
X-Patchwork-Hint: ignore
Message-Id: <20220816082234.42D6287761@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/netsniff-ng:
 disable geoip and zlib if neeeded
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ae2ead17510cca2ea7e5dd9f541879188a47c7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fd0883ba2107add7b2b987195c5abfbcc86117bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsniff-ng/netsniff-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 3bc11b55b9..2b5b19b27f 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -27,6 +27,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 NETSNIFF_NG_DEPENDENCIES += geoip
+else
+NETSNIFF_NG_CONF_OPTS += --disable-geoip
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
@@ -41,6 +43,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 NETSNIFF_NG_DEPENDENCIES += zlib
+else
+NETSNIFF_NG_CONF_OPTS += --disable-zlib
 endif
 
 # hand-written configure script and makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054B0C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:15:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9744060243
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9744060243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C35F60874;
	Tue,  3 Aug 2021 15:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8EbkAMxp91JU; Tue,  3 Aug 2021 15:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA69F607C0;
	Tue,  3 Aug 2021 15:15:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DCF91BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A909829AF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuvPJQnl-m6p for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:15:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF3882572
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:15:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B93F687D77; Tue,  3 Aug 2021 15:15:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:08:03 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 710daa0001a64e4c8621ebd46ec5f9173b0cbee0
X-Git-Newrev: 70880aa352602440f4304f4deabe6f4d8d9ee9e7
X-Patchwork-Hint: ignore
Message-Id: <20210803151542.B93F687D77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libnice: add
 gobject-introspection optional dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=70880aa352602440f4304f4deabe6f4d8d9ee9e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

gobject-introspection is an optional dependency which is enabled by
default since version 0.1.8 and
https://github.com/libnice/libnice/commit/0388646bdba5f91bb6bb509f5a1c6e9e3f068555

Fixes:
 - http://autobuild.buildroot.org/results/1cba7aa233e19472a69ffc2d8f7324d363a22deb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aade2fd293fc8a13bc5665fa70a4002ddac9aae6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnice/libnice.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 8cbf003529..8292250938 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -22,6 +22,13 @@ LIBNICE_CONF_OPTS += \
 LIBNICE_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBNICE_CONF_OPTS += --enable-introspection
+LIBNICE_DEPENDENCIES += gobject-introspection
+else
+LIBNICE_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 LIBNICE_CONF_OPTS += --with-gstreamer
 LIBNICE_DEPENDENCIES += gst1-plugins-base
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

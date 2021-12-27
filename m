Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0117FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 11:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F8640906;
	Mon, 27 Dec 2021 11:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHj9utOQTkUU; Mon, 27 Dec 2021 11:05:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1DB540929;
	Mon, 27 Dec 2021 11:05:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3061BF4DA
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 11:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B20140286
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 11:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wCLx9P4UUwnM for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 11:05:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FC8940201
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 11:05:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 508D882B71; Mon, 27 Dec 2021 11:00:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 12:05:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dbb40955f6ba7adc6da425a365aff0b361310e6
X-Git-Newrev: 5df540d3a599a7ef7ae12b117ed2419316e4ee9b
X-Patchwork-Hint: ignore
Message-Id: <20211227110010.508D882B71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-libust: properly append to
 LTTNG_LIBUST_CONF_ENV in condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=5df540d3a599a7ef7ae12b117ed2419316e4ee9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-libust/lttng-libust.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 8ce47021c9..ef7d1a6200 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -27,7 +27,7 @@ else ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LTTNG_LIBUST_DEPENDENCIES += python3
 LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
 else
-LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
+LTTNG_LIBUST_CONF_ENV += am_cv_pathless_PYTHON="none"
 LTTNG_LIBUST_CONF_OPTS += --disable-python-agent
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

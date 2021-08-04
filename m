Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B00C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:08:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47D9860F0F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 18:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47D9860F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B8D34052D;
	Wed,  4 Aug 2021 18:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfdOqf4-qT_l; Wed,  4 Aug 2021 18:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 184B74052E;
	Wed,  4 Aug 2021 18:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30E211BF381
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C7440647
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 18:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCP1BsTPD76d for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 18:06:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 704DD4064F
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 18:06:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB1C68B5F4; Wed,  4 Aug 2021 18:06:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 20:06:05 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: b1d4fe8795c4ca23aa1911ef5e66d5d53cfafd6c
X-Git-Newrev: d924dbcf034b742fbb93258ac5d5d0468c1c4202
X-Patchwork-Hint: ignore
Message-Id: <20210804180629.BB1C68B5F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libgudev: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=d924dbcf034b742fbb93258ac5d5d0468c1c4202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

gobject-introspection is an optional dependency (which is enabled by
default) since at least version 219 and
https://gitlab.gnome.org/GNOME/libgudev/-/commit/43a593b5b4097b887e49eaacafbc1337bd709718

Fixes:
 - http://autobuild.buildroot.org/results/3bedc9fa3b14939825fb9cdebc6977057c3f6118

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 99278e520826002dfdae61ec2d649846f43a9f36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgudev/libgudev.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
index 63d592f9ac..9aa64c2c22 100644
--- a/package/libgudev/libgudev.mk
+++ b/package/libgudev/libgudev.mk
@@ -13,4 +13,11 @@ LIBGUDEV_LICENSE = LGPL-2.1+
 LIBGUDEV_LICENSE_FILES = COPYING
 LIBGUDEV_CONF_OPTS = --disable-umockdev
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBGUDEV_CONF_OPTS += --enable-introspection
+LIBGUDEV_DEPENDENCIES += gobject-introspection
+else
+LIBGUDEV_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

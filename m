Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6458DC77B76
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 03:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3549817ED;
	Wed, 19 Apr 2023 03:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3549817ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2LWiYnkLwHH; Wed, 19 Apr 2023 03:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A6D81756;
	Wed, 19 Apr 2023 03:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A6D81756
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47E8A1C416E
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 03:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB3DD60EA5
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 03:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB3DD60EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPr0MZvIXDNn for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 03:28:37 +0000 (UTC)
X-Greylist: delayed 00:06:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2716D60E68
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2716D60E68
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 03:28:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Q1R1K4SSPz9sTL
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 05:22:29 +0200 (CEST)
From: Michael Hacker <mh@superbox.one>
Mime-Version: 1.0 (1.0)
Date: Wed, 19 Apr 2023 05:22:27 +0200
Message-Id: <A79A145F-0D4E-40BC-9B67-889333FCDCF7@superbox.one>
To: buildroot@buildroot.org
X-Rspamd-Queue-Id: 4Q1R1K4SSPz9sTL
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superbox.one; s=MBO0001; t=1681874549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8b7nE8vgUrZuJathb6aeqH2L8i+HRAm0FPkOdoIbTQY=;
 b=ltbJYS6QImh6FpbVyvoflUQJwQoYn8mTrApWWTKkGNpzN0RxW75dZdzODc7qOWSgxbcogp
 iWMKYgf54SRIzC19IJdc5LqfphRR+Hhy/cK0HYPFBP4C2R9bfE/vOknV5tAHf3xU3bdaUW
 A808SkgM7zlc0cfyCRvm7c6gL+29JbURWrSfpvDgeYrfZ8erh91yfGsrnCFYivDdzp/ZF0
 PFpNusUnaIwQjeVrY6jvhXR84FZQw/hcN8MpjeEPLiFnA5EGiUa8W+gela84zH3BhveGpj
 ll39TIp6q/JW9VaYYSxqB/I40BUX8bF/xXA/gZpgAiZw+h4e4EmFxBlV1YPKzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=superbox.one header.i=@superbox.one header.a=rsa-sha256
 header.s=MBO0001 header.b=ltbJYS6Q
Subject: [Buildroot] opkg-utils binaries did not installed with make
 install-utils
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There seems to be something wrong in the opkg-utils.mk. install-utils does not run correctly and some tools are missing, e.g. opkg-utils.

I have a patch for it and after that everything is installed correctly:

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index ad267c5c94..384a7323ee 100644
--- a/buildroot/package/opkg-utils/opkg-utils.mk
+++ b/buildroot/package/opkg-utils/opkg-utils.mk
@@ -16.7 +16.7 @@ HOST_OPKG_UTILS_DEPENDENCIES = \
 host-xz

 # Nothing to build; only scripts to install.
-define OPKG_UTILS_INSTALL_CMDS
+define OPKG_UTILS_INSTALL_TARGET_CMDS
 $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-utils
 endef

Michael Hacker
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

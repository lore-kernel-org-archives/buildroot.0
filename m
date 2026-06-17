Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232CFCD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 13:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CDC04A397;
	Wed, 17 Jun 2026 13:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzwnizpZrNUM; Wed, 17 Jun 2026 13:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C5C24917A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781702213;
	bh=m8/EvlDziHgvoga81Riu3KoKe1YiHAkdZp0EEdvboUY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FJJqqRcvDj/APwramnpp1MSHeYI3wpVkFbwE4rwtFRgWIvdibAnn0YS12qsfJdr/b
	 QNCsGHhLMfFU25TLiP964qFxofD6OmCGBeKt2bslI+WPaEkIswMqd/8T0N8RJJbchO
	 ppidwFgDzPAefyezLoSZfYOyvQUx5SoVltWR3GDPVb35VqUtTRFBYjVBRjbk4YHFJX
	 PunvJY31zCNUf+XZt2sSZHCQ1MmYAPm0WZi1hM5fD5dCBVrRyuzOSaUkzlkG0cS/cN
	 5/Bvb79hgnMPOQkQvknV+cFI1vTwz4+O1L+X3FXriv31IqfgdNYFKq/5aXPLFOTPKz
	 ThZLPido09Q3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C5C24917A;
	Wed, 17 Jun 2026 13:16:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB30D8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B827859FE
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqLO7MuAH3EP for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 13:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6650859FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6650859FC
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E63298121B; Wed, 17 Jun 2026 13:16:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 15:14:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c80df91c20b0d4dd5846a4f78ea90a6ab83c178
X-Git-Newrev: 8536a5d04a6a83d9ec4b4922b99c14a7c4a8ae92
X-Patchwork-Hint: ignore
Message-Id: <20260617131629.E63298121B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: install upstream main.conf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8536a5d04a6a83d9ec4b4922b99c14a7c4a8ae92
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Note this changes EnableNetworkConfiguration from true to false
according to the upstream default, users who want a standalone iwd
setup which handles DHCP will need to adjust the config. Adjusting
NameResolvingService according to selected packages is unlikely to
have unexpected effects, so keep that.

This makes iwd work as a drop-in replacement for wpa_supplicant with
NetworkManager.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/iwd/iwd.mk    | 4 ++--
 package/iwd/main.conf | 5 -----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index caecb62d64..76cc00fd22 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -51,8 +51,8 @@ IWD_CONF_OPTS += --disable-monitor
 endif
 
 define IWD_INSTALL_CONFIG_FILE
-	$(INSTALL) -D -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
-	$(SED) 's,__RESOLV_SERVICE__,$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
+	$(INSTALL) -D -m 644 $(@D)/doc/main.conf $(TARGET_DIR)/etc/iwd/main.conf
+	$(SED) 's,#\?\(NameResolvingService\)=.*,\1=$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
 endef
 
 IWD_POST_INSTALL_TARGET_HOOKS += IWD_INSTALL_CONFIG_FILE
diff --git a/package/iwd/main.conf b/package/iwd/main.conf
deleted file mode 100644
index 22c1cd7339..0000000000
--- a/package/iwd/main.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-# use built-in dhcp client
-[General]
-EnableNetworkConfiguration=true
-[Network]
-NameResolvingService=__RESOLV_SERVICE__
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

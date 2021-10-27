Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B56C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:31:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA8760F39
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECA8760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C164E400FE;
	Wed, 27 Oct 2021 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjMD0mmqd3lY; Wed, 27 Oct 2021 20:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D112540445;
	Wed, 27 Oct 2021 20:31:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BA2E1BF3EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34E28605E9
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMGCCNcutA0H for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BC4F607AF
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3BABF8903F; Wed, 27 Oct 2021 20:27:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:28:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18afa41de48c5558bc2025c6cfe7674ce3cbc1e1
X-Git-Newrev: 31269b211bf31e69f5751d3e486ab7dcb80a9490
X-Patchwork-Hint: ignore
Message-Id: <20211027202704.3BABF8903F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: allow disabling RPMB
 emulation
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

commit: https://git.buildroot.net/buildroot/commit/?id=31269b211bf31e69f5751d3e486ab7dcb80a9490
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add configuration switch BR2_PACKAGE_OPTEE_CLIENT_RPMB_EMU to define
whether RPMB emulation is enabled or not. It is default enabled for
backward compatibility.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/optee-client/Config.in       | 6 ++++++
 package/optee-client/optee-client.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index e774d70484..cc7f176c77 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -24,6 +24,12 @@ config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
 	  normal world OS providing the actual storage via
 	  tee-supplicant.
 
+config BR2_PACKAGE_OPTEE_CLIENT_RPMB_EMU
+	bool "Enable RPMB emulation"
+	default y
+	help
+	  Enable RPMB device emulation in tee-supplicant.
+
 config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
 	bool "Enable TEE supplicant plugins"
 	default y
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 9a73a8a761..dda9a2855d 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -14,6 +14,12 @@ OPTEE_CLIENT_CONF_OPTS = \
 	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
 	-DCFG_WERROR=OFF
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_RPMB_EMU),y)
+OPTEE_CLIENT_CONF_OPTS += -DRPMB_EMU=ON
+else
+OPTEE_CLIENT_CONF_OPTS += -DRPMB_EMU=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS),y)
 OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

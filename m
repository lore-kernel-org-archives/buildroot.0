Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0BBC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0412820CA;
	Wed,  1 May 2024 19:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcztcyYjt5Wi; Wed,  1 May 2024 19:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FA6820D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05FA6820D2;
	Wed,  1 May 2024 19:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B93911BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A66556066F
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCBmFKj6dXVg for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2206066E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB2206066E
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:35:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D51608640F; Wed,  1 May 2024 19:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:35:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 653bd0d28b39aee415d38494accc1dc64aea432c
X-Git-Newrev: 640a79000b028eef3f54ba18e450c27bbeea9f56
X-Patchwork-Hint: ignore
Message-Id: <20240501193552.D51608640F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apcupsd: set ac_cv_path_SHUTDOWN
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

commit: https://git.buildroot.net/buildroot/commit/?id=640a79000b028eef3f54ba18e450c27bbeea9f56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set ac_cv_path_SHUTDOWN to /sbin/shutdown to avoid the following build
failure when shutdown is not available on host raised since the addition
of the package in commit d12b63b741586b89c4017551308c43512a617287:

configure: error: Missing required tool; need any one of: shutdown shutdown.bsd

Fixes: d12b63b741586b89c4017551308c43512a617287
 - http://autobuild.buildroot.org/results/a8bbb5ced8343e08070361f260050de422144710

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apcupsd/apcupsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 97e6d6a558..43a016678d 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -11,6 +11,7 @@ APCUPSD_LICENSE_FILES = COPYING
 APCUPSD_CPE_ID_VENDOR = apcupsd
 APCUPSD_SELINUX_MODULES = apache apcupsd
 APCUPSD_CONF_OPTS = --disable-test
+APCUPSD_CONF_ENV = ac_cv_path_SHUTDOWN=/sbin/shutdown
 
 ifneq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB)$(BR2_PACKAGE_APCUPSD_USB),)
 APCUPSD_CONF_ENV += ac_cv_path_usbcfg=$(STAGING_DIR)/usr/bin/libusb-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

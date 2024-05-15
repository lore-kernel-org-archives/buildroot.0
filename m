Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C566CC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 15:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955AD40621;
	Wed, 15 May 2024 15:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUQw6WhXoV1P; Wed, 15 May 2024 15:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39AAD406A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39AAD406A4;
	Wed, 15 May 2024 15:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF761BF841
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B990F40B9F
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSJr7ipSaEyS for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 15:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B04C841AD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B04C841AD7
 for <buildroot@buildroot.org>; Wed, 15 May 2024 15:31:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A99AF873D7; Wed, 15 May 2024 15:31:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 17:30:35 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8811a2d0ebaff24bb6e94da1897378c52ebf24b9
X-Git-Newrev: bb7a0c27d4bca705089f7d17d5a6c302545f2539
X-Patchwork-Hint: ignore
Message-Id: <20240515153113.A99AF873D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/apcupsd: set
 ac_cv_path_SHUTDOWN
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb7a0c27d4bca705089f7d17d5a6c302545f2539
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Set ac_cv_path_SHUTDOWN to /sbin/shutdown to avoid the following build
failure when shutdown is not available on host raised since the addition
of the package in commit d12b63b741586b89c4017551308c43512a617287:

configure: error: Missing required tool; need any one of: shutdown shutdown.bsd

Fixes: d12b63b741586b89c4017551308c43512a617287
 - http://autobuild.buildroot.org/results/a8bbb5ced8343e08070361f260050de422144710

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 640a79000b028eef3f54ba18e450c27bbeea9f56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

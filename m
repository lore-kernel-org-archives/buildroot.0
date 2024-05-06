Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41FDC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54808822FD;
	Mon,  6 May 2024 20:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z19T6YrGfcEQ; Mon,  6 May 2024 20:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EEE482316
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EEE482316;
	Mon,  6 May 2024 20:13:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 797231BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 669F64058E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PZhYx3RvMjj for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CB440108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92CB440108
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:13:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D65E868D7; Mon,  6 May 2024 20:13:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:12:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35c7cc56441ea58834201c7d08026e05209fc1e9
X-Git-Newrev: bbcf02c7ff586a110a576a85b9634b5f11eb6ee3
X-Patchwork-Hint: ignore
Message-Id: <20240506201307.7D65E868D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pppd: add linux-pam optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbcf02c7ff586a110a576a85b9634b5f11eb6ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-pam is an optional dependency which is enbled by default since
bump to version 2.5.0 in commit 0c15169f5ae57d88a77df34cc896044a37c9597b
and
https://github.com/ppp-project/ppp/commit/2883dd07101bf851e2ea368f0c04c91aea85cff2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pppd/pppd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 616b843e3d..0a1eaf9209 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -17,6 +17,13 @@ PPPD_AUTORECONF = YES
 PPPD_INSTALL_STAGING = YES
 PPPD_CONF_OPTS = --enable-multilink
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+PPPD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
+PPPD_DEPENDENCIES += linux-pam
+else
+PPPD_CONF_OPTS += --without-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PPPD_CONF_OPTS += \
 	--enable-eaptls \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

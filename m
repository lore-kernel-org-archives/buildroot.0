Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00ACC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCD6E401C2;
	Mon, 27 May 2024 13:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dR1KSpRY86s; Mon, 27 May 2024 13:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1603401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1603401CC;
	Mon, 27 May 2024 13:07:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 527561D1CA9
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FAA2402A7
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CYvfh6I4a1Q for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4BD401DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E4BD401DF
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:07:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8657587693; Mon, 27 May 2024 13:07:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 15:07:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3dd6a82e3a571a68cedf558c9755ae8b1da9c07e
X-Git-Newrev: f25bd4508274deae95ffc4b02ec53f0f65874d7a
X-Patchwork-Hint: ignore
Message-Id: <20240527130749.8657587693@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pppd: add
 linux-pam optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f25bd4508274deae95ffc4b02ec53f0f65874d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

linux-pam is an optional dependency which is enbled by default since
bump to version 2.5.0 in commit 0c15169f5ae57d88a77df34cc896044a37c9597b
and
https://github.com/ppp-project/ppp/commit/2883dd07101bf851e2ea368f0c04c91aea85cff2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bbcf02c7ff586a110a576a85b9634b5f11eb6ee3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

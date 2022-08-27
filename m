Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AD2ECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 006BF60E0A;
	Sat, 27 Aug 2022 20:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006BF60E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jq6UpxcT36Iu; Sat, 27 Aug 2022 20:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20CBB60D89;
	Sat, 27 Aug 2022 20:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20CBB60D89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFE3E1BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B3C260E08
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3C260E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dn2GRdlDvp1B for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:45:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E83D360C0F
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E83D360C0F
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8A18287E3E; Sat, 27 Aug 2022 20:30:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 22:41:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a26ab27397c81928bdacc96473f80b2c47fc534d
X-Git-Newrev: 96f50e65f3d51d40759b1ebf4259789b14951dc3
X-Patchwork-Hint: ignore
Message-Id: <20220827203010.8A18287E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: correctly set
 krb5-config
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

commit: https://git.buildroot.net/buildroot/commit/?id=96f50e65f3d51d40759b1ebf4259789b14951dc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by commit 84d32e53657db32784608c1130ec5290667a652f:

configure: error: invalid variable name: `ac_cv_path_krb5-config'

Fixes:
 - http://autobuild.buildroot.org/results/5a0e5023c274223b5eb7623165395549e7f446bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freeradius-server/freeradius-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index f77413a170..ebd459341d 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -87,7 +87,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 FREERADIUS_SERVER_CONF_OPTS += \
-	ac_cv_path_krb5-config=$(STAGING_DIR)/usr/bin/krb5-config \
+	ac_cv_path_krb5_config=$(STAGING_DIR)/usr/bin/krb5-config \
 	--with-rlm_krb5
 FREERADIUS_SERVER_DEPENDENCIES += libkrb5
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

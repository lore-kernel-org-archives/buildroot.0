Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7572740439;
	Wed, 27 Jul 2022 07:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7572740439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmdnKkzENm5e; Wed, 27 Jul 2022 07:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95EBE40412;
	Wed, 27 Jul 2022 07:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95EBE40412
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93BBE1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65B51402BD
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B51402BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFAJrq9TXg-A for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E0F440294
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E0F440294
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 059B386445; Wed, 27 Jul 2022 07:19:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:33:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35a06eb6fff506093f7208fadf9d8aaf757e3426
X-Git-Newrev: 55106a056e09cbb1c16c561c41ba160464305c62
X-Patchwork-Hint: ignore
Message-Id: <20220727071939.059B386445@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: add freeipmi optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=55106a056e09cbb1c16c561c41ba160464305c62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netdata/netdata.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 9e661f4943..4bc573df59 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -36,6 +36,13 @@ else
 NETDATA_CONF_OPTS += --disable-plugin-cups
 endif
 
+ifeq ($(BR2_PACKAGE_FREEIPMI),y)
+NETDATA_CONF_OPTS += --enable-plugin-freeipmi
+NETDATA_DEPENDENCIES += freeipmi
+else
+NETDATA_CONF_OPTS += --disable-plugin-freeipmi
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 NETDATA_CONF_OPTS += --enable-jsonc
 NETDATA_DEPENDENCIES += json-c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

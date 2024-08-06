Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013EFC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 10:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC82B400CA;
	Tue,  6 Aug 2024 10:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OLcU86PBEis; Tue,  6 Aug 2024 10:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A733400E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A733400E7;
	Tue,  6 Aug 2024 10:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AD011BF288
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6BF400CA
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgatIgBmfgYR for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 10:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B8D400A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4B8D400A3
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 10:16:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEDD084112; Tue,  6 Aug 2024 10:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 12:16:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd035872be9948515ee50ae034bda4a2e044ff22
X-Git-Newrev: 1498da3deeb64faa8afed2c715667cec496f72dd
X-Patchwork-Hint: ignore
Message-Id: <20240806101631.BEDD084112@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tipidee: load config from /etc
 instead of /usr/etc
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
Content-Type: multipart/mixed; boundary="===============6678600310146545715=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6678600310146545715==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1498da3deeb64faa8afed2c715667cec496f72dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--prefix influences the default of --sysconfdir, so we need to specify
--sysconfdir=/etc explicitly.

Fixes: 17deaf60f6 ("tipidee: new package")
Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tipidee/tipidee.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tipidee/tipidee.mk b/package/tipidee/tipidee.mk
index 915b4f84bd..8ae18edd8d 100644
--- a/package/tipidee/tipidee.mk
+++ b/package/tipidee/tipidee.mk
@@ -12,6 +12,7 @@ TIPIDEE_DEPENDENCIES = skalibs
 
 TIPIDEE_CONF_OPTS = \
 	--prefix=/usr \
+	--sysconfdir=/etc \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
 	--with-dynlib=$(STAGING_DIR)/lib \

--===============6678600310146545715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6678600310146545715==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97497C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 09:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 232DD40190;
	Sat,  5 Feb 2022 09:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UROcrvCqKsoc; Sat,  5 Feb 2022 09:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13490400BA;
	Sat,  5 Feb 2022 09:26:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C98A11BF3C5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 09:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B606A400BA
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 09:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_6KIT1qRUwE for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 09:26:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E00FF40018
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 09:26:29 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout07.t-online.de (Postfix) with SMTP id 856084C8E
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 10:26:26 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nGHKm-0mt86b0; Sat, 5 Feb 2022 10:26:20 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44574)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nGHKm-0006lS-1f
 for buildroot@buildroot.org; Sat, 05 Feb 2022 10:26:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 10:26:20 +0100
Message-Id: <20220205092620.4162598-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644053180-00010BFA-568BAA23/0/0 CLEAN NORMAL
X-TOI-MSGID: 86594bda-7780-4fa0-a3e4-88397400b31e
Subject: [Buildroot] [PATCH 1/1] package/libldns: remove
 --disable-dane-verify configure option
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

Not needed anymore after openssl was bumped to 1.1.x, snippet from
libldns configure:

checking for SSL_get0_dane... yes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libldns/libldns.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 7deca978da..c934e19136 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -13,11 +13,9 @@ LIBLDNS_CPE_ID_VENDOR = nlnetlabs
 LIBLDNS_CPE_ID_PRODUCT = ldns
 LIBLDNS_INSTALL_STAGING = YES
 LIBLDNS_DEPENDENCIES = openssl
-# --disable-dane-verify can be removed after openssl bump to 1.1.x
 LIBLDNS_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--enable-dane \
-	--disable-dane-verify \
 	--enable-ecdsa \
 	--enable-gost \
 	--enable-sha2 \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CFDC43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 12:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4898141941;
	Sat, 11 Jun 2022 12:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTyrRk2iDlVN; Sat, 11 Jun 2022 12:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3276C418DE;
	Sat, 11 Jun 2022 12:16:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 999291BF418
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 12:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9203F418DE
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 12:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuqEZb2WQgwn for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 12:16:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21D60418D7
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 12:16:17 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout01.t-online.de (Postfix) with SMTP id 0117E475F
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 14:16:14 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o002I-13wR9d0; Sat, 11 Jun 2022 14:16:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:49876)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o002I-0003m7-Eq
 for buildroot@buildroot.org; Sat, 11 Jun 2022 14:16:14 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 14:16:12 +0200
Message-Id: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654949774-0143C329-77A5577A/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ca2c396-bf04-4304-bbbf-61cdcc6c4098
Subject: [Buildroot] [PATCH 1/3] package/apache: add brotli as optional
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/90e/90e3a2aaf0ce0451b80c71743209797abeb83d0a/
http://autobuild.buildroot.net/results/006/006f94bb216a77f073a5670fa2f393c43f15a977/
http://autobuild.buildroot.net/results/dd6/dd69e665e51ce6b30e303a4d4670e9edbb159aea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index b2c855aa36..a6fb59d26b 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -45,6 +45,13 @@ APACHE_CONF_OPTS = \
 	--with-mpm=$(APACHE_MPM) \
 	--disable-luajit
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+APACHE_CONF_OPTS += --enable-brotli
+APACHE_DEPENDENCIES += brotli
+else
+APACHE_CONF_OPTS += --disable-brotli
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

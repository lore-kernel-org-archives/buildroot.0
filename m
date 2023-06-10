Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BCDC7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 17:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBFFB40A7F;
	Sat, 10 Jun 2023 17:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBFFB40A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wl5oQSxEVAJC; Sat, 10 Jun 2023 17:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A1CB4063B;
	Sat, 10 Jun 2023 17:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A1CB4063B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDCAB1BF32B
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B26FC41FDC
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26FC41FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEgxT6V2v_xC for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 17:26:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5858441FC6
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5858441FC6
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 17:26:28 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout06.t-online.de (Postfix) with SMTP id 80357213D8
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 19:25:57 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q82LZ-3N1MuH0; Sat, 10 Jun 2023 19:25:53 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:44366)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q82LZ-0000VQ-1S
 for buildroot@buildroot.org; Sat, 10 Jun 2023 19:25:53 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 19:25:53 +0200
Message-Id: <20230610172553.1102096-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686417953-E1A392C5-30DF8558/0/0 CLEAN NORMAL
X-TOI-MSGID: a103fcad-7d68-4303-be5c-2109d5a37d11
Subject: [Buildroot] [PATCH 1/1] package/privoxy: bump to version 3.0.34
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

Removed md5 hash, switched _SITE to https.

Release notes: https://www.privoxy.org/announce.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/privoxy/privoxy.hash | 7 +++----
 package/privoxy/privoxy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index cf1056ecc4..67a44f2c94 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,6 +1,5 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.33%20%28stable%29/
-md5  d6caf3eaad4812f0658b68d5b3ba3a06  privoxy-3.0.33-stable-src.tar.gz
-sha1  688da305077d8ecbcf6423e02201f01f7a7098f4  privoxy-3.0.33-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/3.0.34%20%28stable%29/
+sha1  e65298c4ee235320ea9ddfb689187bda29a63bbb  privoxy-3.0.34-stable-src.tar.gz
 # Locally computed
-sha256  04b104e70dac61561b9dd110684b250fafc8c13dbe437a60fae18ddd9a881fae  privoxy-3.0.33-stable-src.tar.gz
+sha256  e6ccbca1656f4e616b4657f8514e33a70f6697e9d7294356577839322a3c5d2c  privoxy-3.0.34-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 06642200df..e1353ef0c7 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 3.0.33
-PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
+PRIVOXY_VERSION = 3.0.34
+PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
 PRIVOXY_AUTORECONF = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

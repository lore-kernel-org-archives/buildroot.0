Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98983C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 09:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C62610B2;
	Wed,  8 Feb 2023 09:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C62610B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6z6S6MFC18vX; Wed,  8 Feb 2023 09:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1440E60E26;
	Wed,  8 Feb 2023 09:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1440E60E26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6125D1BF2C6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 09:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A11581306
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 09:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A11581306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NF_jdlfbV2en for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 09:45:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97894812C2
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97894812C2
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 09:45:48 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pPh1N-0002Ln-Qh; Wed, 08 Feb 2023 12:45:46 +0300
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 12:45:43 +0300
Message-Id: <20230208094543.474237-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9D919194CF4FC660480FEE636C1732B905E8A99F90F402A9A182A05F538085040AE930B0B0C200558C80EB7709AABF4253719A34CAF9BF507707573D0E22F42FB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F89FE2E276A822E5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379A6B93796C91DCB58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8AFAD6F8B2D1F6DEEE282410CF0981A0E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE767883B903EA3BAEA9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006377CDACFCF90986062389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A55BFB67B9310CDDE38A300B2767794A30CF995C9796C3C8FE4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF50F2237FE565727C05
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D347798CB24D89904731883E2CDA890013C67E221550AFF81F0B70035FB189E777C011EA5DE7BACB3B01D7E09C32AA3244CC753EDCB4689BC3879E84C58A84700DCC86C126E7119A0FEFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojDL2JcYrVG//BZ+d5902PEw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF578E330D2F06E41497992CAE264F7318598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=iiG3C6lzOKKyIy5UyPTnIQ8D3Q9KxRi6b3N9AadfQ+U=; 
 t=1675849548;x=1675939548; 
 b=iLwuoBzCjryy6BtY2PvJ9G9CNvIgBqDKYcL9EoEE+fabsEMg9lJZu7XeBbYKLwugiWRctL97UmwC4HgHCjpW3wvz0JFrGY7nLaawGTtbBSCSYX9zpUwGpV6A/m9r5fxArRvT/DddsuUIZWy5MKo72rMjqAcbK9qSOFv9Pec/bd/TC3DEybQ2GBW3QbuACWVTYkdTy/Hm67IzbirOqfbBPzNmgUKjs0aLPDj0N8a1yUDBGYxwSuR57VcOvyEy5c4cPrTjUZMVnlbFuiFbhsZosjyPgFDqvcoqAaZflZDdEbIYieYDDug2A9EmScSkV2F7o8vvUxNW9htSSrBxb+JaDQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=iLwuoBzC
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] lksctp-tools: bump to version 1.0.19
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: bigunclemax@gmail.com, Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/sctp/lksctp-tools/blob/v1.0.19/ChangeLog

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/lksctp-tools/lksctp-tools.hash | 4 ++--
 package/lksctp-tools/lksctp-tools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
index fb892fdc3b..b3a1f59d86 100644
--- a/package/lksctp-tools/lksctp-tools.hash
+++ b/package/lksctp-tools/lksctp-tools.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/lksctp/files/lksctp-tools/
-md5  68e9b8fa4d4e331029b247b72d46d7a5  lksctp-tools-1.0.17.tar.gz
-sha1  941b0b5c39e364a971f514bba66120435660e518  lksctp-tools-1.0.17.tar.gz
+md5  0fbb288c9f9625b88d3ab21c9ed9f011  lksctp-tools-1.0.19.tar.gz
+sha1  d410a596485c38464177a38ae7c7081444e6589e  lksctp-tools-1.0.19.tar.gz
 # Locally computed
 sha256  dee5f35e583183abb9212938643ecb2d858fd89e2e286f4b1d903f65d49d6c76  COPYING.lib
 sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
diff --git a/package/lksctp-tools/lksctp-tools.mk b/package/lksctp-tools/lksctp-tools.mk
index 5ac794e842..af86a28516 100644
--- a/package/lksctp-tools/lksctp-tools.mk
+++ b/package/lksctp-tools/lksctp-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LKSCTP_TOOLS_VERSION = 1.0.17
-LKSCTP_TOOLS_SITE = http://downloads.sourceforge.net/project/lksctp/lksctp-tools
+LKSCTP_TOOLS_VERSION = 1.0.19
+LKSCTP_TOOLS_SITE = $(call github,sctp,lksctp-tools,v$(LKSCTP_TOOLS_VERSION))
 LKSCTP_TOOLS_INSTALL_STAGING = YES
 # configure not shipped
 LKSCTP_TOOLS_AUTORECONF = YES
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

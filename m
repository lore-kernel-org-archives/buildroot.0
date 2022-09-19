Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854F6C54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 05:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1044860B88;
	Mon, 19 Sep 2022 05:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1044860B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYfZTj5bi_AA; Mon, 19 Sep 2022 05:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7F660ADC;
	Mon, 19 Sep 2022 05:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C7F660ADC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B41151BF228
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 05:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8886740562
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 05:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8886740562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVIYV-DFZvjN for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 05:59:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AD6140141
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AD6140141
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 05:59:25 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1oa9oQ-00044f-C3; Mon, 19 Sep 2022 08:59:22 +0300
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 08:59:20 +0300
Message-Id: <20220919055920.1072075-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9EBD81B01C038F8F37A3C6F5B007D561670736DF5E326B93F182A05F538085040E40DE9BDC9461D44DC2E1378C9EF4DF7F52D281CD5FAC6DE911316C4207462B0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D4A169723F56FEDEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374A24022C550661178638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8FAB80EC0DD9EDAC39B0DC530C1A191736F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE749E2213E709ACCBA9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E77F4578A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CC415C329B279CF9D43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5B25E13A71C679B22CE7E65F06B2D3BF1CAD91A466A1DEF99B6ED91DBE5ABE359ADBCB5631A0A9D21FF3F687384632F7D2CE733EDCD873AA8E2A8371E1B60B9E36FF4A85249296E39DB1881A6453793CE9C32612AADDFBE061501E677427FAD4073D58D961240FA4EF6DABF04D5057A81F1E618B5D5F965AFDF9425D8FA97DB43915E2725BA614EAEA1EF972C1F679AE1C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D341776B9FDE05FBA7A55326A0A0F39C8F8ED99E39DE2117E86CE16487019967BCBF1C32C954DFB54B51D7E09C32AA3244C73DCA41CDC9CFCA4FB2939484BDFE2FF6C24832127668422729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYCidGuNEkb4sSUvevnKWLg==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284E5BBE3B4DC3B02A13AEDE8885A3F1DBB198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=jvFFsgmOh4hb2PZphNeUW2JoNR8VUJMGBp71h8swOtc=; 
 t=1663567165;x=1663657165; 
 b=SMaRG6cfTLPQB4m1qWPimiP1Bp/8PYYJlJ+/WoN8f61TXQfgpF8BslWGPl5mrOFKmMxuERERJsU+9aaBnvDQC1x50ymxpYt72QUP6zOtrMaDUDhWKRLjhKzivfULC5qYh7jGsrkBR6pJ1+8FiPiA3UkX/EdGHE7NZZQ1YYR0Oj8asMBP/ssB/j/DsRsn1yNJxObQgx4r9UhNRs2pWkMTTlDYRiaBf6TTs468T6rf3a6KegVwKNT4v7OITm0QpUpQpZ6imNdHkLyJuQD7QQmSNvjp2TF5UaJuYb8Ndn1qF/ldWmnVP67CngFZs4ZlJT3y/jly8V8j6PW3lYRQRaTsbg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=SMaRG6cf
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 1.7.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.7.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 898fcd5500..28679cf08f 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0ec8b58ab972ac8356185af4161270c1b625a77299f09e5fb7f45e616ef1a9a5  osm2pgsql-1.6.0.tar.gz
+sha256  0f722baf0f04eda387d934d86228aae07d848993900db6b9e7ab312c91fd84e5  osm2pgsql-1.7.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index d389fff590..821d903fd6 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 1.6.0
+OSM2PGSQL_VERSION = 1.7.0
 OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

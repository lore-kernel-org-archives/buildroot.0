Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3493606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DEpMZmtk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF39740DE7;
	Fri, 20 Nov 2026 06:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOGL3TYPdAAq; Fri, 20 Nov 2026 06:33:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8CA3340DC1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795156436;
	b=J3U3x49+P9KOjiP8kJ3RKncoz8c570O6lOPMpK5Cc5rIJmeljvCI2UwCQJoVLo4Pi4Mt
	 lLq4napmsAX7nFkdmAV+2dBrxlzBJrusiUi0vJDJ0MgbMzXB2MFW8ai7TqD8zGLAi2lUM
	 9bdCQiDKtdhdKXEbFTYbofno1DObOTs73afwvQvtV5uZyupr/v8os6szrO3xN2caRTtU9
	 TcuRtqwr2lPjuvtf2qqUkf3crCwOxzmCe1lqYa9iLYRPmQdp/IVoWqqd8hUH5BkssIpSW
	 QOtNar1l7mJXF/nDo6okwmEsGSu6svbV0L/jgbbvwb9+NnqFzWCKj1VJOscRqVdxbyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795156436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:X-Mailru-Src:X-7564579A:
	 X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=sh4GxnC49Dt9PdMdHSXOPtBqr2UMPr7tbRgA+31LF9c=;
	b=R6FcJOsW/6fR9EOCOKRhxH8PcMMySNHypbOdz3z6gOH+ZpD6aMS8ECfcwG/lA+jocmrm
	 RyMSy1ubfYjnsGOzYPUlfkSDbn82W+1xKHRLvFGtGNDiIBQQmW6LDXTq4vnBtCPeYH+XH
	 z0QwV9JhXn1FrUi8Ht6rqa15TziNv6gkqjL5h+5q5aQirAL8m+goOD2UWdqSGmYKK5TbX
	 2FZZXCinB3qFy2deNFI+uvh7nyhmcJwgGrC0IB7GdUcPh+o4GZIaFDQapgcLLxpAXIpPr
	 yOzMNbH8/DqBFmAJ4GdIYO1EoV8JBNqMn6gs/qtYcGfqMKfaEU2x0qnvXi9ni7/ZqaA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795156436;
	bh=sh4GxnC49Dt9PdMdHSXOPtBqr2UMPr7tbRgA+31LF9c=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DEpMZmtkwwV3GLzuWUqnDUMte5FN2SDDctS9Qd8D/K41T1Ng9oHmSc5iBMxdyLyIy
	 nWqHMX563GMEEhZmMzYdbnK2JL7XCjjDAqVmA1uWIlB3WQBADzznRBk3Y/xuWuNXZL
	 wIEpw0tF7rllIoE4d6Z4J8boLMc/rRL2TXgk4dIIuah8DqamYbPg5IocvUGnDX23q+
	 DW5kQLROC2bpFNQGmbvkxRP3iR/f5Su5O/fdF09Jy6YYAJsRwg8tE4vqVgfnZWCrAn
	 jYP3gKxAVlo4G7WOewjMvfQlVOQsPT0iltmXrtwJr4i7U7B2g1R/D2icQsoTdqBMb0
	 6222QTwCUufHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA3340DC1;
	Fri, 20 Nov 2026 06:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0C4169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E470C401FD
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgX25RmWnAvy for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 06:33:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 40373400D6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.130;
 helo=send35.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send35.i.mail.ru (send35.i.mail.ru [89.221.237.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40373400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:33:51 +0000 (UTC)
Received: by exim-smtp-canary-10-7cf57c478c-9b98w with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1xUIBv-0000000088e-40AC; Fri, 20 Nov 2026 09:33:48 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 20 Nov 2026 09:33:46 +0300
Message-ID: <20261120063346.283686-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F9F21CDD1883FFB4FD82DBFA52A3D96234182A05F53808504054ADFB240182908F3DE06ABAFEAF6705B0FBA4B8D4283C607504E3462A05402739FAF02B19D1BA21
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE701173C01F417A2A6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566B47933B1EBDEC5AFC4435D7EB5F741B44EFC856652A450C6BC1A7952D952325D8EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E9D5E8D9A59859A8B6894F55CB5DA17CFACC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C309A7649CC036878F35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A578F80FEC5A60F2885002B1117B3ED69618EF9BF00ACCB7A830C8F815570A3530823CB91A9FED034534781492E4B8EEADB0A1B66E9F5C9ED4C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D65968F038DBBFEF3C327E69DCB660BE1B531059FAD1D43776D5A092D06487F3B319FEEDA12D9946E9FBB8341EE9D5BE9A0AB3AEA7051F795C5EFB5E8F282BFBCCBFFB9D9E6035184C318CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWGKV0de4FvgzAP+qXqN/L60=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B313A2D16E2EE695839EAC6C2B5FBAC5211C1A6F4A031CC0E21C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog:
https://github.com/postgis/postgis/blob/3.7.0/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/Config.in    | 1 +
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index a0f64bd76a..e9c5ef4c7f 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_POSTGIS
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GMP
 	help
 	  PostGIS is a spatial database extender for PostgreSQL
 	  object-relational database. It adds support for
diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index aef1864016..53f45a2e67 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ed8dc6679f1e06f7b113592b04cde2a7e00f1b1e681294c8ca2204058990cec6  postgis-3.6.4.tar.gz
+sha256  832bbf50f2b6f57fab053bc9676b3bfe641e5bf966cdcb28c7926f8d4b3c5e04  postgis-3.7.0.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 8a52027967..1aff23c467 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.6.4
+POSTGIS_VERSION = 3.7.0
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
@@ -12,7 +12,7 @@ POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-3-Clause (xsl), GPL-2.0+ or LGPL-3.0+
 POSTGIS_LICENSE_FILES = LICENSE.TXT
 POSTGIS_CPE_ID_VENDOR = postgis
 
-POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
+POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2 gmp
 
 POSTGIS_CONF_OPTS += \
 	--with-pgconfig=$(STAGING_DIR)/usr/bin/pg_config \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

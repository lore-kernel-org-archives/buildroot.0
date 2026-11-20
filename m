Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA78606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kupTTHZS
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F6E440DF2;
	Fri, 20 Nov 2026 06:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sBuHjmOfsj0; Fri, 20 Nov 2026 06:38:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A82EC40DC1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795156698;
	b=idMtAkBlaQX22ko1wRdEhvriTFtCu9fZsGpvfu57IbPYuIZthbSf0N8ycM/8cW1xxNv4
	 jJgPIFDyQWleI+uSeOODZ6IRYCwxKrunv/1daYn6DjZlH60iihhA5usCFOvyOFggiaOWF
	 1Y5Elko9X+S6WrdtqnX9CqrltvI5dbx9HZ+xZntRnPwX03rWqvMRlPaoNcIWWT3/N+GRK
	 vrnAo9BFP9l0DJI56yMfmu0pJ3VtLWsrJYdFP2XXaTtsu92dQvA+7obChhFsQFzCznNPU
	 7F1BOL5EHdZd+KGipcn+rDyZ0d5dwbOm4tLEVbHysx/Th8twugaIoKfePEyg8aw9HCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795156698;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:X-Mailru-Src:X-7564579A:
	 X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=FREHpJ8eMLcC/WBmQhVwbMMnZneBXLYgFuUiCSWFc5E=;
	b=QCaOVeLnZN5sTCyh7wLeSK1DiQ6LFzSgajOxHwvUA4PmCpFm4P8Vn8OIGKoFeylEhojw
	 mctxesyFoek5JcEDRQcEgFcVLwQHA31VcTS12CE5GGTDoiARDVQ6dJcXXB0mflHIhbcOK
	 2EYekGpN7hygJ+Dse0bUteYaY018KiAlIwy1alOmDEirYBo3wKOM2YVFVv+ECxM4KyjIZ
	 6qTOODNechGEoS3hIuCSChfQw0lkeIXlrIkefQsWFBfwyg3oDZM3/7+hSkFcfvjz5a2be
	 qgVP4LtA6jn6lADlIO8VI2ras1R+KkwGeUE9lbAQBEhIH3vADqQkRCj2qw9AD3nuhzg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795156698;
	bh=FREHpJ8eMLcC/WBmQhVwbMMnZneBXLYgFuUiCSWFc5E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kupTTHZSspSEGRI9PWVNGB9rZEQkVnbDkm6N2H3PSN9+OxfuA7fAbZ9WxiKaZ79jE
	 GwF87Oo0JVnxSMs4nuKXZOUoV/F9KSkp6BGmbbWlR9hkZYQun+tgzGssee+roix2sn
	 vQpM044rekFSga5O/PNSTtlQEPDyvJjuz/r5bToEvjuEZmepBwoSw/XaUzmMwDn9wr
	 wzyh0BNfz70TEeTNyggh2w8Vb6o7e/JROOCMhmOK/IO1VxxVaY0hC7HR1bnpjln09T
	 pbr02Qhb4RO0M8MIg9pKCHb8jJAnvB4Ahgu9UVR11HODH7BG7SlEiLHzUOaRSFQtpC
	 9kJ+IAi/7sz7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A82EC40DC1;
	Fri, 20 Nov 2026 06:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C241A1C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3AFB606D0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwWoAUQ23hLo for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 06:38:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 01175606A8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.81;
 helo=send242.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send242.i.mail.ru (send242.i.mail.ru [95.163.59.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01175606A8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:38:14 +0000 (UTC)
Received: by exim-smtp-56bb8ff957-2htg9 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1xUIGB-000000006Nb-2H6H; Fri, 20 Nov 2026 09:38:11 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 20 Nov 2026 09:38:09 +0300
Message-ID: <20261120063809.299110-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F92C5CC3D78C1F4129358BF2273B6E1791182A05F538085040C9F8E4BBDC298C9F3DE06ABAFEAF6705CD8454DBE311382E7504E3462A05402721E68012AEC8BD2D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE776FF0B15B6DDC389C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7811C3E343B302E2EEA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA6588782DE0093C6E76CF42B8CCC81FE6DEF95650897364E6BF06F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F44604297287769387670735200AC5B80A05675ACDC26CFBAC0749D213D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6300D3B61E77C8D3B089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5E63EF8FDD0AFB9125002B1117B3ED6960125997274784DCFC638DF663A625AFA823CB91A9FED034534781492E4B8EEAD5B606B10FC07407CC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659534362366E94768C83DA3C96AF9E05379254EB80696F1D483D7E9248457BACDCF8CA45E2DA1109E5B8341EE9D5BE9A0A504F1C05B92CF48E7B70A83C803BD96175EE812D3A65977D8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWPXDj5pM7PWHe+eya20PhEY=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B31309645B63AD6D183254D7CE9C69059F37BE4CB31467873FF490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.32.1
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

Changelog: https://github.com/timescale/timescaledb/blob/2.32.1/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 75f9b542de..e4cd234de6 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c9f95c8865f71244cdd333076284377e83dad62f85679fbf1c94ba48a7d67334  timescaledb-2.28.3.tar.gz
+sha256  c49c9615b2b6623f1c3ad2813b850d4c577d6c65c43bb8eee4b255e1e1af4a9f  timescaledb-2.32.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 9bbe502941..ecf59bdea1 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.28.3
+TIMESCALEDB_VERSION = 2.32.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

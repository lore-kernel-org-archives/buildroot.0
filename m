Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C0BC38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 05:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8128560D63;
	Tue, 24 Jan 2023 05:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8128560D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gazsMGVsdVO3; Tue, 24 Jan 2023 05:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA9A60FD2;
	Tue, 24 Jan 2023 05:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA9A60FD2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7112B1BF955
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 471F460D63
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 05:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471F460D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1NUsgk_JFFxa for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 05:47:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6013660D60
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6013660D60
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 05:47:56 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pKC9x-0001Cm-GA; Tue, 24 Jan 2023 08:47:53 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 08:47:47 +0300
Message-Id: <20230124054748.13980-2-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230124054748.13980-1-fido_max@inbox.ru>
References: <20230124054748.13980-1-fido_max@inbox.ru>
MIME-Version: 1.0
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9A6D6F5724DD3A0B61190F66D08129F9CF3463751BE83E229182A05F5380850401BCD7E9240B519B7854A2253C976041A62AA8C95C31F62BCF4CFA955E43D92B6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9FBA884A7C9B8BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063781BF90BB6B3E56078638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81EFD499F97A851B01A928BB3D301F6B16F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75C266B62551496319FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B9C5BD8F4E2319607A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6BF3059D42242344A089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A52305ABB562D872277EB448325F252601AB02CC47B8FBAB2B4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF508DC63EAE0DBA7CFC
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3451BBE684D17D722189E57F3A655D01D6837EDA5FC775681D4CBEBBB0EA0CB5512DA6B5C532F79F021D7E09C32AA3244C0E2EC63D57A1E7AD23A60D3411DA09F0A90944CA99CF22E3729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ukhBIi/0FC3+Al3IGgKnw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF55799FE2B098D8F51C30FD4E87C9EC13D98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=AytpphucJq5adSP7YZz5DpxR5QhXb4b/OvYCRmtqwic=; 
 t=1674539276;x=1674629276; 
 b=jE8VNH/MT02piqQbnzLVwzG1pTB4H+o8aryfDGdHgp5rnEx//w+0Sf7K9dW7lNAk+DmHwLq2ea3x3yttZjm2LoAbgdvcafjSMlm72Vi5sTq41MzK9icz5IsufjZn7MNSxlb5y2yhqIIm3MFoQTCuIt6VlRleV3yzdm2Y0JrPpFO/UnJ3wfHVJ+3/PFW/FOcoVdbvgoVwd1U05HzdClfS4y4ql5zn62CKp7amM53FG9ybqu8LcOFn2KlAaYZ+kqIuk+XXc5N1GbOeNgIlWqfno4gvjjI/XWdN5oucnUJZwd9GntL0TGmKH1dthxt+d8qAVQGhkNV2+7BBnyB6McES/Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=jE8VNH/M
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 2/3] DEVELOPERS: add myself to postgresql package
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..db52288707 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2084,6 +2084,7 @@ F:	package/libgeos/
 F:	package/libosmium/
 F:	package/osm2pgsql/
 F:	package/postgis/
+F:	package/postgresql/
 F:	package/protozero/
 F:	package/timescaledb/
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

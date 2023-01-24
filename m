Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA56DC25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 06:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD2560E8E;
	Tue, 24 Jan 2023 06:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD2560E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUfwRHBHydgX; Tue, 24 Jan 2023 06:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91CC60E81;
	Tue, 24 Jan 2023 06:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A91CC60E81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17F751BF370
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 06:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6C16400FE
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 06:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C16400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HL8acbYSK59m for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 06:05:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0895400C8
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0895400C8
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 06:05:36 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pKCR4-0006GV-CZ; Tue, 24 Jan 2023 09:05:34 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 09:05:32 +0300
Message-Id: <20230124060532.335917-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9A6D6F5724DD3A0B60E915A56FB921C507276FF3A4351DE38182A05F5380850409B2EC3E6EE3F820D7460D28ED0FBB0B0F66C70603A0C01F923C4D94AFEA26486
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE716FAD50E497B9C14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375ABF1810CDE7D0E9EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEE6F255ACD8BEA32C3079F322E54319A620879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C091DAD9F922AA71188941B15DA834481FA18204E546F3947CA9FF340AA05FB58CF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063753733A85D94CE7A19FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16BCE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A598B057A6EC3313BA4D695730AADED977D30EAF9815860EFD4EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343536C6A4332D8B8A97732B5DE09489DC4580DE09B679A0A8C7913935E7A4F5167570F282F223C7DE1D7E09C32AA3244C92C2A63DBA3A3F216B5F8FA3A7B44BD263871F383B54D9B3729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj4ukhBIi/0FCkixaXTWSdbA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF53F38B8411F5B728F8719B3F9A38D261698CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=q0h6Cjr2Na7WbKBKty+BwUVZQhgdDsrua9HzjrSiIpo=; 
 t=1674540336;x=1674630336; 
 b=haqpF2ZfsqMfnyNoVvFUFuL2E4e25BDqaT8FKu95R0VpfUKpsIw+VdKxmoQ62hy33ZUt/td5SibeS/TB5MiLl2bSm/XV+snqoMGvqyu0CHn83E4PjJE/Z0uw7bpHLNHwqMX6hw73ZgYgJwtXPBwatlLIGXEqrn83Y3EreS++WsresDQ1T8YSnuMpMEco5gZiIEcgVZI+H2hXgwXOTF/wLmyagdX13GUW9kwSlTwMRMoUSTEWns4ubtUmslQ44xcqjHfZ/hrZ93tp6wjnYY49zA2FXfw72qFOhQBlGjkUBkMEE9heTruvkPQNJ0KzyYUkD1Aq1qZ1jZ7rQPC7O6lyOw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=haqpF2Zf
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libosmium: bump version to 2.19.0
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

Release-notes: https://github.com/osmcode/libosmium/releases/tag/v2.19.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index cb53a91c67..b055aa21ea 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c05a3e95c9c811521ebad8637e90f43ab8fb053b310875acce741cc4c17d6f59  libosmium-2.18.0.tar.gz
+sha256  6911a8ca8e81d49205357177982df908af11376919f93b814cccf02f1d4d63e3  libosmium-2.19.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index f7ced04de3..2725130e72 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.18.0
+LIBOSMIUM_VERSION = 2.19.0
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

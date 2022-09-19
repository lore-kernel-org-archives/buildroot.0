Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C851C54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 06:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C6C60B8A;
	Mon, 19 Sep 2022 06:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C6C60B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnocnL_Yk20V; Mon, 19 Sep 2022 06:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5759360B89;
	Mon, 19 Sep 2022 06:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5759360B89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B91DA1BF393
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 06:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EFFF416DD
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 06:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EFFF416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSMl7kfriH02 for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 06:27:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5657C408C9
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5657C408C9
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 06:27:05 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1oaAFC-0006aZ-Cx; Mon, 19 Sep 2022 09:27:03 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 09:27:00 +0300
Message-Id: <20220919062700.1095847-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9EBD81B01C038F8F36A57FB7662AB83D96380708D891104AE182A05F5380850408EB724181B1488084A3F69501E37222A50DF6C05F64BC08AD9A854F105831E26
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73AA63C5F29446501EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745476ED688D943148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D878690E256E36193C21AEE37D889423B86F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FCECADA55FE5B58BB7A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F4460429728776938767073520B1593CA6EC85F86D618001F51B5FD3F9D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B658CDF7FFE3EBBCC0089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5B92AD0F49A162917DE7E65F06B2D3BF1CAD91A466A1DEF99B6ED91DBE5ABE359ADBCB5631A0A9D21FC6CDE5D1141D2B1C765A53A99F17B9BD6D57C363421AA009F53B002FD84232F9AD91A466A1DEF99B296C473AB1E1421878B0D43A06A4C936638A446BE3E5C627BF0CFE790FC11A72BA7CCD254A1CF5E86CC74F0925D5E26B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3498EF79680EE3725CA960C21AC91825EC789480BE1155E8CBF2B1BA8FBBFD644E47E8894F93F508CA1D7E09C32AA3244C9DC3322DD5A5956E46FAE1BAD9D03279F26BFA4C8A6946B8729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYCidGuNEkb6Pxnl9qfWKnw==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284E3DE5BBD1FB92001EA9E996C8D122317998CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=XGqHpXMbA7mkBOfhLIPS/yK9+yCiJl0KGQyB8JoJne0=; 
 t=1663568825;x=1663658825; 
 b=CvziddzPsF9H9ApnFcjalcKWcZ19M9cgmC4/+SSges5gM84IX490Rq7hxosrCh78AZsx8bubOcOKY8d0/tjsE6HsAAfkzgV1NGMxXCd0+rNu8E+I441ibJaP1tA+VgPhoGxPdX4sXYAQtm9Vq7bN34j7xgbjqpbnKCxGiPG+/18VoBuULpCW+5KvQoku1+jeiIdjSmSeDVK/uAQxJB3YU1mm7drTqSkg7KX9qvI65zpBPwIhMNGXqvtSa7g3RonuppO5RwvZSz8KkKN8FD1sMr1W81bjuTIgOE2BXYjxpr0rgdmXhiBcMnxMuwL8VFndSmZiy7AnF3jzRLRIKJCV8w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=CvziddzP
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.8.0
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

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.8.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 281e30dd3a..8b43d92219 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  05560e0c37f702a377957adf96d8893c1ff437a8b4fd1478f351e40ba9730897  timescaledb-2.7.2.tar.gz
+sha256  a3403447805bb97f8b6f38dfdc9dde24c24e4389cf7f2348358774605ad2687e  timescaledb-2.8.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 0268712399..00fb7d9842 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.7.2
+TIMESCALEDB_VERSION = 2.8.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

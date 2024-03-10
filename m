Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF43C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 06:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2AD40798;
	Sun, 10 Mar 2024 06:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwSEaOESH0eo; Sun, 10 Mar 2024 06:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD454078D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD454078D;
	Sun, 10 Mar 2024 06:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2329E1BF384
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E7E860866
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 06:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUVtUUFEKCiA for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 06:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.92;
 helo=smtp50.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B406E60648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B406E60648
Received: from smtp50.i.mail.ru (smtp50.i.mail.ru [95.163.41.92])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B406E60648
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 06:08:38 +0000 (UTC)
Received: by smtp50.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rjCMN-00000004IdF-3MOs; Sun, 10 Mar 2024 09:08:36 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 09:08:33 +0300
Message-ID: <20240310060833.502635-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597D2604A3BCAEBFC93637641474DCE2D7B2182A05F5380850402931C5A944482185D4FF92D56319F1972770AF8F4A9203185B12244B3E127E6664CEF2ECF6600738
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75DF2B1F23425CAE5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E1D2769089B3DFB28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8065FBFF3E8794ECF2F284ED93A15F2C88158F54283AA890A20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C95C44B506FFBBDA5F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006379C15FCE41D14C6A4389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A558D1A806BA3B0D105002B1117B3ED696D0F37FDE765085B9B91D2EB2DEE3878C823CB91A9FED034534781492E4B8EEAD5B606B10FC07407CC79554A2A72441328621D336A7BC284946AD531847A6065A27ED053E960B195EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6CB46A5423973F9935ECCC89AFAE972B97CA132A71E3DE86AC70C83AD97366BCC2F598A3E54AB451748ED927723DE83FF053F5805250C03381D7406C18D3F9D920B7C08B0742F2C4111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojuV2YtZBbGDwmTEhKyYpSrg==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE338D31D750737735B7BD10716E2DC9F1200B972D9B22E2F45890DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=G047l2ZSVTW77g+H0O4wKRiBgu8HqbsAETlbgpwcSvA=; t=1710050920; x=1710140920; 
 b=gLA5PrSqUPxwCT4l4Ku9KKsLLt25Hy2Z1ntbqYtu0nYwR6nBPKd3nanTpbK2/JYzj0OIqUB0U3u
 UB0Q490Zn/bYn+Y176x86PNLODYxdaIFqyAogw4HqiNyFeYBndMkQDLm1KklDgOJm/334snjHIueW
 9Q5SGWX6yQaLAnEaESJDroqIFtmdPVGnqobA76jfeVGuyDMj3CO1bHZIb1c4R7ytzPqkSxU/X7Saa
 WRJLoU/nN4JRVFP+jd8HFey4yhxkkM+NCnEWbK6vszI4HBQlNkOFZUy07aHM05Jq8ENzgDBQyzkMZ
 fN3qvg19HD66gTi2shi6RXh6XHnp1VYrP/wg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=gLA5PrSq
X-Mailman-Original-Authentication-Results: smtp50.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.4.2
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

https://github.com/postgis/postgis/blob/3.4.2/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 2d2676d0d6..7e62e8e168 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fef6a141213d0ff27bf45b33b849cc396c22ddb1ffc6fed435469c9e891fc81d  postgis-3.4.1.tar.gz
+sha256  c8c874c00ba4a984a87030af6bf9544821502060ad473d5c96f1d4d0835c5892  postgis-3.4.2.tar.gz
 sha256  2a3bde0a77224496ea6d8efa686da7e29ab0dd6b1a8f90ba12beaf7ae28e878a  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 5f1c643ceb..867aa4caea 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.4.1
+POSTGIS_VERSION = 3.4.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

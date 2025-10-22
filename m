Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFCBCCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 06:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB7C83CAF;
	Wed, 22 Oct 2025 06:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emgIdN2-k5L0; Wed, 22 Oct 2025 06:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC01083CB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC01083CB2;
	Wed, 22 Oct 2025 06:31:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7551670A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 06:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BBB040B2F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 06:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lkKLFq_g0eZ for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 06:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.104;
 helo=send265.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7782840B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7782840B0A
Received: from send265.i.mail.ru (send265.i.mail.ru [95.163.59.104])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7782840B0A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 06:31:34 +0000 (UTC)
Received: by exim-smtp-d7d76ccc5-vtpck with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vBSNf-00000000SxT-12oo; Wed, 22 Oct 2025 09:31:31 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 22 Oct 2025 09:31:29 +0300
Message-ID: <20251022063129.84571-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD96DC212D1D15EACC47BF6291F42865A6BD33E313AA92BE3FB182A05F538085040613AC6B60FBC35D53DE06ABAFEAF6705F100308B48F643DE88EEF31900AC01F621E68012AEC8BD2D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BC08626EA5717D14EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B28EC8EA77B149B7E02E070BE324C7D3C402E54A715639B246BB0A4F435E46E6718B35066C979671628AA50765F7900637F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249835549CEBBA64733CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92EE3A9D0FB4FE0F9986DB53B01D1D7C7B8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3FB9365559B687AC835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5FAF63B46245EE8AA5002B1117B3ED696413C44AB5FCEC26E9E040399BDE4761E823CB91A9FED034534781492E4B8EEAD81B3E0F64AD3EF57C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF833CECA9B57281935C13D6A7C10C041C5145A50DCCC11966C324934C0DC409DA1D17C9D1E19253448AA9C62490FAB09466D2609AC832E99CD4274926B7F672176103D48FFECF7032111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEteHjG8R01D12P+ofnFFsLmw==
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD267BF2E95D669EECC371D7F5295203CD19D28EC99E66AD69690DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=peqQCRwfo9K/4+EhK7l6os2GviO1YS29BQGDb9o9djM=; t=1761114695; x=1761204695; 
 b=ZALlx2wGONjvBmbHjUkd06vK+El+eeHxX7DHY11eCP1cJUHUk5nVAr3lF1Oju8zPf0wRs6U52GK
 y8ueADFmpjGdk0/X/sqZ8zh82lkJjMXQZLy8/u1heeRYnKlUpIhBYYCZToseUNMVZNsZzPPqHEIJB
 80b5QYqJSM1YhV7VdhZYeuJ8fBPF5Ab4etj7rrcf3X72CtiAopDflTLBHlqA3W0GhBYCwuykbxu+M
 /PwU4zECvsayzOWiEcqqDB0cQt7gC1GqLO/fqFnvGKj6713NVmCNM/GUf/olv67PhsdTjyhB7yCRR
 HQJI7vsfTZlnrLfxVew3q86T1SdQDFfiJRbA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ZALlx2wG
X-Mailman-Original-Authentication-Results: exim-smtp-d7d76ccc5-vtpck; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/postgis/postgis/blob/3.6.0/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index c67a830ea4..2d205ff5b4 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  650e44de788d38175e3719df1d2ca4356bd987f54fe3d2030808de76464a2a06  postgis-3.5.3.tar.gz
+sha256  8caffef4b457ed70d5328bf4e5a21f9306b06c271662e03e1a65d30090e5f25f  postgis-3.6.0.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 2888403b57..a3a2756593 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.5.3
+POSTGIS_VERSION = 3.6.0
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

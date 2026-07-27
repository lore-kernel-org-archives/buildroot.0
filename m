Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE9BC531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 07:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C8660651;
	Mon, 27 Jul 2026 07:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYKKtOWIijys; Mon, 27 Jul 2026 07:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1CA605F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785137992;
	bh=2KTJE7ZFKpMnvsZ0nxTaxVV/i+FqNg0niBINf/vJJD4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Rvx8dxCR6vc1qDqfgVii01dN12AdS1XmXIU/9wakP/+TFuXmQCiGkg+iX5qH0L9uV
	 HIWQqldWQoBD8gC+ZaURS80efWEpHP+kERFoJAdV6daTBARyHki7hUjyZQKiMFrKMd
	 rcosHII0QeMDX4kfPNjsWXc62H/Ug7sfqET92DrlpHHa0zSeuuXrFm2jBrQEpzEJ0A
	 e4pJj+pBk6cxL5XvIPpIfEErOSeD4j99CVyToNbCfTZOt8BoN1v3its/Paq+DPZx1v
	 VdcGIdQaZAWm7luQvnBfglm5+flcMD3cKPooH6PZyYh+1SCMsGTXv7B+3x7qPA2LsS
	 biD6j3nopPGzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1CA605F5;
	Mon, 27 Jul 2026 07:39:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BAA0350
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 07:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D6C440621
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 07:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvcsB0MK7Kpz for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 07:39:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.201;
 helo=send106.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D76F40613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D76F40613
Received: from send106.i.mail.ru (send106.i.mail.ru [89.221.237.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D76F40613
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 07:39:48 +0000 (UTC)
Received: by exim-smtp-6c76488b9f-rhmln with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1woFw8-0000000024R-1zn0; Mon, 27 Jul 2026 10:39:44 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 27 Jul 2026 10:39:43 +0300
Message-ID: <20260727073943.77167-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93ED3C6BF6FFA701FF8A76E406820F599B2674E17FE637CF0182A05F538085040A3C219F611FBCB3D3DE06ABAFEAF6705797BA6EE28909BA2B5D9755D177B738125FF584C251F6817
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B7733D0215A2F71AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375666E0AFCC7CBCEC7C741A4EF86EC714095D60F06051E32EFC90DFAB8F21A90F6A38EEF46B7454FC60B9742502CCDD46D0D1D471462564A2E19F6B57BC7E64490618DEB871D839B73339E8FC8737B5C2249FE5EE7C534F234F5CC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C086DB53B01D1D7C7B8941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3335407143AA9223635872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A525C0055343502F5D5002B1117B3ED69681E2218B153AA7074869453249F34FA4823CB91A9FED034534781492E4B8EEAD528DE7AA5F2BD788C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659A4C35BC2627C75BABA42348F49E10926B8537A29F416CD7C44380131B20F11D278C025F839D3E21BB8341EE9D5BE9A0AC95DBD425FFEABFC6A45A832DE7C6168D245463310BD45BB8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtP9+WQQEIRI0e7kd3ZSWGjg==
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2ACB15412850D887F97FA9D4D9454D66F2F7DC8A2BE5F1E5890DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=RO5fqUdesyKavMPC5ZbqKLFCx4xw4YGvmSQ1nDqTMF8=; t=1785137989; x=1785227989; 
 b=ZUiLxaM3gJKrTRd360ZQjhLX5m5NWkAlBGPUpGsbV9ez8LyWYB4v5EXEJgpeARnXoNHprZlghwT
 7OF1zRejLul3pIKqjIpums+h/hGOgQkjHyfSt9fPh4Rx4nQ8422CiXGzDrzpg9ZZf2SXgBWeL5v4G
 t4yLJM4LnzhfuLYyWerse8WyaSJCu/2WEYEZEnPU/aIMPvYCQ/1EstWM3NtCZstovyCG3L3NR4IVv
 Y39vWMW1EAsn0dCCZFo3A+QSIEQL7EIzr28oXevKu35Ul8E9PdNtRUVz2tnooxl3JCIzh3LXpoP5M
 Lyy4DTciC3fGPrIaXbK4JmGa/y3I7bGPWMrA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ZUiLxaM3
X-Mailman-Original-Authentication-Results: exim-smtp-6c76488b9f-rhmln;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.3.1
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

Release-notes, since 2.2.0:
https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.3.0
https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.3.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 6c04d4e989..1e2a8f0c7f 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  567dad078f8a66d6d706ac1876b5251b688109d16974909d89ce2056d6e9f258  osm2pgsql-2.2.0.tar.gz
+sha256  e90461bd78787fd5cf82f73ac4bc0cfccbc4f498f35dce59eb4d168a380d6ac0  osm2pgsql-2.3.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index 10e64e75a6..66d693bfcf 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 2.2.0
+OSM2PGSQL_VERSION = 2.3.1
 OSM2PGSQL_SITE = $(call github,osm2pgsql-dev,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

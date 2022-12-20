Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD8CC4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 18:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EED54161F;
	Tue, 20 Dec 2022 18:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EED54161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rn3lsU6YNez2; Tue, 20 Dec 2022 18:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 929EE416B1;
	Tue, 20 Dec 2022 18:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 929EE416B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F22211BF2AA
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 18:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7A8E60F91
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 18:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A8E60F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzaSIxY2ecmg for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 18:03:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5096260F66
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5096260F66
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 18:03:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.184]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N6KYl-1onLt53y4f-016drr for <buildroot@buildroot.org>; Tue, 20 Dec 2022
 19:03:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 19:03:06 +0100
Message-Id: <20221220180306.17253-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:UbD+jY/F/kHQoPvJAlN/CrP7DUWIm4sIDXZMBP0IkM1XbDAOBIx
 +hiGnxeBjppGyr3dOwgbj/4xy8n7UZeRU41HkSpytfOfXtJcvJ2rLChUgAGKH4TFCk/rTTN
 wx9HloJySYCacSHrmrlKLI5SiTaejwKcqrgwTjoPxvPWv/VfaY17kuuSuVyovwmRck0hBFQ
 X9bHzqio3EgQafdF5SXnw==
UI-OutboundReport: notjunk:1;M01:P0:qdMyOGpVFhQ=;7Rw8uXk0bLlsshFWrMotLPKCmit
 1meqjjtsoKaEHuvhoIm/nlQ5crd0VntjFHtO3z0K16K0tmxp2aBZLLriAbb40cVKSZkeYZO/B
 I/9aqo77iNVNtiMI2JociH41VulkXpXt4W8gDM+HQ+sDHvOcMAJrjnPYMwQhdebDmTHpGsYYH
 wYkEN+z4tT3ZVprQcHVfXmtG9RMsSK9ULCqU0GFqab1S2ToADXA1WnUaX7V0YLqoNA7I8vTQv
 YBtT3o2fi5z449OMWfANyLP2264uS+0RWSwG+FOilDHRav5hFOZdRhQGSE2RRBaP++oNNBk49
 MtVxjP+12jYNmHTzNB0JVXryZbPrtA++eEj52Xfe+gezwflcjNdW86Ql68PdNZ2py346ieRRz
 yxPl/st4SKHOjhw40z2DGbowpEQe0MpscDMVEK/MmDxzM3GCPUZIMz0A5RMqjTTAoPEZ/QCve
 /+V4SuD42O4A1Fzv88zQIAIoy8yB/uc+RZyaQz9aFImVnlE1NHCS1nO8VJSyD6d4WOqG4Sc7D
 AtDGwakBGmSfgElU4b/KRD0gOLDBmq8BW1l+4erTyzguJ7QfFDhnYC9A7QSHpducQblCHvJZX
 vF0PGJKrQyWF1X2B4fS9W5BsUbzf3+GO5qjodk9Y6xPjTWEHPgxk+Yg/llwkOiNBBqznelazs
 g+QvaBj5qIZpqp/1ZjKn8NM2yeqff8aytYNbuReww9FCR91ZJ9zzTwX8uOOYIJ3c6/fi9a3Qs
 jNNv9ZveIxIRN9KcFGHOzuB7kg8myqvgQXHv9mCN+Hj7TdbvyvTg7jpMNkzIhxW/ytsEOx/le
 +CRLsmEU6DZ0z6teGYExrxVqzC9A2Zmbky7prQPElcJF4mrXKRWI0gFxffHqzajRPeGdDw0/O
 UoQGyIGz6fhRxiN0YaMqq8ZVGRimW4E7H/Rcx86F497gKzRQP65BgOzmbYblA+NXeG5yhHtIw
 VlHTQw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1671559387; bh=5sL2wNOcYjH5eIgpTv0D38nrM+LnxsazJQgR1dXwc4o=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=PjQRZKCmqelvARJYsHOU1+6imH6lZk1DzfCWd7X47jwzeDZRd5U6owXErGgwiys9W
 jy+V1m22wBA6SLAgesfhoDh3whfZszsyfM5rMUWZ9d3dmAFqAovCs7o6JyCRcrfsNu
 zbgjCvRFPEUlwcC1dyV/J5qp/rm9tKtaFWEZPVXdriLj42ZjDNXUPJI+oDw0XUhxGO
 jbAa4m2kRjtrTdWhu9er6CeK6ZhnTHsJl+hHNrCQ6J6iPgXNIw1t8qPOn6VPgELzyy
 DONoRHivc9BLWlAi3eCUVR5DyqT0vrX5WUH7uHuvUFVde+eOzh6+oviGCCpADlhpuo
 XMfi8IBOdIYAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=PjQRZKCm
Subject: [Buildroot] [PATCH v1] Config.in: update default BR2_CPAN_MIRROR
 URL from http to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

- the mirror list URL http://search.cpan.org/mirror seems outdated
  (re-directed to https://metacpan.org/mirrors aka 'Not Found - The
  resource you requested could not be found.').

  The closest matching URLs I found are:

  https://www.cpan.org/SITES.html
  http://mirrors.cpan.org/map.html
  http://mirrors.cpan.org/
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 3c57c591a8..c318223d1d 100644
--- a/Config.in
+++ b/Config.in
@@ -287,7 +287,7 @@ config BR2_LUAROCKS_MIRROR
 
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
-	default "http://cpan.metacpan.org"
+	default "https://cpan.metacpan.org"
 	help
 	  CPAN (Comprehensive Perl Archive Network) is a repository of
 	  Perl packages. It has multiple software mirrors scattered
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039BBFB5192
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 04:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 995A540A76;
	Tue,  7 Apr 2026 04:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0H0E-yr81uE; Tue,  7 Apr 2026 04:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3A2340A70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775537351;
	bh=TYNlyeKPWO8uwpToU8efDVnginMRczgi0qA2fE3fZCs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RPxHJx4CRK9pO6wGzbTN8xZv5gH5HB9NiMErcMtjmYOR9L1o+6Jd0Hr2x/9hKvnCy
	 kR7vEvsQd3sEbiPXbcPi2hIw2ljkpOB3nFmWeEeqtsMvFKd3sQF1xT40RoqCFnG67Z
	 qxIe6HtODCpjVK6lIbVHf+tj1OrI1XSpYRfYN5hXS1obSfdFK+Jv3iR807FLOid96o
	 AmM5RtDzKqiGyf5uyfoUaQtbfwU216RjfTUrojSUKYXSWL+Is5/tQeCT0kTK5TBV94
	 Eo7unNXiSh4W043l9UaSGjt0Skdj8hPc4bMmDFAflU1budq837YXZTTbOE/Oei7JGs
	 lD6meeBq1ipAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A2340A70;
	Tue,  7 Apr 2026 04:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 506422EF
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 04:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D77A608D4
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 04:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-2BJ5ZqQh78 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 04:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.12;
 helo=send173.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63501608B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63501608B3
Received: from send173.i.mail.ru (send173.i.mail.ru [95.163.59.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63501608B3
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 04:49:07 +0000 (UTC)
Received: by exim-smtp-69889cbf87-9dbhw with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1w9yN6-000000008nn-0M5y; Tue, 07 Apr 2026 07:49:04 +0300
Message-ID: <88257b11-e0e4-4775-b132-b7fb57c0ff3b@inbox.ru>
Date: Tue, 7 Apr 2026 07:49:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>,
 Phil Eichinger <phil.eichinger@gmail.com>
References: <20260406182217.1853895-1-bernd@kuhls.net>
 <20260406182217.1853895-8-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260406182217.1853895-8-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD949E5EAB5516A89290DF06F0D2DF8E3E79F6E52EAE14C76E3182A05F5380850404C228DA9ACA6FE27530A7924BA2D0A0E3DE06ABAFEAF67056B73EE4E9D48CE4D37ABDF3A0C4F9CA4E4D8D3D339598BC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E3137013C338FE3BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F88016AB904663428638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B295D50EEEB9BB0AF52E070BE324C7D3C45461BB8BAC75CCC9BB0A4F435E46E6718B35066C979671628AA50765F790063783E00425F71A4181389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0B27420F9988F54058941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6F532FBFD8162E58CCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE754A400A07F115C59731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A53599F51824D079F35002B1117B3ED696C6BB061DD1A955A4715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD37F46C620FF2CAEEBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F96AB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659497FA5921E3AC1DB5EEBD092C530FA8B115ADCBB1BC33BB6C471E44081812D119BCC84AEC2CA907EB8341EE9D5BE9A0A99B287CE7CD7291D1AF9E8710121A38901F9A146730299BC721D270AA2B885D14C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVajF1spCY9aaBryYAKlNAy4=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2549A156686162EA4FC20827FE094204355D22FD9320A017790DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=EnwpKZu695MMOuUGitsXLnj2pwAxMrSJBcBxzx2wOxs=; t=1775537348; x=1775627348; 
 b=B0NdaKIxuhvtpT5caJ0j2tZ0xwyiZu4TFsnP5hVICqaDiu3sA643bNJUOx4r9k8TrJkc+dbib27
 y1imVd+y6re+h5vjNbGp/UajTIfQydt9DBbCJETjMoQEmE/4/81dHtsp3x322f4rhqtfhYraQpCxP
 V98nfTGf6Q38d8BLQjjgFYWfadAf25mb7Q71FHDRLUO84pn78sw1xWBkGGPmEW/ls/ZZ5YibtFiNM
 4c90ETqmlm2b7W9LZVCSarHCsDBiCWKfhGJfyVue6cyCUW/wdaVJwxXlQa8rVP2r9PcL5ccAA4hYS
 X3xuAfOwzbaVTbGUI0UuWNMSHmjD3qFPFyMg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=B0NdaKIx
X-Mailman-Original-Authentication-Results: exim-smtp-69889cbf87-9dbhw;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 08/11] package/postgis: switch to pcre2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

06.04.2026 21:22, Bernd Kuhls wrote:
> Upstream added additional and optional support for pcre2 in version
> 3.2.0:
> https://github.com/postgis/postgis/commit/6cf2fba94a434e79d6526a6a5cfdb6057a91bff8
> which was added to buildroot in 2021 with commit
> 5084994d3f6dce350de091cd813047e658b9363d.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

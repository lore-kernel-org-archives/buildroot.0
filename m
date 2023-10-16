Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF88CDB474
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 08:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C8F613F4;
	Mon, 16 Oct 2023 08:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37C8F613F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXNIoCISX5vo; Mon, 16 Oct 2023 08:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1A8613EC;
	Mon, 16 Oct 2023 08:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1A8613EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AECF81BF954
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 08:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85E474037A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 08:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E474037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYcXyHQT9bMd for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 08:35:17 +0000 (UTC)
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0084840363
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 08:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0084840363
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qsJ4D-0004DH-Ce; Mon, 16 Oct 2023 11:35:13 +0300
Message-ID: <e13b9d56-237b-443b-8606-dc477218d566@inbox.ru>
Date: Mon, 16 Oct 2023 11:35:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231015201449.1279312-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231015201449.1279312-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD978AFEFB3096932CF067259BE5129BC25732DC641AEA930A1182A05F538085040127C6BA7EFAACE4AB95A840E883727A97925CC3AF77B8FECA7ED626EE96384DA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78981306C6E927004EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063795DC1BB912715AE68638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D866FE481B314C46C7AA0B3BB825965C726F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE79AE9BAF3542BD4619FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FF04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B63AF70AF8205D7DCA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249D6FBC3EC642A93BBE827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B60A62CEF541B197C8089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A511C0D6FD44EC687B1165BC3A17B4C5FA74B990DC9A047147F87CCE6106E1FC07E67D4AC08A07B9B01E44367C8E80A7B4CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF8CF9E59F3171680916A77BEB044CE4B9E0A40F43624B1C3CB54EA8469A28E91BF31E0254ADC75A06EBFDF7752E1FC337D7FA44B5825697065E3F7EE7F7FB90D540B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojaEe5+VLEN6ndlCnmDLuVQg==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986BD8824575804607AA239DFD1DE4015E5198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=VP07ykd5NWP/nhv4saIa55GxNSsUofiZBbFQOxi9WlU=; 
 t=1697445317;x=1697535317; 
 b=FLlNvl+zNXiS6hmeivSWSUGG3oV4wzXKeqgUsyK1Bw77EeRTROcEE64VYXy2Xi3C5OcXZ91FwC8+tXk+d3KmFPLiKDuZg2BG6QYXAviOSyQt1Jlgym1M73Dq+R6dPSreAB+VpnwfHGVmkiaJS+zgPkCKBpLdGCzGJr3glItSZA+GoyP/5nIolSXkz5ZPwH28X1a8yfUvwG+EiiETghXsILKgp8PvivTgtiVMs+eUCCokcIyjdFYMSqaNgm6J6bakkq6+VWC9ns/tJf9OxoPxVaTrIWELn2w2AuKSb3cZ2P6i5pu6fQrmlx+sxnFNwBGIy9TPMYT32qZgP3gUO1y0ww==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=FLlNvl+z
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: needs gcc >= 4.9
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15.10.2023 23:14, Fabrice Fontaine wrote:
> libgeos needs gcc >= 4.9 since bump to version 3.12.0 in commit
> 16727d4595dd1972a46e92bbd2260a896cc19b60 and
> https://github.com/libgeos/geos/commit/289ed4efb26a9944f4385381e1574184b1e7448e:
> 
> In file included from /home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/src/algorithm/ConvexHull.cpp:30:0:
> /home/thomas/autobuild/instance-0/output-1/build/libgeos-3.12.0/include/geos/util.h:38:12: error: 'std::make_unique' has not been declared
>   using std::make_unique;
>              ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/56bb572fb1d56d45dbb950a73b9b888239fa6968
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

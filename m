Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555BFC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 05:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B9A9416B5;
	Tue, 14 Feb 2023 05:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B9A9416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T553FVq1AHhn; Tue, 14 Feb 2023 05:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2AB41621;
	Tue, 14 Feb 2023 05:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B2AB41621
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4F481BF34B
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 05:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F6E840272
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 05:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F6E840272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KM_RBCjYK7cE for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 05:20:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 204AF400C4
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 204AF400C4
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 05:20:40 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pRnk5-0002rD-IZ; Tue, 14 Feb 2023 08:20:37 +0300
Message-ID: <1c1cf3a6-fb4a-fa1c-dd09-29c0ac1a23c1@inbox.ru>
Date: Tue, 14 Feb 2023 08:20:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230213181217.908103-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
In-Reply-To: <20230213181217.908103-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9806C989EC2150E33181E03CED8DE9BF6D6EE14565F1E5870182A05F538085040EC5BFCDA8738BD0495D14CC6C589C262F751C277233084E75485BF0B6DC5E796
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7370F4F695FFFC24BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370CE4B4B08BC34B6C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C1FF90F79B5D9886FC52835BFB457A0E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE759A2DA0C93DFCD719FA2833FD35BB23D9E625A9149C048EE7B96B19DC4093321618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2A68AC901FE7BE8A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F1ADD4D8CD3C81CE5851A77E30640FF29DDCAD52F7D2B708E7AB69E1814B572E6D7E6099AEBB22511D7E09C32AA3244C348613BF304B0AD9EB0DF98313AD3EF763871F383B54D9B3729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojgB/I+mAIlFF33w0dLsOwjA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5B07E76836255B62E91DF32C45FAFFAFD98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=M9RSSlpYv5WlFJat8yyxf16t5VL1IBNKogUxp7aGa1A=; 
 t=1676352041;x=1676442041; 
 b=CkXP7Uilyzi5zMF0cjrDW61jAtbCIEptI/N96Vxly8fuQ90WD+r4YrcMnJ3oXaZ64K+tc9mM7F5PnktJlAjYhTnURGWsth4TiSBGnzguG2XJTSdlMl2jqH0iZIJZfAvgmyHTmCjYW/hAujytmUjM+IjNSZk9cX7e6IH76D+x9KeGLASppu1FgyH5/7DSvZrDqrIQiU0aYa5UiODl6LqWEZESRIsq1jyL6B1HrSB0IczbxolhiUHIpQDmXUCJVsFDp1f3nNBxk5P2ClUoQ4NsF2xnzMcgSpgdvBUU4RgZ+mznzPn4XfLndwXb50OKO7ex12lCYA5wSMJjH4hz+NV37Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=CkXP7Uil
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix legal info
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



On 13.02.2023 21:12, Fabrice Fontaine wrote:
> Commit 57e297a215193c92f6a178139db53616f2ee23b5 forgot to update hash of
> COPYRIGHT file (year updated with
> https://github.com/postgres/postgres/commit/1fbcb1360bc19b89369209203ea7cc19b8cde224)
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/93f40dc71619745ddc6741598c9a488c81ea440f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>   package/postgresql/postgresql.hash | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index e6a9bd6658..3e89d3ec35 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
>   # From https://ftp.postgresql.org/pub/source/v15.2/postgresql-15.2.tar.bz2.sha256
>   sha256  99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7  postgresql-15.2.tar.bz2
>   # License file, Locally calculated
> -sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
> +sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

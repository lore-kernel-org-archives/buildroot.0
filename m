Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF25C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 20:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C40F402F2;
	Sun,  4 Feb 2024 20:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C40F402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbDNzDMR65WV; Sun,  4 Feb 2024 20:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1556F405A9;
	Sun,  4 Feb 2024 20:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1556F405A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0071BF3FF
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23A42607BC
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23A42607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0EhK_2f_uJr for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 20:51:08 +0000 (UTC)
Received: from smtp17.i.mail.ru (smtp17.i.mail.ru [95.163.41.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF56F607AA
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 20:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF56F607AA
Received: by smtp17.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rWjSA-0000000Cgse-2QOY; Sun, 04 Feb 2024 23:51:03 +0300
Message-ID: <f511df7b-d0d7-4a99-822c-3828ffbeb635@inbox.ru>
Date: Sun, 4 Feb 2024 23:51:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240117210756.265708-1-ju.o@free.fr> <Zazgd8sRYiHBY1CB@landeda>
 <871q9sr42s.fsf@48ers.dk>
In-Reply-To: <871q9sr42s.fsf@48ers.dk>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD98F777A40C4FF710D8457D960C95C04AF5BE5BDFB866F79F4182A05F5380850404F90722B1637F1800578E6996F383413E06ED67ED3D178A03CC78354B106C784A7427CD01E6BCEC9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75DF2B1F23425CAE5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DA5CEC9EE7F170198638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84A84BB865CF943D3E55F10C3E013214135A108F52433410E20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0DEC8C2C8BCD2534D8941B15DA834481FA18204E546F3947C62B3BD3CC35DA588F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637CA37C9946A8B9E41389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7358CCB3ED2A1DE2304C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5D31C19A76BEC1F605002B1117B3ED696CDF96720438D0503CCE9A60C8CB01D7C823CB91A9FED034534781492E4B8EEAD3B72D73EA5828B68BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3451BBE684D17D72213AC2DAE3B20E65F617EB910169D27C0AFDF365AB423C8221CC1EA570457639A31D7E09C32AA3244C2BA7A99F277BC3EF4EB7DF677E51682DA1363735EA74EB5BEA455F16B58544A21C197AAF4D2E473257ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYmKAdD5iDVhCFBbrNFXUbQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE331ECD67F6AC5BF3A928BC5692BD4F8062367075BB7FF4270F90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=jiTlOAsR56CuIKPhH97ll+iEoomq4tyJgVbcfb0CccY=; t=1707079867; x=1707169867; 
 b=oEUCKT1n54jYExSCKMfxVS8CHd1vCgvNs4RJMVNlbKmD7riQ2Qhj69TmQixIXCG2egl4OMzuQx3
 bEo2PbqX93dz8QL6GOvo4eNWqCyGu4sr0zJvqSV6s8KEevYpXYvCGE50/O9WUqqa6wrZcocCMcI4K
 Nbu9jEzfnw7JTVbPSN/35A3IMrKN4vM8pcre5OpdoTCTw9x5JJt0/mnV+aLd2zh8HULn3DyTFoaEn
 wjas3PveLXzC1d8VkohzYbocRDjmgbUr+Em9xHDsN0iliK+wiwMf5myOPJKRuA/R2JCTV9sIZZmRs
 SLV2fTjcz8vc9Nbs2Vfmccmhz1LsXeg2XPtg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=oEUCKT1n
X-Mailman-Original-Authentication-Results: smtp17.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04.02.2024 12:06, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>   > Julien, All,
>   > On 2024-01-17 22:07 +0100, Julien Olivain spake thusly:
>   >> Since commit 2a8065e "package/postgresql: bump version to 16.1", the
>   >> postgresql service fail to start at runtime with an error:
>   >>
>   >> FATAL: could not load library
>   >> "/usr/lib/postgresql/dict_snowball.so":
>   >> /usr/lib/postgresql/dict_snowball.so: undefined symbol:
>   >> CurrentMemoryContext
>   >>
>   >> This is due to the Posgresql autotool configure script trying to
>   >> detect whether the toolchain linker needs --export-dynamic or not.
>   >> This test is done with a runtime execution of a test program, and
>   >> therefore cannot run in cross-compilation. In that case, the
>   >> configure script assumes it is not needed. See commit [1], included
>   >> in PostgreSQL v16.0.
>   >>
>   >> This commit fixes the issue by forcing the value in _CONF_ENV. The
>   >> package has already a Kconfig dependency on !BR2_STATIC_LIBS, so the
>   >> value can be unconditionally set.
>   >>
>   >> [1]
>   >> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=9db49fc5bfdc0126be03f4b8986013e59d93b91d
> 
>   > I've added references to the ML thread upstream, with their position
>   > that cross-compiling is not really a supoprted thing.
> 
>   >> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
>   > Applied to master, thanks.
> 
> Committed to 2023.11.x, thanks.
> 

Not needed for 2023.11. Because it is still on 15.5 Posgresql version
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

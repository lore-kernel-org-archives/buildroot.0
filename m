Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2756C47077
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 05:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358CE42124;
	Thu, 18 Jan 2024 05:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358CE42124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHFsqcvI8JyA; Thu, 18 Jan 2024 05:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873584211C;
	Thu, 18 Jan 2024 05:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 873584211C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAC5E1BF41B
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 05:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C390C83C2D
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 05:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C390C83C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBboQ9lb_Iye for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 05:30:09 +0000 (UTC)
Received: from smtp38.i.mail.ru (smtp38.i.mail.ru [95.163.41.79])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A09983A92
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 05:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A09983A92
Received: by smtp38.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rQKyZ-0000000Ekmk-3CMq; Thu, 18 Jan 2024 08:30:04 +0300
Message-ID: <ca794760-0fc4-473c-9561-c602e816ee0e@inbox.ru>
Date: Thu, 18 Jan 2024 08:30:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240117210756.265708-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20240117210756.265708-1-ju.o@free.fr>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AE5B4AFB3AE2A5903BF75383F3F9E5C7DFDDEC3DF03165DE182A05F5380850400AAF9C5448E1FD9D03ED270C30F246C530C6A2C12811C4642D8C2BEB473E5E0E906DE0852CB23BE4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD2F2D6F6013FF7FC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE74BE895B46187343CEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B73AB1701401CD871E908A705F6A269C8B1D3B9E1F2044A08BD4AF7916836EAB31DF9E95F17B0083B26EA987F6312C9EC9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7E9512AC99003B6BE9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3BD39A56654533F91117882F4460429728AD0CFFFB425014E868A13BD56FB6657E2021AF6380DFAD1A18204E546F3947C2FFDA4F57982C5F42E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F616AD31D0D18CD5C262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A56C936D5B3D116EB85002B1117B3ED696A514574892A44C3747A99E6294EE8661823CB91A9FED034534781492E4B8EEAD45F93BA578C2B99FBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34E3E1DC0F9BD55309602343113F4FEDA6BCA0F460B514AAABD666F550EF1E3B25EE12782CB4F0F02E1D7E09C32AA3244C12B33AB083BAF803B58A6D757C7509E21AF413E30BA511ECEA455F16B58544A2E30DDF7C44BCB90D57ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojjkiC0IEfsqKXhr0P8fSZeg==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33AEB11ECCD59CF3BD43BC41E6A19623287B5FF90622A7888190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=hQO25RWyjececDfFJrAMAnnsWIfK4jw/RA3nu98w+s8=; t=1705555808; x=1705645808; 
 b=iC0/axOOmDovK8h3SMzJYrkvLZgqJ3rtyqxa2TeE2+U3izxUwqPa4snaJvEs6J6YDxhuE2ZRrIc
 uqNJv6eGgAfoPOnIiHy2HIuUlonIFdP7cZfZ4X7DECrTexGKFJUbg+NVSULgf5RyfbGCFaH0sIYJ9
 IHrnd6+X/6XJ0t3OYpwTejX04ekh70vUWC7UzHaAh64FRK0kLc0pVzqFrIq8wZai4oWUtieTaOCOh
 Wx6EW6lQAOsgKcbsfCqeh6Ud4zvGPJIibqcWu6Fxsxr4grI6W6mgnTmca/Kbv9puWeCEdnI1UBMUx
 qOaw+gUkIzoYw5PfoPRbiY+JFXm83zyvMZvw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=iC0/axOO
X-Mailman-Original-Authentication-Results: smtp38.i.mail.ru; auth=pass
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18.01.2024 00:07, Julien Olivain wrote:
> Since commit 2a8065e "package/postgresql: bump version to 16.1", the
> postgresql service fail to start at runtime with an error:
> 
>      FATAL:  could not load library "/usr/lib/postgresql/dict_snowball.so": /usr/lib/postgresql/dict_snowball.so: undefined symbol: CurrentMemoryContext
> 
> This is due to the Posgresql autotool configure script trying to
> detect whether the toolchain linker needs --export-dynamic or not.
> This test is done with a runtime execution of a test program, and
> therefore cannot run in cross-compilation. In that case, the
> configure script assumes it is not needed. See commit [1], included
> in PostgreSQL v16.0.
> 
> This commit fixes the issue by forcing the value in _CONF_ENV. The
> package has already a Kconfig dependency on !BR2_STATIC_LIBS, so the
> value can be unconditionally set.
> 
> [1] https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=9db49fc5bfdc0126be03f4b8986013e59d93b91d
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

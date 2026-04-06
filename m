Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF41E9D834
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 04:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6199880F3E;
	Mon,  6 Apr 2026 04:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnEa8i7Z59gI; Mon,  6 Apr 2026 04:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A2080F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775450667;
	bh=6ncmQrqTtiIuSVCfubYWo/f5W6YKkPg6VmLSM7uXEww=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sy1M1gaSbg4qk3Hw4ZpT9n6kXj+FMjc3FQUGAI6MP3UYOyJXh8SlQwEToBaqMzKn5
	 PIaVlu8TJ33sm4++UQT7KUbthfgeeLyUbswVmEK6ABYesZjj57GNMyllnAHJ6CTX19
	 +Kwk+EJ/r/EecBPH/M/+2EP9ketWzGj/mLTHQSMdzHc03b4sgqGNhPjqh2/PHD8yzy
	 LYMq/X/5SAR68MVbD7k/S5dC+ScRfNFqUuneHHyl797cmPxDZcTAGymf+iNkCxf+jr
	 V4ZcmDKeI0mEQQUU6e/M+rAvU3GvB9AU3/obEDdueKjeIP0BfoU+/VFcmIa/icqlQt
	 rv+uQSl0kn1Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A2080F33;
	Mon,  6 Apr 2026 04:44:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF923219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 04:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0E7A80F33
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 04:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcoa2qNpZwW2 for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 04:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.242;
 helo=send147.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FD7C80F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD7C80F29
Received: from send147.i.mail.ru (send147.i.mail.ru [89.221.237.242])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FD7C80F29
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 04:44:24 +0000 (UTC)
Received: from [10.113.75.88] (port=47418 helo=send36.i.mail.ru)
 by exim-fallback-7b9c6d9755-8gttd with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1w9baI-00000000DIr-2na7
 for buildroot@buildroot.org; Mon, 06 Apr 2026 07:29:10 +0300
Received: by exim-smtp-97b5b6448-ccztq with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1w9ba5-000000006fL-37OL; Mon, 06 Apr 2026 07:28:58 +0300
Message-ID: <4238879e-3d0b-412b-9100-2dc60d3c7228@inbox.ru>
Date: Mon, 6 Apr 2026 07:28:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
References: <20260405121524.2590079-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260405121524.2590079-1-bernd@kuhls.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD931A1A7E579CE6E95105F6AA6626B916E24702EE52554BDC1182A05F538085040DC9AFEB6EE68CA933DE06ABAFEAF67051D13A9A2AFC46DF20669EDFF56B1A9A229FF1465CC0F6BAA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C52EE14043FDA5F1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F88016AB904663428638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2914B3531E2F07F092E070BE324C7D3C4FE5DA8E05CE199E7BB0A4F435E46E6718B35066C979671628AA50765F79006377CDACFCF90986062389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C07734D68A6916D8318941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B66EA1BA7CA28B4A74CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF27ED053E960B195E1DD303D21008E298D5E8D9A59859A8B652D31B9D28593E5175ECD9A6C639B01B78DA827A17800CE7A3CCBC2573AEBDE1C4224003CC83647689D4C264860C145E
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A52DB93956419CF0F35002B1117B3ED6967FA0D48A5FA198B8A9DAB4B68AE4D22F823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34CAB70F9BE574AE9C625B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6595097EE9279C979E667CBD4BCF9FA9C82B9D76447714D339897111BB5BA3898482B79D96CBA0C74DAB8341EE9D5BE9A0AD9C40063FFE926F54ED02CC49C473A4E4968E3292AF9E6B46536EB022892E5344C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVajF1spCY9aainnF5bUpIYo=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2F83147F7CAF51C9B6416BCD36F0EF91D81738D1EC743F4DB90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B43AA9A89F3DE39AFEA3943CED1824E4A5A54A6E341E7257F668F3CF0E9FE49B696FF3FEA7B950DB02937750C7C91B3A5FB7FA4EA45F1EF670B30203B3CE2563E8E3616D31FD664294
X-7FA49CB5: 0D63561A33F958A59D5EED9AF032DC725002B1117B3ED6962CAB18571D5876600CC8CF6E17EE77BC02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZHDMnEWPKvHYSyYVSgZWe8Q==
X-Mailru-MI: 20000000020000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=cG+TJ7JYGnxXuHkxyO8fS3N79a7EVajseN9Ob5aZ/2c=; t=1775450664; x=1775540664; 
 b=Ftm0MS6hnEKNe7P74cRRixm3VBgisquUQLOa1vM3/7is7vpGDcnglR2L5HYdGJhN5UtoqQUE2Ju
 sOms5uClsaCW1+U+BizeaLoO3rzQyVQLGI7kga6gIIYMicSnAIXdyj9yEcISBCCKI9VvbQTDfFEaT
 PDiKVUiXMLUmoifqM4pkkY40Kx3uRgdPvHk3FrIpmYf+ile5WKBKN12Ri0dflg1yzyol1m/STxS2/
 XznhGBmxANOqxgqRg5tcbwytDGxY7/3Je+3H2+3l9FFE8fiETxhGjHVIPl90Bn2hvHW3ue9CyLw9W
 mGAm7MrUJbdWxZRGk174pAe3KyazaALtG67w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=cG+TJ7JYGnxXuHkxyO8fS3N79a7EVajseN9Ob5aZ/2c=; t=1775449750; x=1775539750; 
 b=M9562I79ice2H54jCnwPvSBoDRIP7f1nlua8KBcGNU396hjJoinY1maSccHMtGavJeun8Xhwvq/
 oIkwwx2LXXD2ii3I2EdGdaTqqtN9EEHGyafqMshOQJbf4bGaf7FtPCDdc766oCSMYSEgRjn8UvEYA
 NLsJ1TbT0JFqKT1+9QzIRUNMrJ2/igH28hOhc4FgPt1e5UQVfQ/ORZYXM781Xi8gsmGMmvUq7fGfI
 6FehsuQq64JQJEZc7xNo7+VndrQJoQicvRM7wVh9+v4d9GynUwReEja6kZ1VUnkDtg8u6EAEthMP7
 gd1KOSPqSdeYffVnAUWyNy5vPuENPRaRfgBg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=Ftm0MS6h; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=M9562I79
Subject: Re: [Buildroot] [PATCH 1/2] package/proj: bump version to 9.8.0
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

05.04.2026 15:15, Bernd Kuhls wrote:
> https://proj.org/en/stable/news.html
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10615E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 08:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B415240252;
	Thu,  2 Jan 2025 08:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDTEny9_LCap; Thu,  2 Jan 2025 08:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA864026C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA864026C;
	Thu,  2 Jan 2025 08:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C03B4F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 989BD6063A
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNFcOHldiTNz for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 08:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.80;
 helo=send241.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1569260623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1569260623
Received: from send241.i.mail.ru (send241.i.mail.ru [95.163.59.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1569260623
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 08:51:22 +0000 (UTC)
Received: by exim-smtp-bcf9586c5-442wp with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tTGvH-000000006z4-1WUH; Thu, 02 Jan 2025 11:51:19 +0300
Message-ID: <63e75637-9c31-42e0-a5f9-1b9430882a6e@inbox.ru>
Date: Thu, 2 Jan 2025 11:51:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20241231091019.1578462-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20241231091019.1578462-1-thomas.petazzoni@bootlin.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD97C62A2C8925CC6473F1CEB7CA3B899951999DBA140A61241182A05F5380850402B86A661AB67B5B33DE06ABAFEAF67051B1D6F45430EC2BFCCA40FBE8E6F6E63D6CDE72A09B3180C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71EEA4C46C73542F4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637670E1B164B70895C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D808967A04ECA2B0C521FB2D9B95F4E5D34A0E24518617A7A120879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C04CF195F1528592878941B15DA834481FA18204E546F3947CC2B5EEE3591E0D35F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637712AAB6D9D366D8A389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E7350555CCFDA08FA3FAC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A56D76CFC4195832465002B1117B3ED6969CAF8395C9BB5767C638DF663A625AFA823CB91A9FED034534781492E4B8EEAD47A3109F1ACFD409BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D346B222596F62B8FA9311FC698C60B56AD4A5AA4CF93E998CECBE2EF9496AA8FF97D704F80B4706B181D7E09C32AA3244C14E6926EA8AEE16C77DD89D51EBB77422664A874DF448AD4EA455F16B58544A2E30DDF7C44BCB90D57ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojkdn7nI2SqQIxs4kRqsoQEQ==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219DC36E3300BCAD7DDD58CA205E90EF88EE135C601DC624DA590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=Fm+mHXnua58GGEa1DQZf7PqzFs9IkZfFle+m0pll818=; t=1735807884; x=1735897884; 
 b=RgLUil7gk8CW97ffxC+hs/NwJ8SE2JBh7VtmDqH1YEWRg5j6Q5b7v6OIObdtPP3LoNKbh3YiuUz
 WA/7JZV7YkGhagvT2BX50asN5gL8RGh4Ey6jZkaMPZMacHU0QDbjlDtMtgEi/mfPtrVtb01U3q+E9
 np8KYZVtueW/COC5HL/no0mo4rUmeE8N5dkAr2spxJvDyooom5HgJM5GfsGs1Rt679TRKqlQqU7pY
 Xie2Mvb0hpdXvWVYzSuFX2AV5s2kIq9v+VlOZt5+YBwihePho1dHnXEeqO1k5F2d/+3nGnLeZ7i03
 4arXwVcwp4yGkvSuwtZjFIk+qooF8yhjvG3A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=RgLUil7g
X-Mailman-Original-Authentication-Results: exim-smtp-bcf9586c5-442wp; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/postgresql: workaround
 documentation build failure
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

31.12.2024 12:10, Thomas Petazzoni wrote:
> Since the bump of Postgresql to version 17.2 in commit
> cc77be28fc030f8583a4a7f9f724d0fc9543dba5, the build fails when
> host-libxml2 and host-libxslt have been built prior to Postgresql, or
> when xmllint and xsltproc are available on the host machine, with:
> 
> I/O error : Attempt to load network entity: http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
> ../doc/src/sgml/postgres.sgml:22: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
> ]>
>    ^
> ../doc/src/sgml/postgres.sgml:24: element book: validity error : No declaration for attribute id of element book
> <book id="postgres">
> 
> As this happens when building the documentation, this commit proposes
> to disable building the documentation. Unfortunately, passing
> -Ddocs=disabled -Ddocs_pdf=disabled is not sufficient, as the
> documentation building logic still does stuff when it detects xmllint
> and xsltproc, so we "poison" the detection of those tools so that they
> do not get used.
> 
> This issue has been reported upstream as of bug #18760.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/b061e6a68c885e47a254e66dbc073e2b548b8cd3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

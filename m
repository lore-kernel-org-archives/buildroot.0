Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E8CC6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 18:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DC941682;
	Sun, 26 Mar 2023 18:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48DC941682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GllPq5zVf0Fp; Sun, 26 Mar 2023 18:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65814415F8;
	Sun, 26 Mar 2023 18:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65814415F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2FFD1BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 18:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F7C415F8
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 18:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F7C415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N25AmXbSgeAU for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 18:31:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE57D410E5
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE57D410E5
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 18:31:47 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pgV9d-0001cr-5k; Sun, 26 Mar 2023 21:31:45 +0300
Message-ID: <ac6c5e2f-172d-e377-362e-5af1860971b7@inbox.ru>
Date: Sun, 26 Mar 2023 21:31:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230326080034.14629-1-ps.report@gmx.net>
 <20230326080034.14629-3-ps.report@gmx.net>
In-Reply-To: <20230326080034.14629-3-ps.report@gmx.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD921C4293CD89C54A27A78969DD8BA1B0BB446F778B6E4F02F00894C459B0CD1B91DF7062EBFC80ABD02B4522273734D440A8FD0755037FFCE98CEDD5E88678B66
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3DED2DACB82E709C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE720512D700D096E85EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CE9336BE6E614E99EF406FD2BFEA55120520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FA18204E546F3947CE30BDB15EF888393F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637BC6CF9134EFB19379FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B156CCFE7AF13BCA4B5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5A3A75D818F192BBA97C30E157FC529E3FDB66222B979ED05F87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FBCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF96CF2CB646F699EA0C40753A406F3130E47B033AC28E3C4C4C8F1C87B36071F4F2F1C324C53BDAF20AF1D01ACB6F27A5FCCCBC4D74C0B7944695AA0D36443E1EA8CAA110EC39F0D1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMvqd+qF682NXaug1Jg45sg==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5BEAE418CDD1C4C7E328D0E992650F2DD98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=aLxYC5o0i+z/eQG4QlZGetGu7Pftm1IBiU420InsNzQ=; 
 t=1679855508;x=1679945508; 
 b=wG+8g2+HF1kJc/gAGzRhrwI+3YVSEw5jmr+QoRuYs1hf1Zqfpyd1KsafQjk1kq6OFSoj02xEg9jy359VNsAy5HUdCpGs+1ORk3QDF/qyTXvqbCyptWRGPBFz1p2F/SVakTCbKNRSZhq9CR9HyZqLJjR9XxzEO07rf9Usw+o7aKLidEns1Wp26BAHrnCLmlSj3nf5xf1clwxB2yVJdj+3XPcFUbr8OKT724F+9MmrQ/sLDEcP0SIRtNxD6IBujQoLv+69iAzmqw8EyVlzTlWE+iJPg6yxuDn6ZVuf+jdP+yLQsPOlUcoLRgsVgxhND3aH9gNxr607sMROfoJZxSi6mw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=wG+8g2+H
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v1 3/5] package/libosmium: fix double space
 in Config.in comment
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
Cc: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26.03.2023 11:00, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

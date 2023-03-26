Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C374EC74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 18:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1294B415F8;
	Sun, 26 Mar 2023 18:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1294B415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxpVIRSHiKIg; Sun, 26 Mar 2023 18:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2364B410E5;
	Sun, 26 Mar 2023 18:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2364B410E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 224011BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 18:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0930281E82
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 18:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0930281E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEHxEGNAeJ0V for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 18:31:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A50181E65
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A50181E65
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 18:31:25 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pgV9G-0001Nn-3z; Sun, 26 Mar 2023 21:31:22 +0300
Message-ID: <01b6514a-50e9-232d-4341-78b8e8b12dc9@inbox.ru>
Date: Sun, 26 Mar 2023 21:31:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230326080034.14629-1-ps.report@gmx.net>
Content-Language: en-US
In-Reply-To: <20230326080034.14629-1-ps.report@gmx.net>
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD921C4293CD89C54A24F07419F74567A322334321D6676D67F00894C459B0CD1B9B35319F5D7149274F76DA09082A360840A8FD0755037FFCEAE205DC559FE8AC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782A779A89F7D69B2C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7A40BF27E8345D582EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B6F1F7B995052D5CEBD1C2C8D5B7DAF122E08D288C26B952920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0DEC8C2C8BCD2534D8941B15DA834481FA18204E546F3947C684D5A5F288D3D4BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637A2CDE276DB021731389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735444A83B712AC0148C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A55250E94865EBA454B6FB32836E2CB6657AC7E05219342D9AF87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FBCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB240602329B98433571AD62096AD725EF23649E84FF290C0D479D6821270F8D3F6452569441AF3640AF1D01ACB6F27A522B7E4416FB807A99A45D8A87FCCAB51A8CAA110EC39F0D1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMvqd+qF682NR7vbhgrPpxQ==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5C181769D8FD31FA535A53BB7E5C6EEA798CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=aLxYC5o0i+z/eQG4QlZGetGu7Pftm1IBiU420InsNzQ=; 
 t=1679855485;x=1679945485; 
 b=LQQFwoFytpBO0knehOeNvvyXWizipG0Ru+dwty00E+wKXUjB0oPo56EkAr04ZawjEUMKRIwHGKm3at8mZVP1lyNLo/s7KsBOx1sX+ltcZXEwJ1uISDi7ooegMIMBeBvWUjTD/vuvax8uueghc+PHDBPzk/60opdgZyNtqQwUxtC6PNecbNPxE7hrmSYOQFRDtyN4K5spT+44ZrmNKZPhGInS29evLtUpSFpf+E1NLl2jf5pOkcxXK52cunb4tW0WdjtKXCDKUyOioYqS4Jd7PDl3u4nkO0ZdtI/2cenIJaTXJXt0hKOB/P/rwOIjGkEr2O7RWbRjceu29dw///w7aQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=LQQFwoFy
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v1 1/5] package/protozero: fix double space
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB734C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 16:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76F058132D;
	Tue,  2 Aug 2022 16:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76F058132D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DA21Vhg6679q; Tue,  2 Aug 2022 16:48:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 970AF81320;
	Tue,  2 Aug 2022 16:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970AF81320
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7346B1BF390
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 16:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57CBB81320
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 16:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57CBB81320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iXnnT1ds6zEj for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 16:48:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE2A68131E
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE2A68131E
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 16:48:50 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Iv4boDspUij11Iv4boKUa9; Tue, 02 Aug 2022 18:48:49 +0200
Message-ID: <dd21dd1b-7929-9380-8b08-df4a9119a1d3@benettiengineering.com>
Date: Tue, 2 Aug 2022 18:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-5-x-shi@ti.com>
 <5c73681e-fec4-65c7-231a-9e3a0b75c3b6@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <5c73681e-fec4-65c7-231a-9e3a0b75c3b6@benettiengineering.com>
X-CMAE-Envelope: MS4xfKGTcNGKy9cU7WikGZdvMRKHpg+/zMzyRbgo8beB5Rfjf/cVv5SgpsK5TGTw/qSs04wh9Eh/E7chjVIk5dD0Bn7DDRxF+NTYtwH57SzzKMtx1guBBVqI
 i/BVm11Kncl6Wde8jtoqFS9xwt+yAwhIHxblv54R8HmX9+9QYjgvWzNN9Dt0uFlAj9Hk9PINrhlZ4osGSUTc+qqr+o8de0neoZlt0B56nbfo0WBlMosQMTLe
 FhkoVRJbuoI5ffqsOOV30sZAQwx7R1ohcLxVxWH4EZ65T4cyH7OrjGYg+pB+lKzzQpgcAWyODCoOMM0NLgrqniUZWdz4+j+1mzuLG2B1ILEjfEAMUrdrGC8Q
 uiwG7+1Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659458929; bh=UMZ/V6AQa79NmMmCTIMf0kNqA5/fpoWrG8XbCWs62WY=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=YCdi1RLowv7z6/23Uk1Gd/oQyxyontaljRUpwduwxQMBMb7pgChlOXOtoRimsA03w
 5177vnOPdrz0+vscWb8JtniYpEntieaEn6LvdNnISBJE7dbyGoFAO7zdw4Sjt34Jhy
 JQ54g54JhbG4bzhdt6RnXce59qGMVZMJXSvJnLvUhcRHYDZyCKwH/+s9fclUrBmP68
 I8wnqBLWLWWAfYMOSt/680RN5vsj+1fR2g6QvhW/LMOwmi3YDhyqT6dwO7jtaNy4m4
 qW4OgBGLdN2DFoEutyxtPCnTN3n4v/F4A5r5qxea6YrYemge3Xr/vah8MOuSMj4S4F
 MfMfDv2tZ1PSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YCdi1RLo
Subject: Re: [Buildroot] [PATCH v2 4/4] board/ti: add new boards
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon

On 02/08/22 18:40, Giulio Benetti wrote:

[ SNIP ]

> 
> Waiting for V2 with my previous comments and Thomas comments too of
> course

s/V2/V3 for both patches.

Thank you
Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486C0C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 13:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00C183B07;
	Tue, 18 Oct 2022 13:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00C183B07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5MH0q4bwTEl; Tue, 18 Oct 2022 13:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3489C83487;
	Tue, 18 Oct 2022 13:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3489C83487
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9716D1BF5E9
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E368408DB
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E368408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QD74EWbWpHTF for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 13:19:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 698FA408D7
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id 698FA408D7
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 13:19:36 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kmVKowdLZae4mkmVKoskat; Tue, 18 Oct 2022 15:19:35 +0200
Message-ID: <6ae4b9c9-ab3c-b77d-1220-c62fd12dd8ee@benettiengineering.com>
Date: Tue, 18 Oct 2022 15:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
 <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
 <20221018151445.42d376ff@gmx.net>
 <a07fa13b-15cf-afc7-2507-561e2c256c6b@benettiengineering.com>
In-Reply-To: <a07fa13b-15cf-afc7-2507-561e2c256c6b@benettiengineering.com>
X-CMAE-Envelope: MS4xfBGNe1ry+JyjCWyWGx16KtPHqXQCFEDP800m1g1uKESg1vnOfZZIW/nY/OcByD5m1WdinKKBq/44QYtUhhwxobYBKtrRk/kJvnAz8JboD07uy73U7qrj
 QQpzQ1Tevg8XlI82Yn52JHgf1pCqdcWntIvkXVNWtQaYqlpgKaLIx12+eIg/ZAJPPoryTpF0htmKxjqsT3lIxu6rEY/ejTIUcwA+acaiWTaAeuMxgpbllZoS
 De7UPj6h3uX4wMLvGFvvevaFapCRbabET+LMB1WvalD98woN9MnMtUzf2waNp1PR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666099175; bh=ddKT1eiOK+OWNJLyQzIoT841d3jZ9c5NFfzi5EAwgeA=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=W8U+gg/d3kWhJU9+TxlcxlQsxA+m2FJklwPDA431No2lXF6ikuRusBh01xLZUGbxr
 syip97WPZ9vcgVfgTu0Wiu6NBzUtKNMKNo2p2I8Bxa1kJvUn9e4/bsRGyeGPOO7db4
 ZDIJ6b3dV4HFmhqVuMH4uJDHCWPztZerr7hmgr/KsS8bcdXgx0Qsly6Gs819fhnhe9
 MBSzuJ9CinPbecwKeO21OpBErB8QtYhr6syOWTY8Y8q/VBoZbciw8Xkn1Is5/s01/W
 j9zhWyH6M7UJaXGdnadMzUBfl5SgnPR++6qpSHlOoKcXyIRTUmZ2U88gmWB+HsOyH0
 aYZZ9yB28Gk1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=W8U+gg/d
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And I've also forgotten the Fixes:

On 18/10/22 15:17, Giulio Benetti wrote:
> Hi Peter,
> 
> On 18/10/22 15:14, Peter Seiderer wrote:
>> Hello Giulio,
>>
>> On Mon, 17 Oct 2022 23:12:39 +0200, Giulio Benetti 
>> <giulio.benetti@benettiengineering.com> wrote:
>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> ---
>>> V1->V2:
>>> * use specific upstream commit SHA1 since the latest is buggy
>>
>> Please mention this in the commit message (including the breaking 
>> upstream
>> commit) and additional mention that the used commit is from the
>> branch(?) not master..., will save some research time for later 
>> updates...
> 
> Ok. My patch to fix the build with Linux < 6.0 has been already
> committed, so I send a V3 using the latest commit and I point the branch
> in the commit log. To be honest it wasn't easy for me too :-)
> 
> Thank you!
> Best regards

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4A7EE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D56A4002C;
	Tue, 22 Aug 2023 20:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D56A4002C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RgyCCUv5QMW; Tue, 22 Aug 2023 20:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FC540903;
	Tue, 22 Aug 2023 20:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52FC540903
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A48C01BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E2EE40583
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E2EE40583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t28AAdCjRr-W for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:48:04 +0000 (UTC)
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F1C34018B
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F1C34018B
Received: from [192.168.50.162] ([146.241.122.243])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YYIBq7DA0sGJSYYICqQnsD; Tue, 22 Aug 2023 22:48:00 +0200
Message-ID: <79aa9092-8ed7-26f8-a97d-b363b21d75e7@benettiengineering.com>
Date: Tue, 22 Aug 2023 22:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230813172524.354647-1-giulio.benetti@benettiengineering.com>
 <20230822220939.1b53eca1@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230822220939.1b53eca1@windsurf>
X-CMAE-Envelope: MS4xfD0czhPebFbXFFj9JnX4NUFer2RbgeXZgWeeQqWViJuutZF2urrSjWhDz2OBUpIo00Mjq+mfG5G6X1CRWW2P+o9izrmCRNbRr56C98W7w4Q59q4J9QS+
 wyASsjWoTOYkMHPGVEBqhDm07e/CrwF4kjeR5ifF04kEwewI5ogpMnbnvbiayv1Srox2khDuoRHhOo9yXV/uN7f6do5eZWtJWUSVae6rhYGU2Pq4h8N2H3Nb
 1V4QcnvCDCuoEacqjIbCsFDTtD5x3QQ7NZZCRidwXp4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1692737280; bh=60QDZyIzrepLwE9EOp6mtrgmWl0+fzq2Os2040Degh0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Fl6pF/+ATgKzDLTIf8t1SaCMkk0laRicy6XVIlMh+Yp9kySRk/QZSqz33ztFkD3V5
 zIjqIcHzrg89Kdoo+8dYEGXFL16CWPigL7DHxct5hdrCn/sFY0YnFAKAuSWeVwyFGX
 8QalXK1Hcz8n2alwPttp8ytJkf6szYplUbaSGrBr34fMWHZ1JwsVv2BsFMOEF2eNj1
 J9efB694pn6r06yximemKeFSx+K0ULuVYNBaWRvHVybMBoGFspvdQX2ly9SLGJ7sc8
 EAf7Cr5Fcfgq/eqvt7DSpz5GCt0Ez/f+dSu7VxBFIxX2929iH9EL/JuHXqCqbcSs3p
 sqVIls/Hd8glw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Fl6pF/+A
Subject: Re: [Buildroot] [PATCH] package/ramspeed: disable package if
 affected from gcc bug 43744
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/08/23 22:09, Thomas Petazzoni via buildroot wrote:
> On Sun, 13 Aug 2023 19:25:24 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This package is affected by gcc bug 43744 and I have not found a work
>> around for it(i.e. the common -O0 we use or other), so let's disable it if
>> gcc has such bug.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/ab289769c5fea435934ed260d38e0a4fdd2ba72d
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/ramspeed/Config.in | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Applied to master, thanks. FYI, gcc bug 43744 is marked as RESOLVED
> FIXED in the gcc bug tracker
> (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744), so if you don't
> reopen it, nobody is ever going to look into it :-/

Thank you for pointing. Just commented and asked to reopen it.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

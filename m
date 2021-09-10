Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BFFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BE7611C0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 14:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1BE7611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF7DE4044F;
	Fri, 10 Sep 2021 14:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDq3d2ejbSrI; Fri, 10 Sep 2021 14:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B0A404B0;
	Fri, 10 Sep 2021 14:40:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ECFD1BF842
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B99E814A1
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 14:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nROh2zCeixwE for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 14:40:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5531580EC7
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:40:20 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id A252E44087E;
 Fri, 10 Sep 2021 17:39:56 +0300 (IDT)
References: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
 <87zgsk8y0u.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.6.5; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Sep 2021 17:39:04 +0300
In-reply-to: <87zgsk8y0u.fsf@dell.be.48ers.dk>
Message-ID: <8735qclcj3.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/getdeveloperlib.py: explicitly
 set devs document encoding
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Peter,

On Fri, Sep 10 2021, Peter Korsgaard wrote:
>>>>>> "James" == James Knight <james.d.knight@live.com> writes:
>
>  > Explicitly indicate the file encoding to UTF-8 for the DEVELOPERS
>  > document. This prevents Unicode decoding errors when printing E-Mail
>  > entries with Unicode characters on systems using an alternative default
>  > encoding (e.g. 'CP1252').
>
>  > This corrects the following observed error:
>
>  >     $ ./utils/get-developers outgoing/*
>  >     Traceback (most recent call last):
>  >       File "utils\get-developers", line 105, in <module>
>  >         __main__()
>  >       File "utils\get-developers", line 47, in __main__
>  >         devs = getdeveloperlib.parse_developers()
>  >       File "...\buildroot\utils\getdeveloperlib.py", line 239, in parse_developers
>  >         for line in f:
>  >       File "...\Python<ver>\lib\encodings\cp1252.py", line 23, in decode
>  >         return codecs.charmap_decode(input,self.errors,decoding_table)[0]
>  >     UnicodeDecodeError: 'charmap' codec can't decode byte 0x81 in position 6659: character maps to <undefined>
>
>  > Signed-off-by: James Knight <james.d.knight@live.com>
>
> Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

Not in 2021.08.x as of 1279d2b13284 ("package/go: security bump version
to 1.16.8").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

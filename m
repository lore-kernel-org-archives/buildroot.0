Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE88C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D5060D54;
	Tue,  1 Feb 2022 22:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvwwJ8qMZFZn; Tue,  1 Feb 2022 22:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC6560AC9;
	Tue,  1 Feb 2022 22:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A92C1BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16EEA81839
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4Tq6WGQqdIh for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:24:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id A89DE817C3
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:24:01 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F1Z8nmAy9ks1JF1Z9nXMwT; Tue, 01 Feb 2022 23:23:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643754239; bh=klxJlgtv8mfjPgpkivJuS85FJzlWFZJfQhmF4ZNJUrk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=HlSaXKlPyphpI433xxpBFHT2IZjxR7GWNcXGQ9LCagH1a2CJSdE3FA9cnfaNVVOS8
 aLuQo6QEAXCBWOFDBJ9VrOdhPgDebYK/CNsKQJLeVhrG4IpfVne9CSNXCQrRHex5FQ
 xRxjFrKqt092iaxS8Rq9xAAPk6BB6lq005tF4sTx4lhBX0eapJ92spA4h8eH+IVvmS
 ggMqr+kZ7lFqNOPSfuu7JRqhVa4wEU29bOXxOcWK8YEh+WI8sXjdxzIssGN698NQnB
 Ro7c3JLbBkOINH+kzM45U4qrvrP4XxwgLSM5jOphpPHb9XDSwKOiTv9aqPhTli2TV7
 d9PIXh4gvwfig==
Message-ID: <3b46e3fd-6fa1-eac5-bd28-f726f23a921c@benettiengineering.com>
Date: Tue, 1 Feb 2022 23:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220131123441.3645526-1-giulio.benetti@benettiengineering.com>
 <87sft21bbr.fsf@dell.be.48ers.dk>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <87sft21bbr.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4wfKu+LtyH7a716wX0qrYOAuxpc8OWABcTKu4Wuh4fhbhkER/BASMaVFLFONeXDqHVDxJQAwHwYoT3th/nqkSoFgtzzsagOGscCnS4nyePJUkAv1Et2bvN
 Fk9cjT5/vFb5gV7ec0jB2eTx6ty81126apH1ekdbAq0TFbSTRvqpyZM4AqCVAFTVKTIJPJqY9QrKAYwtV1ew8/d4eho3gFilW/tcCLPVUNUhdA9smZY8psso
 BcMf411Oj0vaRI9kyI+qtg==
Subject: Re: [Buildroot] [PATCH] package/at: bump version to 3.2.4
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

Hi Peter,

On 01/02/22 23:17, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > All local patches except on have been upstreamed, so let's remove them and
>   > rename/rebase the remaining one.
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   >  +++ b/Makefile.in
>   > -@@ -99,43 +99,42 @@ atrun: atrun.in
>   > +@@ -25,6 +25,10 @@ DESTDIR 	= $(IROOT)
>   > + $(warning IROOT is deprecated, you should use DESTDIR instead)
>   > + endif
>   > +
>   > ++ifdef IROOT
>   > ++DESTDIR		= $(DESTDIR)
>   > ++endif
> 
> What does this do?

oops, that remained as part of the old patch so I need to drop it

>   > +++ b/package/at/at.mk
>   > @@ -4,7 +4,7 @@
>   >  #
>   >  ################################################################################
>   
>   > -AT_VERSION = 3.2.2
>   > +AT_VERSION = 3.2.4
>   >  AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
>   >  AT_SITE = http://software.calhariz.com/at
>   >  AT_AUTORECONF = YES
> 
> Is autoreconf still needed?
> 

I'm checking right now

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

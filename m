Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07219C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A964560F77;
	Sun, 27 Mar 2022 20:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJ0na31edIEk; Sun, 27 Mar 2022 20:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D564860F74;
	Sun, 27 Mar 2022 20:25:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 311231BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CCFF416A3
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mD_hbelK_E4 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:25:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC8FF4167C
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:25:41 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q189so13660750oia.9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s+3ZRjznyLGmRTpT02XvmL5RFiorlHm+ZbmW3YWDCnY=;
 b=UNN53sjvL47FTtYdjotZaDNR4FRqKlwIjfH5Z8dhpE2vFihHIkWWS0UJ6QWhj/Bt+S
 Mei8PGKM8uIJfmGxYvDWxmGd1to6JJmlBjuTVbyLrSf7dxJJlt8xfWCmrUjOceeWZDBm
 8SbAeqjck7MBarAln/OdkEpHAXFqp52tO6HZ4fsuuOQ2eq/ic38JUWL/QdheveipEvf2
 v/4aiJtOD2WWbVFzknyDreneRRvw+1wGmsjzsC4WWP0AtHmtKcZvn4NiKdtBsD+u8t4v
 Ur1IPJBDRumKbTB/zgqPNC8EYoajlJwLQEZMzq93HG+F/YTm6ADJ3BEAoCTZ2V2dIa/q
 ViXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s+3ZRjznyLGmRTpT02XvmL5RFiorlHm+ZbmW3YWDCnY=;
 b=QcrYw6MNMTBz21VV2mipgjBeo/x2EFPoWq+NCflBRAIo1LgNyQOUclghC1N1oWyYNh
 cTaSWX41OLwoC0oCtP4x2plLsIbi924j9VnPkOG9n68dHevm7UDq7uNxoqcYsuyoflPc
 SqHxI6EEYSkSW+YJxnNWv2bTve5uO9axe8QAf9nGXTfOHXpxlOMCC0ZlUaCMy5QwpX2h
 ptgzorn2xlFe1sIFyu1XmezUJo4Z95x4CmQpMee/nWxt96VpF7vM/upmwhJB4DjHgegA
 K2/RvdXA48M+ncwlFHTP+ivy9Ioqs79rQGEm/UDhMWodus/RSS5DIAi3OXN1DwlSvU4Q
 hglA==
X-Gm-Message-State: AOAM532Eaa0qET1qEmmCThUYC1TXeijbtWrb0yEBVsctGysSrOpGiFxd
 qCV5aVYbYC/6sgbrYKtMNxQG/0BqstwN1/W8QYOlf2+rbHPA9w==
X-Google-Smtp-Source: ABdhPJwmmFsQpwSzjg1XC5GrA8IzFwvXlURRekQptzvS9GJArzGpltSRCnLPlKExKrx471Eo/FtMDG39oPYys41Bqf8=
X-Received: by 2002:a54:450e:0:b0:2ef:3c3f:f61d with SMTP id
 l14-20020a54450e000000b002ef3c3ff61dmr10346485oil.99.1648412740916; Sun, 27
 Mar 2022 13:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220327054814.942198-1-Jason@zx2c4.com>
 <CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com>
 <8fa95711-9442-c1b9-5ddc-9e1c7859f802@mind.be>
 <CADvTj4rETStakpHukCJL4R=wu0fejgdiyjj=Kue9YN=5Bh-YBQ@mail.gmail.com>
 <CAHmME9rXhz48x1HE1+ocMeFm9eponoB=u0WsE6tE2a8Hg6DiwA@mail.gmail.com>
 <CAHmME9qoX5K3_6PC11rZ2iZRtniEm7aVVspq0oYF5+L7vFr4kw@mail.gmail.com>
In-Reply-To: <CAHmME9qoX5K3_6PC11rZ2iZRtniEm7aVVspq0oYF5+L7vFr4kw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Mar 2022 14:25:29 -0600
Message-ID: <CADvTj4pSUZSb3o2+-OfEROZTa_Ze-pdn0hoDhKFRnzsxUeViog@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 27, 2022 at 2:10 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey again,
>
> Oh, I didn't see the whole conversation because you failed to reply
> all. Please keep me in the CC, as I have list mail turned off.

Strange, I did use reply all, maybe it ended up in spam?

It appears to have been sent correctly from what I can tell:
https://lore.kernel.org/buildroot/CADvTj4rJcC8NQnG4A70VgF6uqzj-xGDxg2nOyRB=jxj4wSLpqg@mail.gmail.com/

>
> I see now you just want an option to do this via environment. This is
> what I did on OpenRC. I'll send a v2 with that for here.

Yeah, I'm just suggesting a path override since that's trivial to tweak with the
existing script via a rootfs overlay override but slightly more complex to do if
one has to modify a binary.

>
> Jason
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

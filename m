Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB12C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 10:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D78B608D8;
	Mon, 17 Jan 2022 10:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFcDqzXtL-4X; Mon, 17 Jan 2022 10:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 619D260AEE;
	Mon, 17 Jan 2022 10:06:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E64F81BF3D7
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1021402C3
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iy-vRF4VLij9 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 10:06:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B447402D7
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 10:06:38 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id D3F11440767;
 Mon, 17 Jan 2022 12:06:28 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1642413989;
 bh=sUM7qd2Psex0REZBaGoBx9AeTbeeh4PwwJPoS/dTl78=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=JRC0XU0nGGopu4p6rmUZg27H5cW7BiVnZ5V5xy5SMyqrc0BLIOQWGrsjzMOspPouZ
 C8qtCS26Nalg3bmyyn3J1N448jxyiSfzEFHDz5l7p66MFF067xaFNAaNEtDJOLUffV
 EtZ6bEhdamQcwc3Zw87zvuMRgDpEL32NCx9FnvlT+t87g1luSF7swiC/REGNLggclL
 MOSnpGTLSfKteRfqII09386EfRDVb8JKwAQNYJoyPQU21iUo8DoucpnE0QVQTHMqcz
 xyF884TQBh35Rno5EkXsD6VPE1IjhXbNT7hxPH3pSybI3VtyL+pW6fNa5gWaNEdd7E
 lZXMMBQOxWk0w==
References: <20220117105017.28d6aacc@c3po>
User-agent: mu4e 1.6.10; emacs 27.1
To: Danilo Bargen <mail@dbrgn.ch>
Date: Mon, 17 Jan 2022 12:03:03 +0200
In-reply-to: <20220117105017.28d6aacc@c3po>
Message-ID: <87mtjufzh1.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] DMARC on this mailing list
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Danilo,

On Mon, Jan 17 2022, Danilo Bargen wrote:
> I recently enabled report-only DMARC on my e-mail domain. After sending
> a few e-mails to this ML yesterday, this resulted in multiple DMARC
> would-be rejection e-mails.
>
> DMARC relies on SPF (correct sender IP) *or* DKIM (correct signature). A
> nice tool to visualize this is https://www.learndmarc.com/. If either
> SPF or DKIM passes, the e-mail should be accepted.
>
> In the case of mailing lists, the way I understand it, there are two
> options:
>
> - Rewrite the "From:" header so that the e-mail appears to be coming
>   from the ML itself. Put the original sender e-mail in the "Reply-To"
>   header instead. If this is not being done, the sender IP (the mailing
>   list) does not match the sender e-mail domain and SPF fails. Note
>   that this *might* impact the buildroot ML reputation for some big
>   mailservers.
> - Expect that mail servers with DMARC enabled also have DKIM enabled,
>   and ensure that the e-mail body is not modified (i.e. turn off the
>   automatically inserted footer). Put mailing list unsubscribe links
>   in the headers instead. This way, even though the sender IP does not
>   match, the signature should still be intact.
>
> These approaches are described in the following blog post I found
> online: https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html
>
> I don't know if mailman allows turning off body modifications (i.e.
> RFC2369 and RFC2919), but it definitely allows "From"-munging:
> https://wiki.list.org/DEV/DMARC
>
> I'm still quite new to this mailing list and don't want to put out any
> demands, but I wanted to bring up this issue, since it will probably be
> more and more of an issue in the future (DMARC adoption is increasing).

I can't comment for the owners of the Buildroot list. But you might find
this recent discussion from the linux-arm-kernel list interesting:

  https://lore.kernel.org/linux-arm-kernel/202110211313.B5C5C61@keescook/

In this thread David Woodhouse describes the lists.infradead.org setup
rationale.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

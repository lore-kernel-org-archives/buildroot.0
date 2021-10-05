Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97756C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:42:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D55613AC
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8D55613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7681783DA9;
	Tue,  5 Oct 2021 16:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMxMpDlNGd6Y; Tue,  5 Oct 2021 16:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8348C83DAD;
	Tue,  5 Oct 2021 16:42:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02E231BF2F2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C9183DAD
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOFcnsVueoys for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:42:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72BC083DA9
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:42:38 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 2821244097C;
 Tue,  5 Oct 2021 19:41:54 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1633452114;
 bh=gyST7GfbRrFmnMKN782vA2+f4pcRZzVhsc1XEKdwD7k=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=dCwdVmnT3IwfiVpxUWXYgbZ9rrMoRXALhdhG2lmKvh5e96qWjMkvoV7I0bN7+RMer
 Lugi5TsBj/1hap4ifhFl77McbD1efFyGc+ZvCCLTzRYic3pFomrehMcirnEo9Orjel
 8PNYjkiAOBqNdh1bCNvknDJ8scCvMTeiCIx0A+s9XwtC+w6Pxxddb3EJwOw0TGZ4JK
 4Vf2EaMbvlnk9BcfwqQcbYLhMLGKnc5fhtRj6Tlo3k0pNHqqAnnqWKT+pj79tnrrQv
 NdwtO8xVxE1pL2wRseQciTmQMmawmImia04m7jFwuEAG4RMIwGL4IA59fd8CiFBBRu
 KjXe3FRa2Hjqw==
References: <20210919145331.3492573-1-fontaine.fabrice@gmail.com>
 <87r1czd07i.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.6.6; emacs 27.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Oct 2021 19:41:49 +0300
In-reply-to: <87r1czd07i.fsf@dell.be.48ers.dk>
Message-ID: <87ilyb5sp1.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/wavemon: add libcap optional
 dependency
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
Cc: =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Tue, Oct 05 2021, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > libcap is an optional dependency which is enabled by default since
>  > version 0.7.1 and
>  > https://github.com/uoaerg/wavemon/commit/669c53e3359af5f6d4044126e22ab95f40a968f4
>  > and can be explicitly enabled or disabled since version 0.9.0 and
>  > https://github.com/uoaerg/wavemon/commit/af36fbe75649f745e205cd961302b656b8461e06
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

Not in 2021.08.x as of commit 46da68c01bbf ("package/google-breakpad:
fix build with glibc >= 2.33").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

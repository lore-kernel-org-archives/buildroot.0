Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C683CC43217
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 12:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3438440368;
	Tue, 25 Jan 2022 12:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZnUsx-bwvtZ; Tue, 25 Jan 2022 12:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 562C4403F8;
	Tue, 25 Jan 2022 12:27:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B25071BF36B
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 12:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A054640337
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 12:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eoEHGan-Uwae for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 12:27:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47E1C4032E
 for <buildroot@uclibc.org>; Tue, 25 Jan 2022 12:27:42 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CKvDnYqkiI46dCKvEnYL7R; Tue, 25 Jan 2022 13:27:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643113661; bh=iWp4eYPDJGZPTH0cp+2XSyk8mya+5Qft/hcz6YSW/oM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kTnBqEeFrrpDDPvV2LN0J2fZN88Ty7b0NFPAIZK+bX1xPT5vIOQmrovcwwCkF4ldu
 sd10SvYo+4RDf2G146TmeP0MoarDq8mdU7ph2i+IV+HG87dcNiX+cRYtYnBquuLkiq
 tc52Jzh5IxlE3Hq/y75HNyjub+JXLL8bbj0QOkJ0ch5vgESBM6lJN+EoUsC+3shoBG
 s6C53bhvK/ViDtJAIPUBlsrsLq+8QFY8elS+VCFW9K0XI5ZVuMYT1+3JOvJWtJKuLF
 1QvM0evtUC+KgxwGQiAxcW1gzSdtURRQOOQ5XHDATkVLYRFtMRKhfWiRYfJCPc8ZF/
 3dQJWr/2+16cA==
Message-ID: <2fe58d01-39a1-9c38-fa7d-1e6b7648ad2b@benettiengineering.com>
Date: Tue, 25 Jan 2022 13:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: bugzilla@busybox.net, buildroot@uclibc.org
References: <bug-14531-163@https.bugs.busybox.net/>
 <bug-14531-163-LO8QiqqPNq@https.bugs.busybox.net/>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <bug-14531-163-LO8QiqqPNq@https.bugs.busybox.net/>
X-CMAE-Envelope: MS4wfAXuqSxpWZKVL+L9EiSIrwe6d7Vkuo92RbQeUI+apNAI8C12xLu2JMD2gXhJAJDbucnoLvdCb5yo4rGSVtjTepJN9Hbn79OeV61YuG2tCzMq9ASqJjYv
 D4sRsW4E693bvYJvK7Gyrre5225Jk+WGgLDvddktJ0xMUh8oVsHXEaWjbvAEFh1qRotkB/IWFeG33yxZ6Fx/X94Ro4M4Vp+VHfrECMYjNZMUzW+cG7sfqcH8
Subject: Re: [Buildroot] [Bug 14531] Package EFL - build error
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 25/01/22 11:52, bugzilla@busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=14531
> 
> --- Comment #7 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
> (In reply to Giulio Benetti from comment #5)
> 
> Hi Giulio,
> 
> I already sent a patch in December:
> https://patchwork.ozlabs.org/project/buildroot/patch/20211230221904.3064022-1-fontaine.fabrice@gmail.com/

Damn, I didn't notice it before :-/

> I didn't take time to take into account the remarks from Romain Naour however I
> think that this approach is better.

They are 2 different approaches. The problem is the efl dependency 
handling that is not consistent leading to pitfall.

Honestly I'd expect that if eeze is disabled it automatically disable 
all libraries that depend on it, but it's not that way.

Thank you for pointing :-)

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

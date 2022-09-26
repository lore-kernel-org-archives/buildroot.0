Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED42C6FA82
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 15:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E134982C8E;
	Mon, 26 Sep 2022 15:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E134982C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id df9IY0eYmxxU; Mon, 26 Sep 2022 15:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C1A82A0B;
	Mon, 26 Sep 2022 15:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C1A82A0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA5A1BF3A6
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 15:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5830560FB4
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 15:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5830560FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nN_aYJFlWFCS for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 15:45:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57AB660760
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57AB660760
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 15:45:53 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar23.francetelecom.fr (ESMTP service) with ESMTPS id 4MbnCg0yjWzBsyw; 
 Mon, 26 Sep 2022 17:45:51 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 26 Sep 2022 17:45:48 +0200
Date: Mon, 26 Sep 2022 17:45:48 +0200
From: <yann.morin@orange.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <19213_1664207151_6331C92F_19213_476_1_20220926154548.GE3010@tl-lnx-nyma7486>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
 <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
 <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de> <Yy3e9fTSv19Zxq9T@oscomms1>
 <20220926070545.GA3010@tl-lnx-nyma7486>
 <4286_1664185876_63317614_4286_458_1_20220926095113.GB3010@tl-lnx-nyma7486>
 <YzGJEib+tB/Vxea4@oscomms1> <YzG67nkiklO1Fzmp@oscomms1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YzG67nkiklO1Fzmp@oscomms1>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1664207151;
 bh=4mh/SiyBEcXzhJ5BKTR98jw7e/QDBnBE8w+94VuBRxo=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=Vaftb+n7ig7+6fAMAVctZ3DjWW29Tdr0zUVJJkOm05hNCBXE+lDqMT4IZLKAzo4Lo
 D1CE9/4D3cFPcFebY26WiF2mrnXolUjyk6RV6eTOChjOlPZ4zpOR2vop+RRAxbELjd
 w3DMhMTKAPub47NA25YTFRimGs9AW0TZa/rokSsz1ZxMwCDIKvq2rO4LKA7nC/w8lm
 6SoHDuM3WrlQBSpPDqfbdpcvwn1+TZlqAhhG4OZ4WW72ADCBAG0gqu5IGvPBtmF92m
 vvIMbJbMM8iduEY0qPkV9LmYdye44mtACmRIrnYCJi0YB9YaOLtD9iOUJmPdORHsqd
 vZxO6ZCj0acQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=Vaftb+n7
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stafford, All,

On 2022-09-26 14:45 +0000, Stafford Horne spake thusly:
[--SNIP--]
> OK, it seems this is the fix.  The --enable/disable-tls flag seems to only
> control a HAVE_AS_TLS macro in the gcc build.  OpenRISC was missing the below
> ifdef.  Adding it seems to fix the build for me.
[--SNIP--]
> diff --git a/gcc/config/or1k/or1k.cc b/gcc/config/or1k/or1k.cc
> index da2f59062ba..0ce7b234417 100644
> --- a/gcc/config/or1k/or1k.cc
> +++ b/gcc/config/or1k/or1k.cc

With gcc-11, this is still named or1k.c, so I did a little adaptation.
At least, this time, that was something I could handle! :-]

> @@ -2206,8 +2206,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
>  #undef  TARGET_LEGITIMATE_ADDRESS_P
>  #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
>  
> +#ifdef HAVE_AS_TLS
>  #undef  TARGET_HAVE_TLS
>  #define TARGET_HAVE_TLS true
> +#endif
>  
>  #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
>  #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed

I have tested this with the configuration from the failing build, and it
did at least fix the two build issues I noticed. Note that I explicitly
said "build issue" for now.  runtime. I'll try to find some time to test
our qemu_or1k_defconfig and run it in qemu... But tomorrow (UTC+2).

I expect we'll have to backport this to all the gcc version we have: 10,
11, and 12, right?

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

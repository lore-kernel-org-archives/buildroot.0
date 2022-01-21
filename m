Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D8CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 07:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E18C241670;
	Fri, 21 Jan 2022 07:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrnrSfU13-JI; Fri, 21 Jan 2022 07:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350D8415D4;
	Fri, 21 Jan 2022 07:59:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4C7F1BF285
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 07:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF46E401ED
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 07:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9whUYpk5AmQ for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 07:59:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5836E40103
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 07:59:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c35:7598:9514:be6a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2BE32B004EC;
 Fri, 21 Jan 2022 08:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642751969;
 bh=HJvot1Ddib9RgCdMzmK2e+7kPb+z96UT3dDhkw/1YkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U9DEylFh7v7Tmvm5wUOLoPxoukAk1RNASZNGH5kyllmwsv7EoESaw5rWD+XFs75mk
 FWL3vLOTlM7k1Hil9hd0FtB/JTm7jz6XU2bHQMa7dkQCiKwlOMNUxOplWiXxiVqg4G
 MadccqN1USt/Ftu5vQ4DA6IMBpLT2swfQbEtTonWyOKeHBFGZ4RNqE873C/06URSpF
 1bdxpSlNwVJR1mZxSFXiZKO9yMdwcs3jUbNuvDJNXQZ9MqgACxSnb1ZOPNGFNNqf1q
 J2ZBM7LgR3XxLmr4TsaRbf8BwOVI11hqSmlIHgvYmnXX9PwiSiBwC/krsoUaeeturu
 wWlWGqllABF8Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jan 2022 08:59:24 +0100
Date: Fri, 21 Jan 2022 08:59:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220121075924.GG3252931@scaer>
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
 <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
 <20220120222936.6e7b5aba@gmx.net>
 <CADvTj4rXQO8Kbe0sMA5YJdj6A2R98OELOB5sPD_xriZ_npkaFQ@mail.gmail.com>
 <20220121065850.GF3252931@scaer> <20220121084141.6eac525e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121084141.6eac525e@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package
 make build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-21 08:41 +0100, Thomas Petazzoni spake thusly:
> On Fri, 21 Jan 2022 07:58:50 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > So, I think that Peter's proposal is not so un-appealing, in then end.
> > But then in such situation, I think it would be simpler for us to just
> > apply something like:
> > 
> >     define RE2_INSTALL_PC
> >         $(INTALL) -d -m 0644 $(@D)/re2.pc \
> >             $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
> >         $(SED) 's,@includedir@,/usr/include,; s,@libdir@,/usr/lib,' \
> >             $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
> >     endef
> >     RE2_POST_STAGING_INSTALL_HOOKS += RE2_INSTALL_PC
> > 
> > And be done with it: minimal change to the re2 package, no dual-buildsystem
> > situation and thus no install conflict on the headers, usual and simple
> > post-install hook.
> 
> I might be missing something in the whole discussion, but why not patch
> the CMake build system so that it also installs this .pc file, and
> contribute this fix upstream ?

Because upstream have not been very enthusisatic about it, as James
pointed out when I suggested the same. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

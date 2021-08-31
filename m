Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974C4C4320E
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:43:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E50B3610D1
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E50B3610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A6340231;
	Tue, 31 Aug 2021 17:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dOhMDmFI9pru; Tue, 31 Aug 2021 17:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9331402AD;
	Tue, 31 Aug 2021 17:43:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 551FA1BF866
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40591402AD
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zdkAiexoOuU for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 17:43:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBB7840231
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 17:43:41 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.10.189])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L7nOmSvptxC2nL7nOm1itc; Tue, 31 Aug 2021 19:43:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630431820; bh=M17F6ANjT7O7zXCLRhB1Bu9QIiotpdtBcEMbOFlhprQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=VlP74LIbjw7pkm//WLpccM/jWAjIxKQGTnU2YQdq//ZoqNwDzPsf7yM8a/TUKorGh
 WFMcfTnBnW4SG1K7D7lvMdlXOlEexc7+lPsNiyAtK383k9+3JOkbrycwkihYbanCev
 R0ZoMDZAe/Q97z3Q/Uj0i+JGICxo9GMOWz+t2APpMqOTzSlCqdZgcibYBz6H/S/Zdn
 dwaWfaOXYKgh1H9pc6c+bhFPftSKvl4mqX7EsfhGJLFTGxCz2OI/gk/9tyiu7XA3vv
 /2TdbHgEkxi2AJKolqufFT0mHLcQ07do3i9llOOX3Bbl4PE1lB13G9sE1Fl1MCpRiR
 /c6c97ouikOTA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <86602fc9-9d62-0b7b-4ce3-25bf3de27254@mind.be>
 <7FE9A46C-9CD8-4143-99DE-CE8D786A459C@benettiengineering.com>
 <761985a1-2152-7a7b-e430-54b7b4ed31f3@mind.be>
 <20869f88-4ac4-a4e2-268b-c8d364298583@benettiengineering.com>
 <20210830235951.24b82f6d@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <69b60552-8341-94d2-5d7e-750b0ef3c9a6@benettiengineering.com>
Date: Tue, 31 Aug 2021 19:43:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830235951.24b82f6d@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF8xfSm10tgx3zemPhmwE4+7tZnNx+GfouKP+cBf0b+Q7lvf8wE/ry+vF7IVM+9PSfGU/5iZ8K3ce4+jHJ46mKfbrPuGMrKhecFPNFwIEj0QRiDKonUA
 Q9BF6j9PsQrvW6QZJHYCfIMGClATgS+PCcR6laJ0F7nhVJz8910CarsEM9ZAuKWuU22Ei5cR3fMyIqykoEQqRiAC1EOxbA+mZob103kJwoPivGffNxgVSSZq
 rL3hv5YUT0p4WkyEPsoz4f0KBjw/EHiiI0sjJlLvn7myj0ppxbv3PomfeULzg1ozABSsqkJ0tvp3uZ2ADKHhahS3+a088vmOWF4yUra7PObWTSEdLiCHWYvl
 DEz3mzWN
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas, Arnout, All,

On 8/30/21 11:59 PM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Sun, 29 Aug 2021 23:49:57 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> I try with another sh arch then I try to build ruby and check if the
>> error is the same, that is very likely to happen and then I could
>> transform BR2_sh4 to BR2_sh. And same goes for other sh4 bugs already
>> present. But need to re-test them.
> 
> To be honest, I wouldn't bother testing all possible SuperH
> architecture variants. If one issue affects SH4, just assume it affects
> all SuperH variants, and be done with it. SuperH is basically dead, and
> the only products using SuperH are under maintenance mode so I don't
> think we should put too much effort in determining specifically which
> variant of SuperH is affected by each specific gcc bug.

Fine, I've just sent the v2 series with BR2_sh.

Since the already committed bugs are not listed in order(101952 is 
before 101915/101916), I would send a patch for re-ordering them and 
another to substitute BR_sh4 with BR_sh(bug 101952 and 101916 has 
BR_sh4), so we have a standard form for SuperH, is it fine for you?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

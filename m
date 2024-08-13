Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C9DC52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 04:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 626364052B;
	Tue, 13 Aug 2024 04:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddwECwQD6Fgc; Tue, 13 Aug 2024 04:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D884063A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D884063A;
	Tue, 13 Aug 2024 04:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E87711BF3B0
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E6C812E1
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSTdFTdytAi0 for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 04:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCEBB81292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCEBB81292
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCEBB81292
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 04:38:09 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 12D3135211BD; Tue, 13 Aug 2024 06:38:07 +0200 (CEST)
Date: Tue, 13 Aug 2024 06:38:07 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrrjL/dFmoPDhNGK@waldemar-brodkorb.de>
References: <ZrhlT1NAkvCmXNAS@waldemar-brodkorb.de>
 <20240812222202.4b8ddc88@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812222202.4b8ddc88@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723523888; bh=Nfb9FH90gJU6ZYfYqAw1EHb0E49WGEZ62Z1YTqPrmgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FK+heO7e5EvdClLqDIiAYA6ed2Udpa1rSBlToHnojDb8XmBG+rEQO3aROwVuWFvIy
 NG50ym0/1i/heYGOIT34oVbBXPAMaZ59WuWnNhO7xtMhsfCMOOhsIefK+g2RWERSu3
 XgeSupPZWe0uVP84me40iPjzJ2Sqy19GOx87yG6aaATisyrQaDrCPVoJLAREKV4n38
 HxU6ALTKygxIum2NTj5hbF4pAJ1Oiz0dDCCpX3EztU3pF0u6f1/QB3iDSMP0ap7RAp
 FAGlwh1+01yQMeNUWgSIFM8OazJvsKzhGyDgnohBKR+ObydZUDuGIlpxqvZXO/i7Vn
 LIlztgavf+k7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=FK+heO7e
Subject: Re: [Buildroot] [PATCH next] package/bird: update to 2.15.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> +Fabrice in Cc, as there is a request below :-)
> 
> On Sun, 11 Aug 2024 09:16:31 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > See here for a changelog:
> > https://gitlab.nic.cz/labs/bird/-/blob/master/NEWS
> > 
> > An uClibc-ng based system needs _GNU_SOURCE in the CFLAGS to
> > provide getrandom().
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Thanks, I've applied to next, but I have some comments below.
> 
> > +BIRD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
> 
> This seems to be a workaround for an issue in uClibc. Indeed, I don't
> see in the manpage of getrandom() anything that indicates that defining
> _GNU_SOURCE is needed to get the definition of getrandom(). Why uClibc
> is guarding the definition of getrandom() on _GNU_SOURCE, and not glibc
> or musl?

I don't know :)
Hopefully fixed in uClibc-ng 1.0.50.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B4C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 15:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71AC94045C;
	Wed,  8 May 2024 15:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZlTzgjYyg6T; Wed,  8 May 2024 15:16:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6527F41A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6527F41A5F;
	Wed,  8 May 2024 15:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 417FA1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D75882894
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQw7OAwnNvnA for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 15:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC292827DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC292827DE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC292827DE
 for <buildroot@busybox.net>; Wed,  8 May 2024 15:16:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.127]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1sFmhZ43QW-00N6ru; Wed, 08
 May 2024 17:16:30 +0200
Date: Wed, 8 May 2024 17:16:29 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240508171629.55ae5111@gmx.net>
In-Reply-To: <20240506210440.323ccb15@windsurf>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506210440.323ccb15@windsurf>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:jMhCBiTM9qENq7007pw1jVzDU3vjl5MJYVhPp85N2cGgUDQ2Yig
 tLiD+cmWZgUGc+woiHbccCAgZIgWXqS5hVD67etWVoQKgS4UvV1FueD5IcPPudo4EM9+X2l
 sAZG5O9SCXRSQWqDzLGvPMyzJuC+mStw1z+6Q0GkuMWH7YHcwsA31zIsIFrJlGOaC3CXGER
 j3OzFl+HPqrHCpfXn/Lzw==
UI-OutboundReport: notjunk:1;M01:P0:JQ68Q2zWm4c=;uR7Twq6jxq5XU5HmDuX2I/XZqt8
 bypkz2xuAQnkk5f/rttkOklRdRC4Bv/Wrvr5goDeX0FzYwzjC+9GHX3ryl+LgYMLSgtXyzali
 q0446ENZY0p69e6gwaxT6sXgLMffdXYqZqG9VHVXwXOX7S618hf1TNQZs0BovHNatPkDackBl
 ciIUEyBQTbnaJwpsdtnMsth5Uyu+fix3dex2pPeUEJ7xvyzjicg2h19H/ItS8Qk7OSXvOlSvN
 5JSU5CLSuUJ0pAA0gERWcaQ8BOl+BlE4yE27Y/PuitB93MJ+WbM8Kad31n/4sQLUfA6CLj+xn
 xAtAdY0r/2NJFALMp+e2iPvGa8qARfIFEgAAOwakBEcYCO53p3FRBcL8JVkeDypPW3SpowO68
 2hug2WBO9IqzfRvjsmOWSW0fbanT/KH+QI5Esos75NcrjpcSu5VEnTHEkCK6+ZXwXGS8gmPhv
 Rr32LQxmK+VtO2KEkrFaiIAgDZc3C0T0VE/lV51vJSo6oxcnJzujSGyn7P8Xb/qHAOA+2xAHe
 +kmUxAlkLgSorDiqPyXLDHQoU9u9dM4Tg8Fg4hOeRaiq6DJySuXCYrz0wT+Mh/n0WCFfbBktL
 whXE6FlkcMn+NASquV8LneJmiygBJxm4VddrXPAh3pTE7oja67SC1gb77s4RXuZbEpjMiln9w
 pXSpVfcXj23p4UKf82FA7Rf371WSuBR31LiKmvTxwkVhqxMoXOeOS6wMglES47X2FvtB0VDtW
 P+ewvlgHmu8Oc+iA+N+OV+39CymM1g/JJotkL+nxQxm+eDcbt6W36WffHX7Ctg+JF89kQxkRx
 n3ci7q7cfILV0m9rDCZ9EYhUm0ogWpKQ5dc5jGqSh1adc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715181390; x=1715786190; i=ps.report@gmx.net;
 bh=zbut3iPirOy4Ied2IcWozi9GE4YpYLqYpCJ6FHnrSsQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UEppn4y3L3TQGMlu1xoRpIJe8fBQFHl+wcdqrdA5//fWXTbsyeRM9/rM9OXS6zsJ
 JaQeYnd4dO2RfDqag58OXf6Vrdgjnc2KSr3NuEKJxStKMrftE83+kSL9dHv9PaFoC
 QX/lq4qfS5KVKoWDBriUkMCLjCFkPuneQWHGHOGewWGNIfLBCE04pEvRsbBo3m8SX
 RHk8qspF3iGGcgnXj5CZHiTv9PBO7C5pVDD0rxzyP5uI82zhcuEAadnempskPmGKf
 zrlmPpzUZiA8dUzHaHm8ZczIgfMEtSXg9atKY1GCyWLQ6ffL4Uz70dR83+jTpHzeE
 fmddXDbY6DEKeHpMow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=UEppn4y3
Subject: Re: [Buildroot] [PATCH v1 0/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 6 May 2024 21:04:40 +0200, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello,
>
> On Mon,  6 May 2024 16:45:43 +0200
> Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:
>
> > The patches are orderd by the first 5 handling some minor nits (result of
> > the new kconfig beeing a little more strict about the syntax, can be
> > applied in advance):
> >
> >   - boot/barebox/Config.in: source argument needs quotation marks
> >   - package/cmocka/Config.in: bool argument needs quotation marks
> >   - package/dovecot/Config.in: source argument needs quotation marks
> >   - package/python-pydal/Config.in: bool argument needs quotation marks
> >   - package/x11r7/Config.in: source argument needs quotation marks
>
> I have applied those preparation patches that make sense regardless of
> what happens with the bump.

Thanks...

>
> > The kconfig version dump itself:
> >
> >   - support/kconfig: bump to linux-v6.9-rc5 version
>
> So this commit without the next two leads to a broken situation,
> correct? (Note: this is not a complaint, I agree with them being split).

Yes, but the next two patches can eventually squashed with this one, but did
keep separate for better patch review/iteration (suspected some more
discussion on this ones)...

>
> > And two 'real' changes due to kconfig language changes:
> >
> >   - support/kconfig: reference environment variables directly (remove 'option env=')
> >   - package/openssl: move libopenssl/libressl source statemetns outside of the choice
>
> But don't we have this situation of source statements inside a
> choice..endchoice in other places? I remember Yann saying that this was
> a problematic change for us in the upstream kconfig code.

Yes, that is the reasoning for the (suggested by Yann)

	patches/23-Revert-kconfig-allow-only-config-comment-and-if-insi.patch

With this one reverted I get the following warnings/errors:

  toolchain/toolchain-external/Config.in:12: syntax error
  toolchain/toolchain-external/Config.in:12: invalid statement
  toolchain/toolchain-external/Config.in:13: invalid statement
  toolchain/toolchain-external/Config.in:16: invalid statement
  toolchain/toolchain-external/Config.in:17: invalid statement
  toolchain/toolchain-external/Config.in:20: invalid statement
  toolchain/toolchain-external/Config.in:23: invalid statement
  toolchain/toolchain-external/Config.in:24: invalid statement
  toolchain/toolchain-external/Config.in:27: invalid statement
  toolchain/toolchain-external/Config.in:30: invalid statement
  toolchain/toolchain-external/Config.in:33: invalid statement
  toolchain/toolchain-external/Config.in:38: invalid statement
  toolchain/toolchain-external/Config.in:41: invalid statement
  system/Config.in:23: syntax error
  system/Config.in:23: invalid statement
  system/Config.in:157: syntax error
  system/Config.in:157: invalid statement
  package/openssl/Config.in:46: syntax error
  package/openssl/Config.in:46: invalid statement
  package/jpeg/Config.in:43: syntax error
  package/jpeg/Config.in:43: invalid statement

With the patch the remaining problematic source-inside-choice are
in package/openssl/Config.in, seems not all content is allowed
to be included...

Regards,
Peter

>
> Best regards,
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

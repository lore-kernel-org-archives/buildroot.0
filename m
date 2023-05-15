Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCA5C77B7D
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 20:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90F2F404FC;
	Mon, 15 May 2023 20:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90F2F404FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICSO6RTEAhac; Mon, 15 May 2023 20:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4DC40360;
	Mon, 15 May 2023 20:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB4DC40360
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47B171BF59B
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21673821D9
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21673821D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tg8SaMRC7q20 for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 20:50:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F30A820E0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F30A820E0
 for <buildroot@buildroot.org>; Mon, 15 May 2023 20:49:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.169]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V0B-1qARiw2Fyx-013viJ; Mon, 15
 May 2023 22:49:53 +0200
Date: Mon, 15 May 2023 22:49:52 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230515224952.7b89d204@gmx.net>
In-Reply-To: <20230515195731.GM2582048@scaer>
References: <20230418213241.28635-1-ps.report@gmx.net>
 <20230515195731.GM2582048@scaer>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:xUr2M/tg60mClPAVrqtOP27eQv158ZklSy/NfS3ztzLXt5dbvd9
 kZ7Zq4yUcZKl2aq2DNCToh4EZgEbhXB/4TN2tPJkj+TIP+LSLvLyfe55w2pSgiCwsYkVSp/
 cPqVn6NHWpEvgqXgAW0rD1hER6hl4JfMDnScrBxukzgvu+wN9pFqi1vkX3WMbg8hrrvtN+b
 eXtM1prDgZcGty81hOhXw==
UI-OutboundReport: notjunk:1;M01:P0:/AkrWkXLbOk=;MHKjNaEBSs0PdtCoi9eERWv5Sh4
 VGltAbKKUh02CO9/Jpm8nsss5s+VcJevEwPb2XXmEAwzEJSn9vAllnGHC69rbJYHbS16LqLQO
 jLKPRV0RJqPZykXRles/jfvSmbLN4KwSZsCXnBrY2Dh4EG7g4gqude2FKV1uzoiiTB/R/WZqI
 h0DsSdGmRq8xcZW6Tsmil/Hr9AhWbITdCJh1pe0jD59JFegf0j6wRxOmqEgFh+2Y9lCab+E81
 BhBD3Sfao60QYPk13Re5B9TBYMhmBO+nMjqa4YEtXvG2n6XVefTuKrxXmHsZHgxaJRjUsyw5e
 lM3EYx3ywEM/OPCahzJO1+BEuF8hg/GGmfeAPKLxIjdycuvcPHwfFAQWF2XuObvJ+DeIHlQpe
 rLCHipLp52fUSJLAmYHT9w8NMuyS/hv3g3XTPa+sYFgpNgnUZpJCfZ4DgKGmWmcWdTP6PQYi7
 lmx14HkjVYWtWbAUMBLIEVeUnv05aQYF4kRWLID3Zzzhp4buIwygFzYfb/U2BBvS22vjC0tQp
 uAJ5KUjj/ow0WhkfsTMWK3afcOXRI13gP6d2Cqt190guD1nhFYi7gamp3eWx7woY7exeJLE+/
 LsQ5muONhUTUsJgn7mF/cr/xNvlGQd3o5fSe2MeoZTfhZsSlaaeF2H7E7T2MNi3YUO30mLc03
 JAiRuzoZLBAU0g4bH/c6mFS4anwOaiUPfm2NJI2XONhaMK/B3noD3DXMxoX2O9vhoeymUdBPM
 fdBW/+j47GaiHuld38x7dNZ/uSpf3HVYfhqsJqr4pduxfmG/LjYdSfBXEzRurnIFvxkVysyB0
 pFU7XWg/YkClQDTbY6vnDHBiFjSagm/zoILtQi/D5DrrIaDSZFfWEI7MKXTauLUk1chK4WWlC
 Lg8itgPsXyP3RzmZHVWhTv1nnDHVbqDApKmCVDQev4XC89t2Flk5kB0oeahnOTjEgEGTbhS7X
 o9VKRsmciEXWQzD+YBaWF9migKU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1684183793; i=ps.report@gmx.net;
 bh=PL2OeAca1NeQIxeOzmm5siaY/Xx1V6PLpTXlJ7OThnI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cYvizpX65yetGZuNt+bQ8dodH7Ihy5lMrSCKXvlk/oAwIuiJtvQBATBKI8ep9/njW
 Cs6uWEBGoAvxOPIE/EanwdEnr11HJD1baa41SZBJjHPRUEz6VamjSdBogkpBfqjZrj
 cMRZrSsvwlVqMwxTIODW33eyCTVZLEoq38DkQkmKsyD2/+lh8KPyc6EwiZOvrhxBDZ
 xsvBnh0ZOn5ck0dPcgtjZ7ymmkB0zdO6eAuA5MUJdCF2erj+G2oydyTvojiOVtrEBG
 K04uauSJqBjtWaT4I9/3uDPCkRCcokqnN8v3CfF49VKXh/j/PmOCJA7Q5M/ytOYaVA
 Kemhp938/e8hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=cYvizpX6
Subject: Re: [Buildroot] [RFC v1] package/python-babel: add purge locale
 data support
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Mon, 15 May 2023 21:57:31 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2023-04-18 23:32 +0200, Peter Seiderer spake thusly:
> > Add purge loacle data support (inspired by BR2_ENABLE_LOCALE_PURGE
> > handling in Makefile) to reduce target space allocation by the
> > python-babel package, e.g. from 32MB to 24K for
> > target/usr/lib/python3.11/site-packages/babel/locale-data with
> > BR2_ENABLE_LOCALE_WHITELIST="C en_US de_DE".
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/python-babel/python-babel.mk | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
> > index 890a8b02b9..ea383e9c05 100644
> > --- a/package/python-babel/python-babel.mk
> > +++ b/package/python-babel/python-babel.mk
> > @@ -12,5 +12,17 @@ PYTHON_BABEL_LICENSE = BSD-3-Clause
> >  PYTHON_BABEL_LICENSE_FILES = LICENSE
> >  HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
> >
> > +# purge locale data (if enabled), keep special en_US_POSIX data by default
> > +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> > +define PYTHON_BABEL_CLEANUP_LOCALE
> > +	for i in `ls $(TARGET_DIR)/usr/lib/python3.11/site-packages/babel/locale-data/*.dat`; \
> > +	do \
> > +		i_base=`basename "$$i" .dat`; \
> > +		echo "$(BR2_ENABLE_LOCALE_WHITELIST) en_US_POSIX" | grep -qw "$$i_base" || rm "$$i"; \
>
> Why do you force keeping the en_US_POSIX locale specifically?

Because it is the python-babel default, see [1]...
>
> If there is the need that at least one locale be present, then can we
> keep a more generic one, like 'C', or 'POSIX', or whatever is not
> specific to a country?

See above...

>
> > +	done
> > +endef
> > +endif
> > +PYTHON_BABEL_POST_INSTALL_TARGET_HOOKS += PYTHON_BABEL_CLEANUP_LOCALE
>
> Like for the toolchain locale purge, it should be a target-fnalize hook;
>     PYTHON_BABEL_TARGET_FINALIZE_HOOKS

Will fix it...

Thanks for review!

Regards,
Peter

[1] https://github.com/python-babel/babel/blob/0ce196fccc024b1a65453ba6519954ada1dab6cb/babel/core.py#L1076

>
> (Note that the systemd locale purge is done as a ROOTFS_PRE_CMD_HOOKS,
> but that is wrong, IMNSHO, and it too should have been a target finalize
> hook.)
>
> Regards,
> Yann E. MORIN.
>
> >  $(eval $(python-package))
> >  $(eval $(host-python-package))
> > --
> > 2.40.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

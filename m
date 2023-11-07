Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336D4C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 17:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78C6610DC;
	Tue,  7 Nov 2023 17:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C78C6610DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qCSczNjMeX-t; Tue,  7 Nov 2023 17:28:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0034461037;
	Tue,  7 Nov 2023 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0034461037
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 894F91BF3B5
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 17:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61ED34218B
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 17:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61ED34218B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_YPGDVPOVzt for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 17:28:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A8D442177
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 17:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A8D442177
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 249E613F838;
 Tue,  7 Nov 2023 18:27:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 18:27:55 +0100
Date: Tue, 7 Nov 2023 18:27:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231107172755.GF229059@scaer>
References: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
 <20231107151518.GC229059@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231107151518.GC229059@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699378081;
 bh=0mTKrNN0UA31BUGMRtxxysDhjk9/1WcWEt7ritm0En4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QbUo0pWLM7r+rvgGVWha7ksziYd13zGyP/geqrg/d8lwnEHl45Md2nw8dpWAFl4VD
 K2TEytj2tzO0oZ7tMvyqK0HwyRXlIot43l21XWqZDnitCsVJ6Vwbcc41+eW2Tb4X63
 6TgqnMVjf+mTttAGArZl3VYI5YEZZ02V6PgE1PhGlJfa6K9FbObwU2obLluduP9xmk
 8UtB85aXzDliVKSccWN5i8Ce82pg3us3CPLvvIO0Zih35AgGLzrAMvUP8Z/BRciLVB
 KFEitgRDL9ohX7+pUzg76KW7gMEC1pDWLZzdU8ZP2YG73spU2eYGYtuexNDYch7MK+
 a189UBa7K7ODg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QbUo0pWL
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix additional modules
 installation
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
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-11-07 16:15 +0100, Yann E. MORIN spake thusly:
> Giluio, All,

Woops, sorry for the typo... :-(

> On 2023-10-31 10:01 +0100, Giulio Benetti spake thusly:
> > At the moment the npm_config_nodedir is set to the build directory but
> > npm nodedir must be the one on target to find the expected files. So let's
> > set npm_config_nodedir to $(TARGET_DIR)/usr.
> > 
> > Fixes:
> > https://bugs.busybox.net/show_bug.cgi?id=15826
> > 
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> >  package/nodejs/nodejs.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > index 2a8c570932..8f86413049 100644
> > --- a/package/nodejs/nodejs.mk
> > +++ b/package/nodejs/nodejs.mk
> > @@ -20,7 +20,7 @@ NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
> >  	npm_config_arch=$(NODEJS_CPU) \
> >  	npm_config_target_arch=$(NODEJS_CPU) \
> >  	npm_config_build_from_source=true \
> > -	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> > +	npm_config_nodedir=$(TARGET_DIR)/usr \
> 
> So, there is a first issue in the original npm_config_nodedir, as it
> references NODEJS_VERSION which no longer exists since 4cbc2af604e7
> (package/nodejs: rename to nodejs-src and convert to virtual package),
> when we renamed the actual version variable to NODEJS_COMMON_VERSION.
> 
> This is visible in the build log of #15826:
> 
>     npm ERR! gyp WARN read config.gypi ENOENT: no such file or directory, open '/home/marcus/repos/buildroot-upstream/output/build/nodejs-/include/node/config.gypi'
> 
> Notice the /nodejs-/ part of the path: it hints that a variable is not
> expanded as would be expected; in this case, the wrong variable is
> expanded. (I have started a build with the variable name fixed; let's
> see what happens...)

Seemingly the same error, so that did not fix the issue.

> Furthermore, even though this again is an npm-mess issue, I'd like a bit
> more explanations on why we need to change npm_config_nodedir now, when
> it has been working so far, since it was introduced 10 years ago with
> commit b31bc7d43870 (nodejs: new package). Presumably, it did work then
> 
> Maybe the explanation is just "in fact it has never worked!", and then
> it would be nice to know why it never worked.
> 
> Daniel, I know it's been 10 years now, but do you happen to have some
> recollection of what was going on?
> 
> Finally, I *think* your patch might be correct, but not for the good
> reasons...

So, the file that is looked for is:  ..../include/node/config.gypi , so
that looks more like something we should look in staging rather than in
target.

New build started... (nodejs takes 1h15min to build here....)

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

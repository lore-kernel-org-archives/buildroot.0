Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ACFC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EA640B0E;
	Sun, 20 Sep 2026 12:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgfbrYRKg6Br; Sun, 20 Sep 2026 12:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DBA3E40ADF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906152;
	b=V810Ko87O1XUfzMz4GKXuxHbOVtQKmgPV5WVDJ4/y4vt2sMTVPNwiOZeMFGtb2cV4L76
	 cLVLCXXQ2LTXoAOaR3J7bQa4MEJriMVnK7/YmzD180LQo/HRam+Ipz16IYdUrphzrfm8i
	 smo1NlN91aj0HBy+jYYVwRRGRaf0ZI88pbU2h7FjtZF6+KeM4kelQKOa/dfpI1QNiXUWN
	 ds6cAmQ0uhSWjrO3sczAF2XohePn/4hkeennEl0vG6Hq9qsyOHlg7+DAZIQvbfG8DVONn
	 ZRftmwKtSpEfYxsFQsywTDnhLplP3BqhsGTg34qkE0YoJi3GJSootShIH+H87yFEHAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hbd1fSP2RmCz9+NnkyT7cp/om0aDTpsYx56BK0/77nU=;
	b=e2mypyeytdlK2qKmzbe8EuJ9HDF1suX37H0psTg2kVvdSDq6XAgOp67omqaGMAk31bXR
	 3R3LBJzDzU1Z3sZuFAobh61sSrYJAIqKC6IDIuZFtVZnMsE6ALW0dGjnPIxHUDhz2D24z
	 9h9Nt7O1xaweDqpByG+srFg2JodT6AMa6/rozVJMbqIjP0zcR6rQOfzp8NbWvm8p0/eum
	 dTJcP81jWWa+BvjYjOul6PJUr++ipSkXIk3WsGneLCQgVeEvsk2vCsR3nklCXmp1dJFv7
	 aNIFogYaBHx5d13ht571ksUsjxLW+UbStaUkT7kzdg6Opkl3Na2GnZ4oom7akwySzlg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906151;
	bh=Hbd1fSP2RmCz9+NnkyT7cp/om0aDTpsYx56BK0/77nU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b1x8VVxSonYGCwjI/c+wflIi6teVF920QksWswnjBv/XQVAP5v419AYrISCGs5HMG
	 /By9fFoWejqSiUjKbXj+HQTFwJ9itAL7n7QYs/MV1v9b0oyHAyf9QxQmngy6epGj8O
	 msjs621j/ZpL/OVo7SCSwAAm/FZgxGtz4btWZN9bC0SyGKi75ynGoCC6Jyh3W8yZFt
	 lCu7n0dhDQEU2D8xbqyJg+es+4N2lmyLDpVzy4nArK7/OIWRgy+9ABqTtEXXJ0XUPs
	 PeYnqnf5mt3ab1dgY5fF4St/J/vZPce3nc9PHbriHUczMkjpb2iQA6mjY2IdccJeQH
	 YXvEImncZpzMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA3E40ADF;
	Sun, 20 Sep 2026 12:09:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D81B37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C13506060E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCdGCKOYGaN9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 608926060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906148;
 b=M8AyqWgv7VkuKsV/Rh1fMiosEuR6Mmt1aZxUPfZyLbSmSqZZNeKC3jII4acxi1jKhU+F
 LJPoBQCnzTnDMs7UPDprLgvk4lZiQDLFM1aaqpjmnLJxSN1o+ZeZNGVWjuR/zLZTL0olG
 xgjqiagtYQNGIRhz67Y3HcS4V8+1mB2oy19fpQ3QvaQh7Fznu3JF1UF2KAj9rvlX4Qmp3
 HtoBseLAhTcF6TZEEuBeSjTHeUIL3Lka5gg99nRjs6hYkKtBqI0nnJbNHDKeRYQTgWJzN
 FZL9hVVAA7WpO/uobTKqMo7G+TlswhwnFhOI5ebEwSzLPR3LDibK0fRJIgXKcvnItGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906148;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=i3z9eoOMJD9tJ89Gz52Yf18ZgDr2x304XGpCxiMuzqI=;
 b=E5whI9fFIfxFqLqrsifpr+YlkZpKlMBGhM0uSk6JSk4s63BuhYNEXJmX65OWTFSYpT3D
 G7LhJZTYzOLtUM+AxfneKc/8xRzEMBfJQ9TNSd1IMCtJ4paBMzpCC327blDpCH1CaFbX7
 xs2w4Gxn31WUWa/jhjSRme1gGjNtnSlpUnC7FOKeoW32D7aXZmqcC/6xa9uBUB29Irhjw
 jm4GjXNFqmK6bouAcmyevWuTKCwrUtcTE33Mc3mjWCoyoZ0gGNPW/eYnLZVxoHt0+mYbN
 LaqnrSOMF0n+Kg7JI5bdzPTBAMsBTMBqOEa2hoR+P6bRzxiP8ftGuot8DDZSnsGQhGA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vih0jmP7; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 608926060A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:09:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E24571A0981;
 Sun, 20 Sep 2026 12:09:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A514C604C9;
 Sun, 20 Sep 2026 12:09:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8826C103282B4; 
 Sun, 20 Sep 2026 14:08:56 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:08:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_M07XrIv-BiYPv@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-37-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-37-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 36/77] package/capnproto: Fix build with
 OpenSSL 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 19, 2026 at 05:58:01PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

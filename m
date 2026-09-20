Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D557C982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 579DA80CFA;
	Sun, 20 Sep 2026 10:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyFZj2mPVODQ; Sun, 20 Sep 2026 10:17:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2834780C8B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899446;
	b=HhcI4MkiKl9eVOyyjMr2M4Vm6hMIhdd5lWGKbik/CQoe9wuA8E6jv0sGCSPmIT9uKD84
	 ETZTpS5PcjNcpGGhWW8ilB6PD6BPYhjCysXnHn2yj/aDEdoggeptQZ/RZuSgOuJU50tYi
	 0S4Mil/d+YlMTyjTKRsPe7llcdPgSRJ4jb0oKfLowmV0jzCEykbmyimUnvZn5c+itXobg
	 YmWaXJ5qaPusZONfwuPqwKSSXXY4fkwiBkMdECxHn+iDqBtWibvgw2eFytYzyhqKRbK2c
	 SoH5YeXzzRzuqynQnkexMdhxGYFwcLIL9Pd0uy+yrquNW6VBJIFl4StcogVvlFoyYQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=omcL6eUYPP8afPM9wKFTg8LqzLKKaBmHICM1TJYkht8=;
	b=anF8kIkBmRkcl+ZX4F/Mc8ibajzKH+2eZKuaycjVICqyfhxXZPIo3idL9s28PN1KliqS
	 rs7NmZWDIM1jsWnrDtqk9jx2Dmdwep9xeHyMDsPdOSiStnuluu0gQ7vXCeb4c+qUIOS38
	 61To3vaKYdRLZuZHkV4h+gSxSFua4P1Z6VXnm7AqHNMLd/e6dYKJY7PZYNCmllc62dc8f
	 dSwL9o8EtA2alr3CwNxmeLphZTocy/+NTbzzSO476LkU+mD6SG73gYnQBaoUxtXc6LcRK
	 afisGx3kubPGPUpvHyGqELiWXO5ftEBnensceSkhenXnM2iN45+GN2FtIYS9/n9a8QQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899446;
	bh=omcL6eUYPP8afPM9wKFTg8LqzLKKaBmHICM1TJYkht8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=neQQ9zFtArQ2O4gev6BsC0N09eq2s3vZWfmY48gxVQd7k2YxnmKkG72RxRY7JqnUo
	 C8yO54Mj7iDq3zNu+aeoMgNIGzu6n5wHqkoaWu2TMrrlRJI2opEozrVepB8VLKMOKt
	 dQijyGl1N4kczycL+fMQ5pFqUFsrywa7+/MNJtWwau/UoElENrMtap+rY0dwyH9yPn
	 a7mPoNJscR1brYMDkT8eLL61f8fpSBFegrakhAb0968Ky26YsMYQxASLtRrL22RSvL
	 qQO8iWzvNAmTW/cysnIFy45XoH+3IA9iR+LKDxtZQVLjnd+snLQvMQvN8hbVqeRXkO
	 m0kZd6rgyGVrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2834780C8B;
	Sun, 20 Sep 2026 10:17:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E38E224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 002BE40062
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idTRoqQtPch2 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:17:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 012F44005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899444;
 b=XGLGoLfGKgyOrFHGG/ekSZ2+Mt4kThBcD1TJZgHMfDaxiakl6LcAkyVZ8NSppaa7S2u/
 zJv3QMTWM0t83ct65zFHrq9oVnab7alJNU9TC3/HsSKYGttYCDydAzxnBKZqOClzB+yAU
 0RGWVLRyamHqELu8fGXxTYe8BnYvN5JDxzDeNO1fCeraQ4TLh4h0sUxMMU9m9oJg4iKLM
 jyjM4kY54Ah3xtIZpxrc9U+ozE6OpK/0u8mRdqgg1PGuB35HiC9amDntGiivERr4OyR/C
 PaCYF7Qjd2Vdt6M5COYIZBqoZqq1ZCsDXRuwUS746jQnFgStEg4wa2/q0Eau5ZmRtNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899444;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=s/kCE2zSupjFfuSlbyZY/S+sqldFAcFVpZQsat1LLj4=;
 b=krNGhB70JtWWxXIyHqpSHmCFeNPXpeWj2xKGA2ZiIjRJhaEPhQDzb1thc24/1NRtqbHw
 Ai3C7hd06MtEwIbSGGBLs2G22sApGscamMUlXpfBkxyOPT96AdE5DmjGofTaZGxKQWE4f
 XA1DaoDcvqRf3zOuckpg2nJVl/BMC+dE7J+aRbOysAv/ZUKJXVGcnh1lHnDbwhNR5deDb
 otzjG7Q/Z5FV/l7P0T2mXEbMBQGKP/0XheOjVnmzgC9QLo2KhK3En1aMFmJRnv4Zoj+xJ
 /wxZR5G0Vy23IhdKyWb2fmgwa0dQcWmd2PnFT3s1qMP+JkEKnU3ZDUCte3KthG1HMKA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LfVz6yQR; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 012F44005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:17:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0953A1A090D;
 Sun, 20 Sep 2026 10:17:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 869CA604C9;
 Sun, 20 Sep 2026 10:17:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1527110328160; 
 Sun, 20 Sep 2026 12:17:08 +0200 (CEST)
Date: Sun, 20 Sep 2026 12:14:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Yair Ben Avraham <yairba@protonmail.com>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
Message-ID: <aq-xqh_4_J_v2lQ6@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 01/77] Remove mender packages
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

Hello Bernd,

On Sat, Sep 19, 2026 at 05:57:26PM +0200, Bernd Kuhls wrote:
> Building the current mender version 3.5.3 with OpenSSL 4.0.2 is broken:

FYI, I am not a big fan of removing Mender. It is a widely used and
modern OTA solution, and it makes a lot of sense to have it packaged
in Buildroot.

We have not been the best at merging the patches from Adam Duskett
keep the Mender packaging up-to-date, but I still believe Mender is
very valuable to have in Buildroot.

Its rewrite in C++ in its v4 makes Mender even more relevant I
believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

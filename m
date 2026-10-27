Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADA4606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ed1eFzNd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 695156069C;
	Tue, 27 Oct 2026 19:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRiCQnOXBdO2; Tue, 27 Oct 2026 19:22:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C389F6061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793128943;
	b=VHd8tidR+bIEWx5QFm/ii4xApmpSq5h1rNd92O6644Ln5wFrjUa7KIg965ijiPa7L/M4
	 D/89r18vb7Ju1WiAda+4jO6s3/X2pjp0HrxvjyiMxMjAGP5OccRSR6Xt/x2weQguG9Dre
	 GiHWlwHB7c4w/gJkv29fidgLKVeReh5rbxpx4FDlKiYFtpvQTXk3dMu2/mNIaellAPV3V
	 9JWJ8g8EN7PIQF/EnpubKF900FuAu8/+WmPNjHP7Q8pC9L0vibK6Tl/lNmZJwtRqK+EH3
	 +54+o0Hfuk47lc16CIybDcWgnFfhqXREjYf6a5FShOK65Q2aq4UBhZR5J0KVGoUJ6IQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793128943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1dI7K1NvW/dFXp+pFe77fC7GzN6WgPcpU9gLYXYRngM=;
	b=POvIpjr0Mo+1Ha1yN/NxUptrrJZ43w3Vd9TjrAO0eIfQDQVZBrSAIxvPp4/Ee+qEqOOh
	 FCE2HwbMS6N97gk8RvATRiG31a18HOqRuBQBZcE4Ks3nWl0OD88JwSghCnK6IwdVbV2/h
	 DmH43o12qTT3OQYecRvf9nGdFpXEJPafC4zy3HkwApEEJ5GuzIvS39ycgj96A64GcQMnZ
	 evrw32Z/LvK5swDfoAOh7exsB9Eb7WIOOa7RkSymkEXxSHeRQ+4olT/CXi6KOZ6puWIoS
	 lRyOPv2FpwFmgnV9V4xbFbikLTtXWWrcX1ky6KqfZlet/A3mcl6cGjH+EJfA4mkl3Dg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793128943;
	bh=1dI7K1NvW/dFXp+pFe77fC7GzN6WgPcpU9gLYXYRngM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ed1eFzNd5zIi0WWfX6Gi9Q0zkZ0QlXB1LKvwf5t60kmcSJ7wSABDBRbX3PUwhY9Ik
	 Th13xM0YAO5y3dNGYNA27R/N5fegp3qdGHMVW/NMYts87YXns0iywnpMT3D3WmBTry
	 ANQ107r8zFDfeYQfRqL4lcZMOege3xmC9T50A0DMZYYsI6hTT5rm3SEr9KMIdGjn8n
	 Glfjq6u01TQCVOHmLhIeHO9O9fbg28eyFJxEPsGrIlqp2/3TBw36rjLFVQpYMW9F55
	 4difcAKSEuP9dykZgzo0jbntL7/Ke/HBJ4stvq/oDen76lna4us0OnKSLsI/T0Br3n
	 corMBwKvvZAgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C389F6061D;
	Tue, 27 Oct 2026 19:22:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC67279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D28A4061E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeoPdhhc4JhQ for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:22:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 194604061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793128941;
 b=R0r6e/pvgzkrex+Zcyr6bAQ1cOsb3kCp4BKtEfUyrv8E8redMkFquKhfEkY1/FakUwBv
 jsWuzijjcDhkg2KwWCKNtqzzgi9W9xSHJT8QkIlhfKCYOeKWwEUcFEeob8WfK4QfGAV24
 uWiCA+u8JrbeRXFDIt18TCwIQhQ9CEhuxPU3bGUaNhvKv9N/QDN8++ekaODy/jowv/Mww
 YssE+wl95M0FC0QvB5Y4M48ElkKm4rGUL6NxM1cftf1DQ9eZeqfjqDokHfsrpNJUIsWJs
 wGBCwRS0FJlxhqTti4i1XAVt9Q/AFpoxEhIdasrgXotrNvlP6cfKyQr8fKB9WZ20/GA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793128941;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=wcgnr0zwyWH+7yKWbSr2TnOZYteBxa8QdXc1xxRJ3OU=;
 b=eRuJ/SZ5wTmivqDNrtrMjmGuJflUSaQQpW5k6Gl9cql1aLJ+nys1G0/A+PMY3uhNntcG
 71+oA+TkX6jpZmoz0GcNqc/3WL/ttQGZztrH7RO6XGsAad4g2V2/5dXJll88XapfGNCRR
 suSPHKmDVO38V6lt094l6jdXiWSYJp6MwT6rEuNo9uJ0DOMkIMCL57dRyQs2fIu7/VjW2
 yEqdHjcMvuwnZ98Y9+1K6U3u34TVOAFCfyeVcVP7OETZJc+8odz//aIB4wPTGLK7tEZEI
 zoPWMpBiRXkwYW3b+Bx3sWzoE9x0RpWEO2Ylwh2TUgr3mw27Y7y0JAj2FOx6LQWHSGA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HawpvOQV; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 194604061D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:22:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 327D34E4134A;
 Tue, 27 Oct 2026 19:22:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EBD42603BD;
 Tue, 27 Oct 2026 19:22:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 27FEC103290B0; Tue, 27 Oct 2026 20:22:06 +0100 (CET)
Date: Tue, 27 Oct 2026 20:22:06 +0100
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 Petr Vorel <petr.vorel@gmail.com>, Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <auD5d-yrritLxAfN@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf>
 <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
 <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:53:07AM -0700, Florian Fainelli wrote:

> >  =A0The only inconsistency that FOO_SUPPORTS_OUT_OF_TREE is only used if
> > FOO_OVERRIDE_SRCDIR is also set, not for "normal" builds.
> =

> That is a good point, FOO_SUPPORTS_OUT_OF_TREE is capability being
> advertised, it should be unconditional.
> =

> Is the direction we want to be putting the sources in a separate directory
> all of the time?

That was the direction I initially wanted to take with this
out-of-tree build work. I'm not saying we must absolutely stick to
this initial direction, just stating what my initial intention was.

I really like when things are consistent, and so for me this
out-of-tree thing had to be an all or nothing thing. But maybe I'm too
psychorigid :-)

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

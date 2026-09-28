Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5630CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B8680D7A;
	Mon, 28 Sep 2026 11:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmdDBH4CyHox; Mon, 28 Sep 2026 11:50:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A0F7980D60
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790596209;
	b=UU2jIU2YkalmvAqS2GEsOyBc4fN53iO+rK06vFeOY7eEtWzkUGQ1U1appm7Vpn2dLLVO
	 Kqwq3jn6ftf+wLkFpVgfTqTF8AzOtgt1XJD5MEKPx++wZvQFjQnU8Y++C7yJH0cn4YMeh
	 6iEStE/017VxN8pyxN8Fo9Rtxxj0sZQtO1mNsLalWobEqsGg/uRCgLtVLwX+5Hh9SsTJi
	 KyjPmRyaHFK2AMLlkG70VPm49f6RzGu67O9Y+GiHES3ucATok4EO/f1Q6fVk4aHq7b5ki
	 N+GtlTKDCzxFRXc+daSeD/RO9pyTP1G3iAJSFPTja9Z6PaDg2oNaQI8x21p+AKMZyKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790596209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=q7mjczIcitvuBVmuN15sK1nm1OGRlaVKejsNw0ma7M0=;
	b=J80btS5daoET2KSAVYLELQ35hhfEvZRhnq7ZldyhmzaPFqnxBo6WrqrQZ0ybj+quqnOj
	 cDGKH5Iksylngj3PaMAfUZx8S7hVv7WYwHZYxDCwurWB6jp9fhJIKN1abhoImFVzsxdwA
	 k/mmX7IAEfLbplooFBSpcHJ6mFSGmI+hgthOopoxM0HHIk5O/p8dDHtW0KLwi4wpk1bOt
	 GiDx8zbpCHexHagqbDF++G/VM88zt1QHnMC0xLbsuWXc0ZtWdU5FvUCRlA0zO3IKCkLM6
	 yFmSw2lw6vTSfXRUvjtbnsC+c2yNhlZetl1W0qNDYghoi+xXY/+I/b+PNaAxgmBw1uw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790596209;
	bh=q7mjczIcitvuBVmuN15sK1nm1OGRlaVKejsNw0ma7M0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mjjs0njL/ofw/4GE4cnEj51FcTT2OoUrka3q5NeSXio96svRuUYH690ExBXgjVo00
	 d4FWzciDH48Kr6Z4v5hid/bL2HsAbOcR9XtdE4rBO9MrUYDeTKT2+u2ugxyUS8SM9M
	 0tD99QQOvwNpVbsnTrZ15h4RTfYkEp9vGXrBOLlMG+LW/GPrHe5NB1hOv3j+kpZ/rG
	 uLLAcqyIdfMt4itPmt7Zi4gz053M16wPFbVkIiQvwLubk7sMlNJIXVBlJljrHwG5cR
	 UEl32AKWyyIbCRLBzkq1ikroIXA6E+2ZMNgZ5t8cPpKRcgv6mX6NpYBbM8AfcBOP8g
	 8EDMOAemmkWHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F7980D60;
	Mon, 28 Sep 2026 11:50:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 718CE32F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62FC560631
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3g0921wOSQy for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:50:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1D2E3605EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790596207;
 b=lJIRhf7eAiYLmoUg8sgJuTPSOuiR/FhZWhULW5u03JpOGgXFU0TNHlV5OHq7/I+9+Vqd
 BYjJZMLhRL6PSq06pMfXjvVF6X+VToDPeVHCI5YLEVVkuyC4RXF2QLV01bOnxtH6wcMj5
 SGS6lwSyX5l4Yv3NQqcONS4juZ4whE6WK906EvtLhL5qUwsbmcipbSHQ4Rb+A5R93AHgC
 sz0ooATm88zbyA3xnml0lU0v0nLU8tqy2TU+YACJUSnniB29ggTv+GFFQ4HNGiUA453Lr
 GW5KoSd8FENqsVqqrndH9ug95NI3ezJxUT6eVQTUQWqV1/82mxpzn8XR1tw+NDhzQDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790596207;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=TQAXNthkOgYUb3lUQn+6zz8y3aEhM2YyVTRubjZAKQg=;
 b=Ww1kEANeyDJimmg8iM7WeCC2XpJng9lCX5Dvf/1OctsY3GT9hZ2L0hY6PlV14mtl5qhS
 miR3H/zUYibAZPDEx0dlSxT/E8ZBSc0zUsHfSd6oAmwj9NLQ/7x61AD5lYkfaLslCyzvb
 bpxUYOTZfdmeCpQxbXb1dlapFhhL9lJdqQhWqpgc2o+H0ENAB5dTooHCqW2Q9q2I6hSLx
 gGdoTDLqhqUCg243x8eA77BUOicDtmbbAFQBJoey3OV9l1dROSOMpUYo25eaLgFAF9QAQ
 IzfV8Gn5ZTHAwXNAJjisXAR07wM30QO4pWl22ZzlDaREERpig4F/jZrru02ZRM35maw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IiDXH2IK; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D2E3605EE
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:50:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2417F1A103F;
 Mon, 28 Sep 2026 11:50:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E226F601BD;
 Mon, 28 Sep 2026 11:50:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA3F1102F1ECB; 
 Mon, 28 Sep 2026 13:49:54 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:49:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>, 
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arpUXnSAJr41yG3l@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-62-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-62-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 61/82] package/opensc: Add support for
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

On Sun, Sep 27, 2026 at 12:42:39PM +0200, Bernd Kuhls wrote:
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

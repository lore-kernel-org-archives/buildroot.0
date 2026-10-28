Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80660A2601
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LdQrlq7c;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2URfT/L
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9195880DD7;
	Wed, 28 Oct 2026 15:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxtDeFGqL_Sl; Wed, 28 Oct 2026 15:41:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B673C80D1C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793202102;
	b=pInm55fnCYciOPRZCTu+tXKC8qKTReFUzo9VgeUuqpbSi1rVR5PFhc40UhafXJERiftU
	 SLKovKUjfLwhCTVpVZ5LxP/cH0jrPqS/LFjJMFELf+AhVfa0ZIH+rQ3Re5GugDmTCZCM6
	 TS8Iukz6aWhh8YfJ8eAyhIryBryMn7MwTAZV5yPq/eLD33AToNMFdhbWWOnZQOA3Pd/Gi
	 4V2D6HBedzkn08TBN9g+Ma+5Pz8kYOwg8eoNbNsnFFYK+XGkxjF7bttuxhNsPXxl+OdSy
	 ADaTMr/O6QHTPGnAnqj9+UpHffQFe/7tMCh/4nuzduF+RM2Xv51C29GK+Ncz9BLvzmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793202102;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wHr0lliSY0eBc4Sz3SAvNlsAPogLJ4lKYUAFCMclXx0=;
	b=YAKMfshOnJgoftEZKb3pIMAIA5PIYwLk+pEiNCXX9PWanrmvrcFuvPvi1YOiqe0feQWk
	 XAmBk4gRTNveDJY1AR0EzU0VGOTId+ac+1z7XDPI1s/KMa7Ix6chVjwm3qxDz6b6fU7ge
	 JjGK9ctESHNcwqi5O4UkMkmHFWhAlZkQQhNEWHwnI/ebfJxm+IZksLIw0/vfik1lCTdY6
	 +4kjOT3Dlxf6ZTprnJCCBtm7WA8wbjmzJagsxUEzxEdfD7fUyOY6kR+Xzr5oVLmSUQDGk
	 knWUzW0UCyQrKyxxP9mbXLdZjSltLzLGeTq1yjl+W/f91x22K9cdgDwiBbVcs1gx3FA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u2URfT/L";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793202102;
	bh=wHr0lliSY0eBc4Sz3SAvNlsAPogLJ4lKYUAFCMclXx0=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdQrlq7c+0eaGzbBj1+L+nPZG5kSlEB+tn12X0yYbuKR0/20SdKNCoGq3BVrWd2hG
	 m3Y4LOY9PLc4yhgsb/efzJvbx74O7IGaa4Lk47JG1z6nVA4VdN48LQKG//oWVqrqOa
	 ka8EjRIHsoswEsI2kVmZ3TDyp5tu2FyTVY09OhJ4eVeJdtxVfoFP3OZPYc4u5M4xpR
	 7QiAaKMluJNZ6Y1q7GfB/C6jIXW14aufgUdq6BiUWgaITzH37f45tOurNAOObADBjv
	 WWeJDSlR8NQzIBMhS7lDIcqEZhqsLWYMSlEVlU9nQmjP9D29qYIDDZAYgxjoI18OwH
	 J0QcnPmzylThA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B673C80D1C;
	Wed, 28 Oct 2026 15:41:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07DA7D1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED88680D1C
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTEQX3qiOl1t for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 15:41:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23CEE80CEB
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793202100;
 b=o42cS+gbukuMsect8raFJalH9nl3T7WCEeQjoc4NJUUJY54tEntoUKTtnj7Op2IL5WKw
 O6daiTzR8PJMvu3UqzI/VUWjBtza1aYvMSU3Kt/JUUAdaIdgFc3ewHzD3OrHUkrSQmWpl
 o8+n8YSNItY9eET/6VSsbrXkUiXHnKfnNDHIkqF+7hEYQZ2r6JQYGUjgPNZqmPtB1Ux+S
 UDkMcfcnL2CT1t2Iq0crJWHEsQ6KTCJsZ+hZl1VcdG+hESLnAdkdaGOiT82h4FEXCdb/a
 X0WkBllSjBdgv9kCUNIguCMwejnAS6XcmwLgydXYZ+8by5+mgH6Zd6jMMG9xdaE+ZKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793202100;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
 bh=XRqsHr4KLw6VM0vx7XmLP5JIhnZKBu5YgRi0XXc9+UU=;
 b=RFLEfoFxq094z7Ld5822VQOqdI52L4hozmj+Be67G+9TbmJN/JZs3GsJ18gH0WC+AFJP
 yEH2gCwjUAlgnKNwVxQNfdFkyEwgF7Y9tJSMXGKI7rq7GHtAnXHxsFb+sJ5FQXEiW5aTW
 MR8sd9u/kQxpxgGX1QJYJaspqg2WSYmld/N/gA1FJ//AfSMWeJx7i3udKqEmo8AC6HMgG
 1RtlGtmVgpz+Da7y7KuIxKstOSZyPJvKQiISg43a9bpOy92LgN3vXk4h13qpXR+Qnl4mY
 GGnQpWGMKR8FcBJuTYe9lqiSQbrHnQjkKkCWwSlL6u9NS+8pEmJRKZbWzEY3aRWAf9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="u2URfT/L"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=u2URfT/L
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23CEE80CEB
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:41:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e22b83de6so54982f8f.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793202098; x=1793806898; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XRqsHr4KLw6VM0vx7XmLP5JIhnZKBu5YgRi0XXc9+UU=;
 b=u2URfT/LKM6DH71LPwV2ydzJHepegqYyIYRKuTMsIKCs7m6dl2x8ZBSA5t0yxunafA
 692jvsVBnQgpCqeC8TGzm7umbSoxV1x9laWUFZ9GgoX8htZAFgeulo7fqU5l26lj96zk
 RgF1feYnpTIE1Cca//gX7pxEXwMA1l89ieOD9J4+hdHL12EBhkkWRGWQ1K4fegBYM0b9
 nrFBsJt6t4bMBqJ3V5Unzu00NcLhUdMMSBavjL+iRRMcTO4hfvgr8MIk7qi1K2Yv81Yz
 dYF5JhR3KxHWNsbjABMEXqTpLUgSZMwGlQePyyi+yDZXPBURoRhVo3tblCmHZqIflpHV
 1xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793202098; x=1793806898;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=XRqsHr4KLw6VM0vx7XmLP5JIhnZKBu5YgRi0XXc9+UU=;
 b=HD+PgVkoraak0HxG1kfURR7FLDRpKuBWqWytSq6pC+2f+F8/et2OfHkJN4/xlKdm5N
 xVZyeylsfr9WaDHpkSrifqRu+zm+rCOSrYjoKkm1sYQWtciAzDpLtJPHgu95CR/OAWrE
 ClVot91IaOhuhALuq/bQYzvfydRJNHZRrQ9xI+HL9OhIeQL8Uod6kZLEeTw+FjOmLW4H
 w5wmP9MnWYoJWQw8oxNTrUg2MuBxC3xXaeDg1jwyEJ7KquH807kHm2Qt1obNfWSaS7f7
 e5g1kOnv6g3KYr0mVEc2rVnNnvhNgYja1/+GnaNWfxmpjBgpSNVaDnTpTfypLcNzLmz+
 r4mg==
X-Gm-Message-State: AFq9FYJ0RpBel2VF1Auoy8R3ZReGkRxWShz/NjQlFjKLuspNWHb8fgLc
 2I7QBAu+VEoRB4SgnDjgV9460Y1xyWXB7ZrRYcp2mQEpfbp4Mu9s+t1i
X-Gm-Gg: AYBFou0QaNjRX+tRZ17dube7HKj3gkQxrs4xk+d9Ou4Gllfl/xJ2o/y2JzubIPfuxMB
 C+NHxrPLBN0TUyX/rBOZa6tnI8fAW8hnvdkhQjQ4bK+ts80o+DrENvMkyghud41MgSjWo9GujB8
 wKbQDI9R1GU1JKgmfjSZfWNG8IqVWxuBdvYHe9xhQcXi8FzuMTtxkLAmHV2DW+9xRLhyOzXCh0O
 eXjRqlQ0oO9AMAujHXdgteB71IJwrDNGOO8aMcclL/FJ4yr6gJKH1w5Eh51eur6RDA+NswCpdOf
 aJUHs7WgEIDJFj+k2sVssKnJ6JKm+kOkJSnuv1HNszCfrzpoFkmDuH948iyQIlgrgfgYZXTCWSB
 G4nzWU6bzqQVTUVXlPkCRNbnQH3eCzwd3ujcVW9S5KhufsaDSOMLRTMwkXzZnWZX5pfsLBhUy8u
 tf1zvI6Lbc8cIKA5wNiApAy21i0YWobto49FQVnVc1imHNZlnV1c9VwsJTJLn+aia2FCEzWpbjz
 Q/IibsCoXRTUeXWeZd0UNim//TQOwnt58SN19W69x5UwyfQOdABHX6Y5OBcBvWdfgpbmjqo1QuE
 cPaC07cOUwIsLiJXsFq+FxPcmeAUStBspILs5QaFS88=
X-Received: by 2002:a5d:4bd0:0:b0:48d:f1b3:7e82 with SMTP id
 ffacd0b85a97d-48e5d27ed3dmr5799444f8f.0.1793202097552; 
 Wed, 28 Oct 2026 08:41:37 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d401:2601:1d6f:a616:863d:9eaa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc39b3sm30079815f8f.10.2026.10.28.08.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 08:41:35 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:41:33 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?Q?L=C3=A9o?= DENIEUL <leo.denieul.yoshino@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Maxime Leroy <maxime@leroys.fr>, 
 Vincent Jardin <vjardin@free.fr>
Message-ID: <auIW8EW-9Qo0NFXv@skbuf>
References: <cover.1792395346.git.ldenieul@iliad-free.fr>
 <be195354e0c84dc3ad31f1d53972d913033e01b9.1792395346.git.ldenieul@iliad-free.fr>
 <at5zpO5nrHoXUw_x@windsurf>
 <CANMZqkch_Oe5f=HAEadncxXTHMdsyM_gBm=YvbGERg769v15HQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANMZqkch_Oe5f=HAEadncxXTHMdsyM_gBm=YvbGERg769v15HQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v7 3/3] board/lx2160ardb: new platform
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:15:47AM +0100, L=E9o DENIEUL wrote:
> Hello Thomas,
> =

> On Sun, Oct 25, 2026 at 10:25:xx PM, Thomas Petazzoni wrote:
> > Since you did not add any entry in the DEVELOPERS file, who volunteers
> > to maintain this platform? Note: we can add multiple people, that's not
> > a problem.
> =

> I'm happy to maintain this platform, please add me:
> =

> N:      L=E9o DENIEUL <leo.denieul.yoshino@gmail.com>
> F:      board/nxp/lx2160ardb/
> F:      configs/lx2160ardb_defconfig
> =

> Vladimir, as the original author of this support, you certainly deserve
> to be listed too, and you know the platform much better than I do.
> Would you like to be added?
> =

> Thanks,
> L=E9o

I'd like to try and stay involved even if I don't have a lot of spare
time. So Thomas, if it's not a problem, please add me alongside L=E9o as
well.

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

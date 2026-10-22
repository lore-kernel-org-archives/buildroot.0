Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E8606A330
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XOJEJ/aa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC91811EF;
	Thu, 22 Oct 2026 18:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlVuhqw9rNoR; Thu, 22 Oct 2026 18:20:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 870C0811E0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792693201;
	b=BgOvIw30FMCIAvhY8Jdh10kprij3k+xyEaVzrz7ESb3FriDPFlFUytaLirarYaPFMO00
	 0dS5Q9gx1/62F9bUspZaWALSmlnYcwG4z7g2gfSgWskzOzbZr+UsnIvVnxVC9ycIYIPPc
	 iHSNIwV2QxEDJNbL9e9XfZdMByyxB8SRZTcSeX816/GKgzcoAJVVMX3trvbdEarT1qJt9
	 Y4XVJr0S3ePJZ7Xz2Mr9CsWYjhCoTq+6m654A1KNItnYnYyXZNVeeoQaRA0bEo6RI5YXg
	 zgt0MwW0chOzm/HO4o6C6/oDxvpGoGzJ8rbz/TjlTIrWI2HxnmegEYLuvux20gw71eQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792693201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ysWpE7WDTADcvtNBG4NkHOOELuSDdToDVwmtyV1D44o=;
	b=FMVFOGIUJKg4rlsJp3qDYsYbfHDlRyoPFX1QuvkiJNCIbALxjfIMXg+oG0d8PYhW6KX/
	 FenhdzI3wa5vFXJWSoGa27IEGNpsXqinTAeU9bRIGISZJQWYBbJRvKLBAdsIFBt48mX7+
	 3PApzCyUJU+VnXqyPNLw/hv7a2z8rk8BoAjKK8NkWDxd7jZiGbYtT6M0ppzjHXQscIQ0W
	 T4T1Ce09XzZPv7AwHgUm5ouHuE2ampS/MAvyarDJK3LKBgrS8H4qGbuIKz4njrcOFUBF3
	 SQSXGq5r2kvBM9FyISaWigdniN+XT3KIgADV/lqz1p7dUItL474aCZx1bzNgWjFDy1w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792693201;
	bh=ysWpE7WDTADcvtNBG4NkHOOELuSDdToDVwmtyV1D44o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XOJEJ/aaNZyj6H5/nDz8B7QmVBAMuFc/AB22tmF/9Jid/pBvqG8KqF1h4a73ElB4Z
	 Krg1zutV5Az5gbfvTfotRwgG3OSFODYwm22nwZbkIjogV7StY8IB00MgwJD77bC0gz
	 M/OEj9UKs7ISAc+iUFjnOqTBRyIzEVnHq3N4MtxjJrVjuNtxfcF9BbzWU0Ax0/LA0Z
	 66y79HX7zFg9l4u9tehvO+j9VnNZkSJtD2n3h/3f9lTeVpPmWcuJj8ynjpg/AlMaTn
	 VgTe22IYcVwRoykbEoU0T9bYfehDh+m4X4NzNznK+O0g+RlBI9HdCqUPT0tGuHYaKr
	 1jCkPsOO1SpFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 870C0811E0;
	Thu, 22 Oct 2026 18:20:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CAD7499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21D096079B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmHnTABiKZ7x for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:19:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 938D26070C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792693199;
 b=iOxhOCA53LUtvqyL8LQuQxq/LpiyCO2HBF+THYqqzcYgBGAI6Kr9aRsbylitjM3LhtfH
 Uo+kDvbcJYjYRjSjIyQI58Lnx3RgRsbb2ieqS/bhTf9JPCXPAPhShpDegy/frlWaCYbRh
 Is5g5jr6UZGLlalX6OgLqA7Xk53mJJttuwx1442sXxSqCJXRUo360/Cs/fY5pAmm6dVfX
 gMt0PL2U/XAxHXZsApkXbsdZNO6wCaHwjflN3K3sqRa5qURhnDHZfhWwFKtUiRG4ahSaM
 mgePiBeURKlgwOCblKfHRuV3zVXJV0jx5BYvl7DdsvYZYMpUgxwHhqR7Wsna/sWcsrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792693199;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=r/r5A+y5YXDWo9nf6rYwRlVRvT8xbK00BwNiH1YOGFU=;
 b=TcCG0i8b5ipj7iXaO2HfC9IgqEV5E2gCzFg154SY8N/3lEMA+2Lmjd9l4ZcHYXEhSWkY
 2RQCen+e3W/T9PgQAsjobrw3ZSX+ETtzlPB8rKknOB1xxnVhXgMNAj3gN/Dw7EoAxMx8M
 Sh3vksQt+xKW5hZr9AXA0CccHwefEQjWns2SZpzHxo7DolzGjC717ULgvHhvkymskAfGi
 5meXa+Bop2S96uEK72Opp2s0Pg5yNIizk+EX565ajlz1HAEaOT8/kJX9YIYt/Vuq2M8nr
 IZxaRPhFKYp/q7pckbMW7N3Ke6FqNS6N4xxeGW3T7+xBCnpx8GzV5Muol+Hlp8ATjWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Fe+LkXqy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 938D26070C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:19:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso50592f8f.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792693196; x=1793297996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r/r5A+y5YXDWo9nf6rYwRlVRvT8xbK00BwNiH1YOGFU=;
 b=esasb2Mn84mDvhAtTO6kDn3gjxkTdUR329Er92OpG73CLL64eWxpz9A3Brsikc4JVy
 Liyn8OUgnBO7Vktqp6Ewdm2VOmDox8l74PjPEE+ISPAwtp6bj69W+gUiIlkCiYRas7um
 CjNwXpJkRDlM665fYkcVcgspU49t1FPldQUGe+4ZgJ6kDflPuXeRBUA9gDkb1mMhZXjL
 VkDUSI/k+QtgAYdc0iT3M7H+ou63GqnyS7J2WOitWJZlw6poEQPOOtFzlJ68+bLcconT
 ZfQtVTIot/u1LfBvacTHZhLjWfhiRwS5JLCxkYZgnW4yQ2GRF8fxJbzjV5ICransqALi
 Zx5w==
X-Forwarded-Encrypted: i=1;
 AKwUvByP5hq7lDltKX/hurVGHM9jaaxlEMMFiI8SQ6+8fMyK+2qirBtLCYKjHn+Q3WDzrfz0pekc8jzNKN4=@buildroot.org
X-Gm-Message-State: AFq9FYKKzr2eznoGjKjgrPzib8gHDpD48NhdZEl/W2KhTgCtCUfLi+3p
 UGwD9omBzEAOJ9JvMMrc26nKJo25zvtvhMxGiL/BsKSHgJLqLJQAAbus02ZB/gvIaCg=
X-Gm-Gg: AYBFou3nPWv3dN06ITnZLDr+DIHxcJpkXpm6ToTIa2/xIBFU/3mPT5/KPny6ImfihoW
 EM1cydOJncjhhhsuASkoOd7wyYJFztAkhdHISvw1Bu+2Fzj44mdG6GjpPcitj1YvmCfEfzAL50+
 hHSRQCyJ6tCWA0IQb0X5PRcPNdGdxzkyQl7KWhkP72+pRyeX1Y6J9QezkufPsBMN/I+E4IdbV+A
 RwntuMZ9a9FlnyWyxP7VmIB8AP4ixp/FqlnZ17mcIPrbUgbpyXbbm2yQbCEVPonFfr2qcTeQ2IJ
 93kvWwz8O1Hb3ovjGfn/GvQWMGXHMLh9kv3OrlaEU18GkYFbwrzBsA5ck4zgtARul67ZfEYhGWq
 Hq8KPzL+mwGlz4PKPCXDidcXOGEBpilMVSCAueHGf/2XMIkmUoSA6spcFo/H2F3uncP3iZASG3n
 EbxJoj0MCWGE7k4OH9Kv5d1pv4PWzxouYAPb5o8vIND2gu/IcH7NJ9O+0tczLjeSsaZ6dODwsfB
 u08ykBEr8IrDe2H0+5kQCCxCzrprHrb2xcSVmfWdPIkhrVW
X-Received: by 2002:a05:6000:41dc:b0:487:40d:af29 with SMTP id
 ffacd0b85a97d-48e264f31fcmr12901458f8f.36.1792693195749; 
 Thu, 22 Oct 2026 11:19:55 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e379ce7c2sm348f8f.19.2026.10.22.11.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 11:19:55 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:19:54 +0200
Message-ID: <20261022181954.267177-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atnvkhUXOH2UxGmj@windsurf>
References: <atnvkhUXOH2UxGmj@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: add uuid as
 serialNumber
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thomas, Heiko,

In reply of:
> Thomas, Heiko,
> 
> On Fri, Sep 18, 2026 at 10:58:26AM +0200, Heiko Thiery wrote:
> 
> > > But i don't know if it feasible or nice to deal with from a user point of view.
> > >
> > > Is there a tool you are using that enforce setting this field ?
> > 
> > There is no tool, but our company's security office requested this
> > field for their process.
> > 
> > >
> > > Also in the commit message I would include the link to the spec:
> > >
> > > https://cyclonedx.org/docs/1.6/json/#serialNumber
> > 
> > I can submit a v2 that adds this information.
> 
> So where do we stand with this?
> 
> If the CycloneDX spec requires this UUID, I would suggest that we
> include it, and people who want to compared CycloneDX files in terms
> of reproducibility will have to ignore this field.
> 
> Thomas

It's optional in the CycloneDX spec but it _might_ be required by some
regulations to have an unique identifier.

It's OK for me to include this change but I would still like to offer
in the future a solution that can fit both uses cases: reproducibility and
output customization with product owner informations/requirements.

Best regard,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3AB606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e6QPaNYK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D82506F56E;
	Wed, 21 Oct 2026 19:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfxNy_nyyFL6; Wed, 21 Oct 2026 19:16:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C2FF6F544
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610165;
	b=EY9/I0kC5goHexKqaWR3aPgaud4ViINu61MiEEsFqHufYm3mhCjjC4ZfIRzoRRpcEETc
	 w4BgNqcP98hibZKOb4FO/SeDyg1K8FEqOGvibKYkJ+scIMH55Ckxa8fAk5GJndO3tsQI6
	 CFxelSVpH9PKOsCr5V8jeewZp187JnvIiCt2Z8n2f92iTu3FSLBC3NWD7c+CiKL1zd6pz
	 HAihMov1di+8hF78xPOhFF2V0yLZ7IVqivDEV6PWhJom+QgaMEqEzP0ySKXo4LApWbqEs
	 VqF0G2+/JhsU+FHohGvu31qzZcWTRpxvt/aMwtH3a00YEXpfc402c7i/hvF+LHQ50NA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9Ya7xM/Sr2TxnHxhmltQu5hwMEn2UknCWjeNqOc+CIU=;
	b=ndXdCERPoqNkEDqEsZK0vNUqCsE6Ouki3SHM5Vogr5kmMFJ3D96JRxJJIsF0h36TbP7u
	 DnU2+Nw4I2hnqbzUwyeQ3RJco08Eaoo+o7gTTiBYCYopECQgbTUyPmcD+ezlIbwNBN6Li
	 KQ72KlOtk7cUpx9+ivOb2CkgO9LP6BQn8hdH7r5qt+LuvDJF1Waqjqr8kCU+WeMq3El3r
	 QLgDboOs2XXBAM2lOfZ7f6JMcTS3NcoWW40uIPEtn6UVyykGagEMddQt05QXGQdjdPpat
	 DyFT9aIlfc/emH+LJruRjJ8ooVxA1kBImaDxm5ZM9m+oedrcJI9ekVcpdetWj+hNkMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610165;
	bh=9Ya7xM/Sr2TxnHxhmltQu5hwMEn2UknCWjeNqOc+CIU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e6QPaNYKJRg9N06Kps9GaRPlaFTDZU2OfaGetYregr7m9qbIRaFeFfXwDnVhI6MEh
	 hUPxt6t9LktNw/DOkncfO5w42YGdh62XT5MK5Rm7KEmJPUmFtd0K6GUxcKx2auZYbQ
	 W2PW+40YMSKVWyoAKcwxtHWpg5D+Qyv27E9aNuzwrgI+0E5r4xiixBInpI9uF48/sK
	 3aznPaC+6JYKH8B+/0U2+ABYntpvusKhXY/QnrxMnTEAvtnDzxEvcdlKCN0yV/qLR7
	 KZTxnvuMD6cFhsnmWTzNxCsO6AptulQ/fCmfNuOt5Nzi47KOSw4tjQvtCaFNtEi9FS
	 dI0kuobayDd6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C2FF6F544;
	Wed, 21 Oct 2026 19:16:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3AB73A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5A9E41045
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-YB7JJ7DC-k for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:16:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ECA7E4141F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610163;
 b=UxA3qStE9P960ZFLqIqwdXFuxIvko9fc7lJVPVGn6HMrEwW1g5YHCRROnyD1Wm9z3Yth
 8czhYe3umHjuNEG6tGHnUWNmV8Vl+7mpoYJz9f4iU7c2FIz7C/JDNHaoin8ONuVIE8Zds
 8BJsiWWfZnR9tW3EoI1IsmsnVKRhjQA1dwYA85SAieX9Sgy9vS5cV2FlQ7aUPMw3uLKma
 rvVygARgyp0aMSHEtdbzDTzhOC4q/6MXGlIjZJW0DK7If5MPf6q29wkcHzm6tGehJczlw
 c2reDahKmWEr53tYyCRGDHb5CffiD5TwTcIjrvF8j5pwok1WMrPMvX3UwSEftlXAI2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610163;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=23JAHpS9ldVqI10jOa4gjnrTcQOxUYAR4/Jm0uc5ISg=;
 b=ox8XvqCNcTgzWMRLYMkL3mBBKg4RxwICLhl+RIW2Oai7JqHuYrGBE1lw4Za0tvXxrk26
 M0H6dJDqvPwCTY6xXl+cOCafKfJujGMJWMLz7w9meFJ+Q+aj+xsx10llNvbkzIMCbehzn
 JgxUFgf8dbDQfVEFZD0kqEKp0SNlFyjtJxCmBspNfdy3gF6WoFoINXyFRIdl2bXHm2iW+
 +iHYQLNy7eosDFsbt1tnLNqGXigrXs81JSuGqN/S5m1sCq26VmoUTbcBiUpYfTmBdYIAp
 rnUXRsZxymaoTKcsUWfpyzcbU15fsXcANeyqeUVCBEjmutpU/md/+OU56cxxi+fQbhA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xMCu5PIi; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECA7E4141F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:16:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1FC841A12B2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:16:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E078A606E3;
 Wed, 21 Oct 2026 19:15:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 219FA10328D6E; 
 Wed, 21 Oct 2026 21:15:54 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:15:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atkPZo9QWYshDbYX@windsurf>
References: <20261020224656.1714095-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020224656.1714095-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2026.10.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 04:46:56PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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

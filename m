Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DFB606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bDxfkjoN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4100605EB;
	Sat, 24 Oct 2026 20:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08nNextOU-q0; Sat, 24 Oct 2026 20:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 12C7A6062A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875403;
	b=s8UU+dzTjPjVbbTrPCiw3XU6nXEdVO/1vi25a+yYBnBb/mJbVNcBRTUe5oahbQrOTBYa
	 jVxbywLIelNw9ZLWUS6Hv5/p/egQcdBbShr0mIeGUMifOFwL5tf2zqdC7p6J6tBSOfgNk
	 Kz1AWATSEtm2MtSC2cTVZgY+jSNb6SgSdfseo2GOw/7F3owE8JmzUsa0V+d3nd5wIArEW
	 AhIr8+3PXYRMCZm79QdE85yB2JsuI4aFxzjJv28xdT25E/2uHXGz6dEVwy84ENmROQQEs
	 Oow6ooHzGqLkelgtTmvTsk7Sh5/METvdsMSM8kVKFKocIQ2tCpibkYEFm7kew2cfrnQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e+9HICkyyesHnubrQJG5JA6se12JPJIouOxkGqgxvEI=;
	b=VoDxrd7Gk+hnp7xMvp3CrjH5cMKgSTpkLGxg6OTE37Ia2eVaSfjmjdNvBwgZ7aazYeXa
	 igxrA/swxlSVPoYxUmDdERAGpYDrxxsgcuj9mmt6vSAiu28y4enYBFiW1DK0j8QO4JuOy
	 Zau0h5x/t16805xZTEfLRCL0EoZ0xpeQTV/ZnwCiAnp46doQNWAGQe3dc/rsbP19dZ2PJ
	 xmByqo5w53DIOw5JQOB7OFjEzQeCT2AoSXxGN6myKmN63tAHT1s/yXVnPk1zomLb6SxGC
	 cb166LTBX6GNCMVDii8uARpugtt7qpYA5yMyq1Hg3uJWpmS0cro/oRIezChaGYmjU2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875403;
	bh=e+9HICkyyesHnubrQJG5JA6se12JPJIouOxkGqgxvEI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bDxfkjoNKCuomG8k/1gfHh90i2HY6kLqJeJbgQChSTpJklFtYZnTAGlhtktSPyZcG
	 f5gkVx/u7eo9QbrCUMcR86K4PRDQsabnIl1zdhaMvLLgz1JmlMut4iAXtjOhartSd6
	 LaUutSIZIGhOlCXxkvmMAXHlaj+YyXhkYvijNyVKLHcSjQJ3g3mKLkv25dU/6etWH8
	 nbqK9Ch6t1Zk5V9/Ky3aL3p1QylQCd8EJsTBYLAU/ji+IgyfobWmCquVZ+TDAl2Ycp
	 Jd1Xg50UNfLYzptVk8ooZtlO6QMKgxcPgOvKy9w8wpV1WG1jFsxji/RtA3seghfqBe
	 RErrFndmc2PCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12C7A6062A;
	Sat, 24 Oct 2026 20:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2D8E356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B889C406EF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpqxm7tlmy31 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B9105406E6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875401;
 b=NbDIeo/mHl8JIr90hexRGGDDMkde0c8gBbQ/KNRBZuktR0VfzmlzY5GrvQDYoL5twBPJ
 XXuj5PUqZGB8NibtZfLluRjfP0xfk1e023JuzPzU+omXCta3kxvi6BM9709JSXvC64pJy
 +QNbJcnTp28vUzdW+vlEfl9Cr274RKNAoMj5il/x3dJfF/jaFFv9mGk2XPfVf99lpXatC
 CwD0PHswZVhNbdYpXrOMEVxAktAqVqB23M13+jJiTIwdnsPUBurug7YKw6n5uFQYh566S
 HHi9lLZhXmFqBTM943+AkbuwlwbjMrzICrFKu11khLDJglAds0b/+cA3bp08JjdWb+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875401;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=qMMJvHAtTlyCC0bHCrOs7kgIhncQ4wdh8tE2DbyBZo0=;
 b=cjmR4GPR6ULZOdxrgvBDMFWzsZ0g61/YfRf+cEVr/jgrQV9wvSoHkTcdaRorRAURSHg5
 K9FF2tNZHx58nc6fCMXO3zr2jgMVA/o5DEaCKXT01Yxv0wZGXBGFFzPMHodDv3iz2nrN7
 GAmSNMBPLQRCG1/WhyMvfAMWfo4fgXs+nu+x9ZUOfLdwffdtiyMhFc2qEz0oEGv9GYAKb
 5bnZmDzKoyzj/7AmhBpBR5Tv3jeUcL6KjCYP6NEDGjztmpcsS2tVHBHazxhh8BAQTxekz
 Uq2Ua+cHd4+bg6uQNQzmyDfYNjz7jSNsqvLENLq5NZs9+gxdAcL7iN13ShwjUDUTQOw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cUn8ochK; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9105406E6
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A3FA71A131A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69D9E60769;
 Sat, 24 Oct 2026 20:56:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51D6610328DD2; 
 Sat, 24 Oct 2026 22:56:37 +0200 (CEST)
Date: Sat, 24 Oct 2026 22:56:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <at0bf8CXeT7X4iya@windsurf>
References: <20261024195254.3299917-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024195254.3299917-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.10
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 09:52:54PM +0200, Bernd Kuhls wrote:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.10
> "Libarchive 3.8.10 is a security, bugfix and minor feature release."
> 
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

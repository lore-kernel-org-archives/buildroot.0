Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A822606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DR1L2GeA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCEEF4099B;
	Thu, 22 Oct 2026 21:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcfW5UXwBOeN; Thu, 22 Oct 2026 21:27:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 029F4409A5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704455;
	b=mlNt5/HUEMrRI+fDId3Pe9vH00ELk69VANrN/bK5TjTbE8Yucd7noQfT/eCFYIUMzW0k
	 fA+FoF13Q+C4ovWboEksHjfENNG5eYRRs5PvGQ3SQIunTbyra4MrWDIsF9FyHTRfygkTP
	 TJmZ5T/mSzPzLleH8NN+yUNkD5KmmzmS95x2nq67hRPVXWE3g/rfapwaAFyhC8Ua5Hyuf
	 FldRBhwL+zghhXYMGLbvjNbG7IFesQ8Thj4O/CNohEcbrtioP7uyTiblXl4lZPX2FEMLI
	 29jwBnnPQIOYsxAeCZYxFvXWjAqKbzqcH5lcsxBvLaivwLn2vNmkOI6h2AnKPohfK3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704455;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=T69x640bAVWeaedp3vsCLNV5n9K67xtswgDW/Eqr4S0=;
	b=LXW45+BOn8vpDGVQfjT9LuoeDnwI0DBWoQl+sOb06z8Olub2FZObTYh9opgn5K60P0CR
	 ErFOt633+1LZ4Yr3P9Pcbva7rjRR/6wad9DRluzWuVfreK5BECSpLkGzdbg51LQiNpkBw
	 bghVpeSJDQOpW6beHxQJqQbnTvs/1zuNSWE0XfypQ5AsXflhewQbUF2dihf1hlR1exc5Y
	 191E+U2UjXVi7O0WTGAiumHzrinKIh/9dZP5nDgS7R9QlHlLX+BZ+kN8NxFmbqfLPKFzp
	 zQkyLg5ErV2fRL8SBH+mH1zrCpBLkRaSmBm411Hy/MsnQyLzNf/6y7rxyFH0U5v3Ddw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704455;
	bh=T69x640bAVWeaedp3vsCLNV5n9K67xtswgDW/Eqr4S0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DR1L2GeAFbmxt0vEvu8/+Jk1H4o+1LnwmTBy0Y0phHVMfgWtfWQOvgDi0w5mbujfl
	 nKDfr7s1JcAZPwTufuAgYTg2Ex1VC9f9P64qFwNiljt+cNqOh8cYScTyAy5r6fWxUJ
	 zxK5KhqvNPwYK9sShRxk09R8owmlxeXJD2/bM30zWCjsW+fgCc6aEoW8jNXEmMpRiO
	 wP/f4EUtGPkee1KH4hadKJW9k9WAiDOuWLtGjvnSz5xonUzWojWrDBw4CgO1ymIf2Y
	 peeyEKb8GliTy+kCX2P7hJSTttWK9n/wvGoezk2MwyuemtBj53tB0tFW4vPwCrWyKP
	 b0AQRSMzNRAgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029F4409A5;
	Thu, 22 Oct 2026 21:27:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE4A23AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFF54401DE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4S7uGnBDBNDQ for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:27:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CED97401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704452;
 b=mRTcGXIKo5AC+SG8GQwSLdAFqkPTGNTY1sdnSfR0+ysTThMatTygsttXyuXhsQ/6Bqnl
 wwJlnxGyMAxtsac9DUyCy9GhfTKqAEI3Mn01xj9MIp7kCopz76OD20OSo1ND84PsKXdNf
 ldlK+hZCXkl5LT4vD1NaXQoyVZK7sZpdLXPh8bf0yiMM66PwVyrz9SfSkwnUYjIalGdc6
 I0s7+Qk1QvuBhJAeQkumOBaiVl8rV+5mFHneIfkpncN+KxB4zTLFBaSZLT7nszZ5gJDKA
 BrtX8D4rKK3h1jMTMQvQ1iZZs7NOTn0c7yqDKpOSXZ9oPb9WxCpYlORciG+Sb8CUmXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704452;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Nu7atxcxQkfGykfw1zBY+LuHjK0t/8TW8NrHqkVCQGU=;
 b=At5q08BYfVYHi8Th0iSbJHaDQ2Xw1v6l/1Y2lUM1qhssPpRANQ6aZmQln+ue4WuiwIBI
 D/7gOw9rsIo0tr2guTvzkFyTR2KyRdsu5i8cKkxVzjkvvunuR33FOR/UFRkvneiMIzEqd
 v+K4+VHB1fVDfPfabqWKp2xKW/SoY1z+1dFpvmsM9ReePsq3KTsAnDu6kJkP+9T6h0lGe
 22XT5Sm4G2v2WWQws7yolqi92XAB+5Q6S7cfJ5L4B9FaTSE0CQKbzDrzNcqwQyGHWpGWi
 6aJLhC7ARp3yQ1f+LXLbSj9LfoFSLx5jAMAFDoUDfM9OrIJKMWjbWGKM0YpVq2zjToQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=m7RnehNy; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CED97401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:27:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A0EABC51457;
 Thu, 22 Oct 2026 21:28:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21D7960763;
 Thu, 22 Oct 2026 21:27:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37339103281B0; 
 Thu, 22 Oct 2026 23:27:24 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:27:23 +0200
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Vladimir Oltean <olteanv@gmail.com>
Message-ID: <atp_trY-e6Zp4prX@windsurf>
References: <20261003205412.2056188-1-vjardin@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003205412.2056188-1-vjardin@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/qoriq-mc-binary: bump version to
 10.40.100 for lx2160a
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 03, 2026 at 10:54:12PM +0200, Vincent Jardin via buildroot wrote:
> NXP tagged 10.40.100 as an engineering release on top of 10.40.0. It
> sits one commit past upstream master and only ships the lx2160a
> firmware, with DPNI shaping and DPSW fixes over 10.40.0.
> 
> Use it for the lx2160a target, and keep 10.39.0, the last release that
> still ships them, for the ls1088a, ls2080a and ls2088a targets.
> 
> qoriq-mc-utils stays at 10.39.0: upstream has a 10.40.0 release of it
> but no 10.40.100.
> 
> Changelog:
> https://github.com/nxp-qoriq/qoriq-mc-binary/blob/mc_release_10.40.100/CHANGELOG.md
> 
> Tested with Buildroot's GitLab CI (test-pkg on all toolchains):
> https://gitlab.com/vjardin/buildroot/-/pipelines/2909708426
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

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

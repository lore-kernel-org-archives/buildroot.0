Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CB76084435
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XDCCONGG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5628406C4;
	Mon,  2 Nov 2026 17:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJRZjjJ4O-lr; Mon,  2 Nov 2026 17:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4495F406A5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793639877;
	b=tAjQBHBhMSSbUKH1oJRGSibMYrqDrEq6oS9YTaJbWFrwap75epA+/FVuai5u9CqJbumz
	 vhyW/yApmhUmLOEYb+J7VhSJa3tbpQ1+vIf5bYmHqWx3Ry62IMIFL93MMyxxxZpeUiGbi
	 QEBcKSkB7x8Ld8hwvPhZ66qCuZqhxsY+LtaMcQ1aS1BYMfT4wslmwsLbMIZix3M2m51tp
	 DkU6VuAupJ+1dlI5+KFH1Sppd0REk9jhDZ21Wvj+0glS22nKwUJLolRqtLFd8kQmXlZ0g
	 8tCrO5wgjsDyt8bs5xZtX56LhI7Et6zaz4Nguk1KInnyOhd95H1c1TSwS6tv4f5P2+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793639877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qxzw0OpFCROWCKMzGIqbaFiC/p0Q2RzDe1FTCMwju+k=;
	b=Ep9MlGgem6iNfU/q/ZrsqFrJ4RNf6WagQYa6Q5JWsygTJyu66s7LvdvYBVeGqqsuaiY6
	 04L3+AQ+1sLKUbdCBknXDJxLno8LDWxNmebPjy7/SKESg6KIz0Hqu0vcRG1b3uJlcYleO
	 8Z/5cWcOCXmcrHR6epftzC/CfmazAqjtAkaaeHtkK5lbxvm/D0sgFLKr+qB/GZclpVfMl
	 Wq5DvYmErBzhQJu1BZNDo/l3JVsBB35XmM9Iiwwp5mMSNFRLO9pMH+CCnvZ0See2I+EgU
	 fA+mc4+JxypNjTTbk2vMvq+9bFMwrJUiNXCNNHXwD0vUGheSoI5+vk4M7q1maSVILOw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793639877;
	bh=Qxzw0OpFCROWCKMzGIqbaFiC/p0Q2RzDe1FTCMwju+k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XDCCONGGiC82ThGPP2Rs67W7NdgJx1N36EI+HadbddRE9JIiwcixU82PwIe8sfEzr
	 QidwFIkrxoI0BbHOaFKX/N3p/TwoEz2IBb9Ps5c+ySCDn+SO7SOiCfY6obBykJHxjn
	 Kxo7Mbtrr2oFUQXDyUpOtBuZLTP8eWL8dv2lTlx7zP4sU4QzuWj5m0BHs7iFEjTls2
	 KMTP/Lf77lPYttkdYo0+O8RWG/c49CRYVla8rl6gADaIWYk/0Jw3+ErDa+EJ2N1X+8
	 tHRldL18DQMh5Pz1OIX484sjCPFXXXJxNz7rlAuyfsazgemSVbpGH1tMBEVxG7mGOA
	 0G5HFjJPtnZEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4495F406A5;
	Mon,  2 Nov 2026 17:17:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A412411
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 17:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A4F84009E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 17:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqZDnKd3N0Yv for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 17:17:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1D0DD4007E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793639874;
 b=XapkTPQGnkJ4VehqVmWcDtN13tuPkSR+ioWk4ElAFfZNGI0eJLjAHHQE1t4XysjuumzH
 snOetEX6DXra453kbI3lRGh6j1sK5chGz6a0h/z6WsKpGvFxAqsLOGLqR37dinDPqzTKT
 xRuXZmYzgWhvcntoN0gJvQ27pjurpUwmQhIheCRlJBC82JJcUGuZdX1KPZOvBwq9g0SQ4
 sf8vi+TqN3Zowaq2aUyc72xGC3UG+lQJ01B+tJ2P/919v3RCOIXRnfkkp/XOaQfmUgS2F
 JzjBPGV8umE8PGJDAjJ0V+ovJVzfk0Ca30ctq6X2Yd6n88Lmv/mhcx/aTPFcPEv3dWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793639874;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=p+43EEhab7c0jaZ/sN4iHwI0iYM0ROun5UPnl71JPxM=;
 b=inX32R6BnyCg4bwANQ8OlVSXQ7h0hGhCEPpmOatjlW0rO/89HZ5Mhu7/ntVUQRwB1HzQ
 f02qO2b0UTbW0w4rZGBzDjl7T5Wh0IWgOx8aBwzAdDwG2MsvRuDTdSL50J9TZNY27IOTZ
 B8IFMA33rugwRo87vG5de1SDKtFZD5j/oJ+Jncll3JXU6B/DeDBRXhu/qkWCRQ47NCqCn
 7vqqqMt6+JeNvELmR82BXMQ3LCfTx5Kef5aU/QAPKQjltc4HTqN1xFqAJFgMs7EP2z/5f
 w6s3ttnOqee2QcCndS9NlNFldIIRJUnExNCJ/kqb2YcvWUtzwqHHIApQ3ZfLyP4CyhA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=spFn4a+4; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D0DD4007E
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 17:17:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BFE204E413D7
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 17:17:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7927D603D7;
 Mon,  2 Nov 2026 17:17:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 457A610329123; Mon,  2 Nov 2026 18:17:43 +0100 (CET)
Date: Mon, 2 Nov 2026 18:17:42 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <aujFegPhdX3J68f_@windsurf>
References: <20261030151950.1475253-1-ps.report@gmx.net>
 <aufAny9Sf6-bnoa-@windsurf> <20261102144441.33ea2f82@pc-1>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102144441.33ea2f82@pc-1>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] package/libressl: bump version to 4.4.0
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 02:44:41PM +0100, Peter Seiderer wrote:

> package/aircrack-ng/aircrack-ng.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> package/botan/botan.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> package/btop/btop.mk:ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> package/linux-tools/linux-tool-rtla.mk.in:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> package/linux-tools/linux-tool-tmon.mk.in:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> package/monit/monit.mk: ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
> package/mosh/mosh.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> package/ntp/ntp.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> package/powerpc-utils/powerpc-utils.mk: ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> package/psmisc/psmisc.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> package/radvd/radvd.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> package/ruby/ruby.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
> package/stunnel/stunnel.mk:     ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
> package/vlc/vlc.mk:     ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)

In theory, I would say yes. But of course, it's hard to have a general
judgment. When I say for example:

ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
NTP_CONF_OPTS += --with-hardenfile=linux
else
NTP_CONF_OPTS += --with-hardenfile=default
endif

it all depends on what this hardenfile option actually does.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

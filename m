Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A69CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 05:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AFD4813F1;
	Sat, 10 Oct 2026 05:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZjYL056Jk57; Sat, 10 Oct 2026 05:36:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF778813CE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791610608;
	b=CYVXdm97Jz5EwDdjOokKilFkNbSmhnu0sjBqB9N7iVFv/n3Vt0pnKqxZ7NMbqqhqlc3P
	 6hpbSc3ht7drz78m5Ccov21pwyyFwAHi4HdAerOamt/12PMhzgwrY65QoFwkh+4rFBmU+
	 +6r/spiWg7tmxDuDHA1A6VA4nCIyFc2f92SZBA68Z1VE8S2II0+mViiBZGD16N6ZbYeTX
	 416Jg3IomQpolCr/coWlUWOdbEQRBOhfe8dsoV2ZMHVau1oWezY1U5ALexWzxFRMm8HHu
	 CJf9dFnL4a8XM+zwLCBYDykySB5tFIY8VypIHUtuq5blKZk5tLFFSUEXDhKd9LkQdkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791610608;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=a8BRRhDhUzqyGudHi2IaUqc6AlEPPls1fl28H4mwhls=;
	b=B2S5sa0l/luYhXEMrW5oSYbriU/ASiSI01h/0YSwafzgX0lcM+x6pIB0pDUNYR2DMznE
	 PLKHwW5M6fFdkPeHVGDxYeRl7MdRgyEcae/WV1D7LTDceEUZh918l/o0ajS4VpNx2kpqS
	 wRVbflJOyWuy4ARL0xrcB6ZHvKpd4SOMZIPS7yrKz2azjEWgkCG0xV100sBzqhZ1WuGOm
	 kzhb+okSvRFbktTj5Hn+cSdAqujO+447G+aXO5RO73sBNevBpwh2kq7D9FNtaaW2B6+t0
	 uczITfuBCadL453DIcOMm18Igcy/XtaLYFB7hsuYcIUrsDuZAB9Gopr6tKDQ38nl8bg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791610608;
	bh=a8BRRhDhUzqyGudHi2IaUqc6AlEPPls1fl28H4mwhls=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iWM7cS1Df7w2T1C54NZS9YBuivPy2v5LOsCjq36lfC4S1GvhuZFND9Y7CwiltqLss
	 mh5DqjJyWZ1DzoLbGGH4VCO2RxuP8ThvzSfcfefzTM6B2guzvIOM8DYikUPr0AW55l
	 OI3ih7tKA0nlA0Q7Yv64Escz8rPUQIPBNNWbCLPlgvqneNNJ+8+VbPWVdzkqUWdrz/
	 XDU7qLJ5LHEZ6zJffHT7nAOcreP+qS8FaQdzZ/yDeR81NqNzJcaX+gmowqVKRsEv2h
	 DAuLYFT7YCHWmmmoisc76hwoAIPPeCBVogcPbWgjT1K6scl4dc4HGl08YSxEjeRVEr
	 n1OpkHV1F52Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF778813CE;
	Sat, 10 Oct 2026 05:36:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C178380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1AD9400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7apghI6GEqFk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 05:36:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2684940004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791610604;
 b=jacJVQT+vAMEmRNZvAmwsbflYxbJ4eBjzc2OOdfTH1KHlEwWPYSIeF1Fz8zaF+KNprZg
 MUSUkQzjCH3fQ8TxcEuST39gOxH/5+ZcNxVgyNVcdBEFlU6Bc51WeVUQL9FS9nZCZPsLn
 3VrXregp76Ghftpwg+ymG7WM1shpmB9jRv5736hnm6wQm/FUnqhqCrzu4B+Hg0n23oClc
 vjMTkIQpkLohyKINawqUANSGrhiTzwiKQOcK+3ei983/hyp5GyqRunRYEtu7QXiYVygkm
 kVgMuaYamz6xR6vTRkLzHbKMamPCdH+Unp7KU1Yobd557Xx29/TkGq5M9EFM7WR+YEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791610604;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BrIGTVIH1T6E0A0CWp1i7pSINlyN37qVa5Tom6eE/9k=;
 b=Tk7npoXKYppnxtEvkiuBcoPiYfJMYTmXT9niXtVIYNUhXXG5IQKSJfda9Y9dBbW/1Soz
 3TSqg5fNLX/J9q//wmz6g5LOcbG5DDuKahKUiSVBHyT05eDrlyZP35GhabdJaZJnBdw9t
 0p2x9XwPqNKgCLfjGaKCBBcNdBa0boKG+jSIjECgLPDHC/gjdXpGnxi9rQiIdgv+nd9GQ
 y54YElJROU0AVbDZxM7oKl+9Bu7/5B0Ycvp/SxEDD7XxJyyhHZcR1c2uVbH1SSjI4iNPm
 8SJUkkneiteFTXs72PMGZh3nsF0UYFRbjU0qJST8RVK6EHfZ/CFd40dIa5SgkaBD8IA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JshPUUFy; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2684940004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:36:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 90E1C4E411CB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:36:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 662496075C;
 Sat, 10 Oct 2026 05:36:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E26511D70C88; 
 Sat, 10 Oct 2026 07:36:39 +0200 (CEST)
Date: Sat, 10 Oct 2026 07:36:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asnO4Ua5Yx3fIah1@windsurf>
References: <20261009212256.146748-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009212256.146748-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: bump version to
 2.6
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

On Fri, Oct 09, 2026 at 11:22:55PM +0200, Bernd Kuhls wrote:
> https://lists.x.org/archives/xorg-announce/2026-September/003745.html
> 
> Removed patches which are included in this release.
> 
> Added patch 0001 to fix musl build error which would be introduced by
> this bump:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/d4fa11371a9bb8a0bc73aa205033ea13143d843c
> 
> Musl build error was reported upstream:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211
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

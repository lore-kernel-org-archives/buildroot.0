Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACACC982C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF904189D;
	Fri, 16 Jan 2026 20:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQTfSU8rgBf2; Fri, 16 Jan 2026 20:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BE9D418A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768595940;
	bh=s+eiejlAg9XMns2sISXb+MknQtzjnmm/lQxtIb29WiI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G4kxvM+E4RlYmxzajXc7ewf1IuFNBDR0v0QmKIu0pYUqYkBXSA1qylp4z6NtT2520
	 qDDZDE8+TbNUybYa7AO4uTRqkxehX0gsD/EqxF3Zv7gcOPAitWO3tF4zC2eXwJhksq
	 /hT0LFVU8Nl7F81w39QzjX0+hMbEV1pZV2IDruGJd6jTECkMTsqc/BiGjSuEUBHNt3
	 /e+4sFYjZzH21xQ+gT1rIOaHdam5QWNcfG76Ir6XsYI/GA84yu8GmPbJgEw1E/fAk7
	 rbMrz3cCe12yMsxZOS/gpwVShl3PlpBBGTSrv4UsZ8TX+7+u/2b/3o5f0is3Ls+z+V
	 MwFUhdwLy/Wyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE9D418A1;
	Fri, 16 Jan 2026 20:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C5E2CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD82F4189D
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXCKMOR0AEky for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:38:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC0F34189A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0F34189A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC0F34189A
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:38:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E46CFC1F1FF
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:38:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B344D606F9;
 Fri, 16 Jan 2026 20:38:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE43D10B68D85; Fri, 16 Jan 2026 21:38:53 +0100 (CET)
Date: Fri, 16 Jan 2026 21:38:53 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aWqhyTFMR8LnzUc4@windsurf>
References: <20260105203506.997611-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105203506.997611-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768595934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=evP/iUsD88DpK2O+HG0Nh3eHHw8KrZ1SNjZlB7PtcL4=;
 b=DB+Gkyb34ANd9qNG848jqh/nyLlQVQDjh14DsIJL1PwzZXBtAOKaqNyEIzqdapEwgbv4a6
 fJ9Fn8qB6QaEwFBOnkOQaGvup+v3JvpfihAwz4q5HSYa/y0matM1qMCryiADwUbhPEjcG9
 VtDUPPfQ4DBOyX5LfzkD2AJPQkoW+HifXhq8By2qunzZnT+vKvKMB5jNU5g74+BBWhzY+N
 uaBRYTRl9+zC5SpT5AqHibGL6VFsShr/MfUE86VETXVLSDby+TiCoHDzhyaCGH29jw2PME
 AiuYVq2rzFHmQZiMwb64Bp0LXIrx4gyIC528BuUQ+JrWQrWiTp55AHf+g+/Z9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DB+Gkyb3
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.5.16
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

Hello,

On Mon, Jan 05, 2026 at 09:35:06PM +0100, Julien Olivain via buildroot wrote:
> For release announce, see:
> https://lists.gnupg.org/pipermail/gnupg-announce/2025q4/000500.html
> 
> Quoting the announce:
> """
> Note that the 2.5 series is now declared the stable version of GnuPG.
> The oldstable 2.4 series will reach end-of-life in just 6 months.
> """
> 
> Also, an important feature in the 2.5 series is the introduction of
> Kyber (aka ML-KEM or FIPS-203) as PQC (Post-Quantum Cryptography)
> encryption algorithm.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

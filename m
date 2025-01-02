Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5BEE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 18:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B0D607BA;
	Thu,  2 Jan 2025 18:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dx-OtmtTN8VX; Thu,  2 Jan 2025 18:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D5460802
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D5460802;
	Thu,  2 Jan 2025 18:58:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE248F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABE1E40707
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6GtnBta93nK for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 18:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A93BA403DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93BA403DB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A93BA403DB
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 18:58:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D87842003CE;
 Thu,  2 Jan 2025 19:58:16 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55956])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 02 Jan 2025 19:58:16 +0100
MIME-Version: 1.0
Date: Thu, 02 Jan 2025 19:58:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250101202112.1845113-1-thomas.petazzoni@bootlin.com>
References: <20250101202112.1845113-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <e3c1d5ad4cf0eb6a57c062a7950db4e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735844297;
 bh=VXOAptYhejXTH4DFjD4GyKo4GplAX+6wP0A2O64sOAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NZ3PIks+auGsBBorf7vfc7Zn2QJctP5LxOpOiYXBRCm6zzhGT4l0Dw7UHudQZHXY/
 uVjOp/rBDtjvBzk898lhmXjkbbbQmIMLTnPDOvPEbREzqK69AJvTM7Te0+23gw3/2z
 qjWn12/qW9qunzyu81wm7WuTM+HrmG4MFDAEtgKZc+qWI+pt3truuTFdthsxWYHzrp
 N1CPdh0AU7uKsUAsuqLvAkjdcHFbqxb2D8Ju3bilk0IPVgaMfI4mXW9HqM0fvza0Rh
 zjlFrxrXLYdiKabRS9KWj08dPFrwrAUvsEoZw+uAsmLxTpR/qSxqK9G6cFs/a6wWKS
 9b0WwtA1g7mvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NZ3PIks+
Subject: Re: [Buildroot] [PATCH] package/perl: properly pass CFLAGS/LDFLAGS
 when building host-perl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/01/2025 21:21, Thomas Petazzoni via buildroot wrote:
> HOST_CFLAGS and HOST_LDFLAGS are currently not accounted for when
> building host-perl. In particular, it means that executables
> built/installed by host-perl do not have a RPATH pointing to
> HOST_DIR/lib, which can cause issues as libcrypt.so can now be
> provided by host-libxcrypt.
> 
> This was causing check-host-rpath to complain in the situation where:
> 
> 1. host-perl was built, with no RPATH, linked against the system
>    libcrypt.so
> 
> 2. host-libxcrypt was built afterwards, installed as
>    HOST_DIR/lib/libcrypt.so, which made check-host-rpath complain as
>    HOST_DIR/bin/perl is linked against a library present in
>    HOST_DIR/lib but doesn't have a RPATH to HOST_DIR/lib
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/d4348d7f872ccd734795a1d071960a696148ed6a/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

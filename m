Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A75C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 17:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D1760664;
	Sat,  8 Aug 2026 17:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mi2KwNK2G_Lf; Sat,  8 Aug 2026 17:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 728616063E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786211512;
	bh=kOKyNN19yOxaK+AtnaZ7Md7aTrkf44gLnrCPYv3ZG7U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hMG6ZXSvmVWLqIoAnmnNWJWAh9cNOZkQR1++NLfj/xwFKw801H2IdVCPLtNpGVQaq
	 ZAA/kJgq85MN9lrYYxdf082aiI7MWld/8dI36iMmoPL+9fjsPjHANFPlLtVwWKTVb7
	 D08cZDxtvjcazMYBt12SxADd1DC0XM6ufD2Eign6sHL91SMjePKrmr3mo7Hg2tn9IY
	 Y0LpIHK7yN9/JaUCeW9vndpCMbkC+B7pFCY1gVuZ+vYJ2sNhKanLRkOtW6vRmb3cCE
	 bFV6Z8thEFdPQtygzIbpDPjmVFczTozUJHy/aNWx/NIIcABz7JO/1UnrvHG89j2N6Z
	 vU5B8zLkqlHog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728616063E;
	Sat,  8 Aug 2026 17:51:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7F8A1AF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA64A808C9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjbdUIQq0yrC for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 17:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4323808C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4323808C0
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4323808C0
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:51:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DF92B1A14DD
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 17:51:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA9946045E;
 Sat,  8 Aug 2026 17:51:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C81911C4860A; 
 Sat,  8 Aug 2026 19:51:40 +0200 (CEST)
Date: Sat, 8 Aug 2026 19:51:37 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <andsnYUPpgmNKika@windsurf>
References: <akqKLbhp-5ANsPNj@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akqKLbhp-5ANsPNj@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786211502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=x6VpjbutwbMxD91m7WsB9j/IR9JAyAQixdr572fiHV4=;
 b=VogHk93cGNE2T6QDnL/6yzjA2PvOkI76aTKOSahQoZ7EMJza3th7Zsbra3RcIKypGw49RY
 KHNlDZNOOb65pf90NcheOsUDnRi3NGkZhOlbAYXoK56TplTBJ3ycTFCuTr5UgRXHKUFAhv
 DSO2Lp14Rfv1c/xWT7k6BMX0ny4r9PzEwkqP/FXWIH6YbXMz7jtKp66z9uaTkhxBnhtkGB
 KOtzFYwUzhKjsVa/MsKo+uIPnaFnNLQsAanfKiq47Yry4UZLc3c4P9RReb/FjidfiqbuyB
 SPGdbnFMvmoVSpFljGx9GuN8EpG6pdTX4zc3LP3J4/yb1b+YXXQdxqjCFfz+9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VogHk93c
Subject: Re: [Buildroot] [PATCH] package/stunnel: fix STUNNEL_CONF_ENV
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

On Sun, Jul 05, 2026 at 06:45:33PM +0200, Waldemar Brodkorb wrote:
> In commit 45d056e7bf69aca4a036aba83e2573301996e9e0 stunnel got an
> update to 5.78, but missed a change in configure.ac/configure.
> 
> Update STUNNEL_CONF_ENV accordingely.
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/69b/69b87d600ef9fa1d4eb8f65a7282c53808faf362/
>  - https://autobuild.buildroot.net/results/b87/b87040d5264befa18da213d460f28a214410386b/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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

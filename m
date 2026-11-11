Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9D606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a/TZWL0X
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57920408B0;
	Wed, 11 Nov 2026 11:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI1gVAg6dFvZ; Wed, 11 Nov 2026 11:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 56D99408D2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794397955;
	b=suOyr+jkRyo8kEud3OGtpC4elGKdWx+xXFu572+PqUvVMi8brKW4HJ1Ox9ntpWIdr0pA
	 iUQYHwnTTiMjkYA2dNogJrnK6WIxpVsfJwE1Oay+i8NQQu85/g98ZIVsfpIA16Z5j76qI
	 GyMVGOZisIBV+bGky/kdLVPyUo/hLXfw755Yr7R128ZJz+vK0fI6QuPygckohm7RwGV40
	 R9yj+gCo99UWYaI8xoWsYy28x3rtRZ7e/NVn5KsfK0aH0RotQLzHoosQYp2B+2anW3hUJ
	 AxJcZvTzvI8KHlji4F6sdAOTuip8VsYcUg2xa8C5fJwON2nTKnv0KtyLYBlclh1bD0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794397955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=btqdHbeQI8Pz1U8+FPJREANwzw0CuSnH+kTJnL1JlO4=;
	b=qawn41ZzXCp2OEgI9VJ5WKHSyl3SXvxwf08VToXgdpGVZmZulbNTgp5d49OgE85Mt6hT
	 almsTWX9CtvddSd/M8vPWp7BYPDGRuXbFa4W4YKhEA/jU3CEiULHw/e9W59Rj1PHaKGkh
	 cT8TAgonRueMvjLSa9sEfPTvifCKd3Wb9PTFRW1k5mVEVmiyGrI2QCNNr0jy2LbnPPgWW
	 f7Fwd5asYfCWrFJ2grfxtl73o88JCbU3QxrmuediQExT17rQkS+szPAhgqm/hf9y34nKI
	 Q8he5ICgiqsdTEzq1B7CngLCQy1wml/+g7pSC5vwcSojau7jyzIjwdmvJQhXUgfeIZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794397955;
	bh=btqdHbeQI8Pz1U8+FPJREANwzw0CuSnH+kTJnL1JlO4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a/TZWL0X1LhWPg6ex9lsey9GyxrJgdCVVBClHOTEK0GVeCx2sDUekKDlqDYMe4bdE
	 veoWZ7KBY6CO0WALLgCRqqrimIUIWQdxNb0bRP+sPPXNhurO+pFVePWsmB6zDQRFto
	 E3KYget8Rjx1XcisU4XGHG6QCTdH7jXWtapcLNfJvWztkCywWlXb2/v6atmyGNog97
	 W+wWiw14NwiPwnCxwpze1nGcG9Zz37o/rTZuvK1f7Z1BZsoeVNgetsEpjFvH3jqnvo
	 vFdZ4rKiJT6AgzbepW9mwte6wjD9KpH8ORp0LIV64wZSb3rj3h7DcOZy4mR4lgZkll
	 uZgXX7ECjObhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D99408D2;
	Wed, 11 Nov 2026 11:52:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AF0917CC
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4823781174
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvj7egBmPrY4 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:52:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A280381165
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A280381165
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:52:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E73E2B0053D;
 Wed, 11 Nov 2026 12:52:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 11 Nov 2026 12:52:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 12:52:26 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20261111104100.41443-1-giulio.benetti@benettiengineering.com>
References: <20261111104100.41443-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <4718cb758413f1756080500507fad53a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: bump to version
 2026-11-11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 11:41, Giulio Benetti wrote:
> This commit allows to build up to Linux version 7.3
> 
> Fixes:
> https://autobuild.buildroot.org/results/9f59601d90aa6d764e722466be990ca039c1e349/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

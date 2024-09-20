Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030F6CF58C5
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 03:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C866067D;
	Fri, 20 Sep 2024 03:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4d6fkIGGtS8; Fri, 20 Sep 2024 03:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F36605A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6F36605A9;
	Fri, 20 Sep 2024 03:52:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 784A81BF5E0
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 03:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 040DE404FF
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 03:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQhL6jqn2Ghb for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 03:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D29040120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D29040120
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D29040120
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 03:52:02 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 6D7B3440FFF;
 Fri, 20 Sep 2024 06:49:36 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87ikurju16.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 19 Sep 2024 21:57:41 +0200")
References: <ZuEdgLLG+xLSZz20@waldemar-brodkorb.de>
 <87ikurju16.fsf@dell.be.48ers.dk>
Date: Fri, 20 Sep 2024 06:51:58 +0300
Message-ID: <87setvx9r5.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1726804176;
 bh=g2taEu++utCMLoQIATK+YAyajvLaNkBLRrQZB4PPe1s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GcsUh2RCVXiTdaPXaqG1J7A/LoRHk7e+wrxn1gfupIOTUUbxIIO0eA9GxnZFY3//V
 Qr3iDYyjE2qZeMPFikh6ZieIgulIBE0bNRNCknQxE0K92YMZn7eZl8sWNCaboeKSOe
 7c5tWDMSsCqOUlFSIfsATpFE/2R3nOgsxsBsZpt5BWs0Tf2ro2NOrfN6JZbSf/G+zE
 cSE18UNyPzLAzypTe4o5S8ZpgOQqV3ZLEdfYLEkyLCfTQqYbvszcbw6GQLcrA9Ei9o
 Ffo2Npt8XwltrVUST4XuXgfYf/93Hu5tt6XPMWpQb9d5vT2GhrM3+qA3RsMtBUSP/t
 ++f2RPF0u5CUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=GcsUh2RC
Subject: Re: [Buildroot] [PATCH] package/asterisk: security update to 20.9.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Thu, Sep 19 2024, Peter Korsgaard wrote:
>>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
>
>  > See here for the Changelog:
>  > https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-20.9.3.md
>
>  > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>
> Committed to 2024.02.x and 2024.08.x, thanks.

Not in 2024.08.x as of commit cc70cadb32 ("package/xenomai: fix build
with gcc 11").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

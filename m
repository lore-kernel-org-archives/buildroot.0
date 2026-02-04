Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41848E9D3EE
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0092583E24;
	Wed,  4 Feb 2026 14:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIC07hGsWhJR; Wed,  4 Feb 2026 14:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D3783E3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770216486;
	bh=vKXh+Qq/R6TBMlJNAtrOzDGInAwL0W9Z5cP6BDz5QF4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pr45oHGVzyYpTWWLuur1C/TxSYTjpXiZ7jI7f9WcEPrP00ELNujwMEwSGhZPJlvWu
	 +4Q6L+Tx9kcSaFfKlyi0c2fF3+SozFyI1cRM8XEmV2GurLmbdMB5R6L4UncwYpGlRw
	 +lghk0BGzVTokNRcs7dI63iPODRhwTaDWi3Wiwjz2w1BGQcVP2dnLakN7MwjjECOGD
	 Aba0nxlllXSovoofjgQNx21UubEeyWIU33nxm7qAQvVQ8KFYoFIiS0gJbLlLMe9W+P
	 u8LF+T8TDD8mvIVy9j8pGUQG4B/7QIn4pdGq6xamfFhD6NckuIju24RKGfX6C3Ahq3
	 C1yDVOJy0mJSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D3783E3B;
	Wed,  4 Feb 2026 14:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 343B117A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13218405ED
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdDztQ4U3Uat for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E499405DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E499405DC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E499405DC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:48:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 941A04E423F8;
 Wed,  4 Feb 2026 14:48:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A84C60705;
 Wed,  4 Feb 2026 14:48:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CB36119A865B; Wed,  4 Feb 2026 15:47:59 +0100 (CET)
Date: Wed, 4 Feb 2026 15:47:58 +0100
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org
Message-ID: <aYNbUNuNUs12ulgB@windsurf>
References: <20250428091248.406943-1-guillaume.chaye@zeetim.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250428091248.406943-1-guillaume.chaye@zeetim.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770216480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=hDfwUOa5JscZkwP5CGQ5YOD8nO4UoKgWBZASAK6plus=;
 b=Z78OfD9qPpApLEO4kg/R5Af+pFo2xsfsTPPYX20bibFKPXxBNSl29a4FW9mRblsfC4WXgQ
 XCR1nJw4oVtk3oJpYwfblUZiutBDsb2RtI2/SFq1j4Wrubu3y21MQXrttOTjh8fJSzvnNQ
 UsvqzO3Z3SKkJMT5Lf5Yyua43cBu8uwr8SEoGQx1afLVaL0ntkflFwex9m66qArDCYup/Y
 AqLJScZ10SWswTH3acshrko7QXK6ACSw6gyTSHAADBVgHU0b3/Ck7hG+6SnXlJmOoJ6teD
 OJAvWXuPzVLuNKwwJvsJj+KHZ7gYon9w4ZPoPudCdlj+DirgOIoOPsIlHUFj7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Z78OfD9q
Subject: Re: [Buildroot] [PATCHv2 1/1] package/cjson: add a patch to allow
 cross-compilation with sysroot.
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

Hello Guillaume,

Sorry for the long delay in getting back to you.

On Mon, Apr 28, 2025 at 05:12:48AM -0400, Guillaume Chaye wrote:
> From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
> 
> The current generated cJSONConfig.cmake holds hard coded path of libraries and makes it impossible to use in SDKs.

Could you provide some more details here? Indeed, normally hardcoded
paths in text files are properly replaced by our relocate-sdk.sh
scripts. Are you sure we're talking about hardcoded paths, or paths
that are just invalid in the first place? I did a build of cjson
without your patch, and saw some /usr/include in
cJSONConfig.cmake. Are these the problemtic paths?

> Use CMakePackageConfigHelpers and @PACKAGE_INIT@ to make them suit for real environment dynamically.

The problem with your proposal is that the upstream submission was
made over 2 years ago, has received no interest/feedback from
upstream, but makes some fairly substantial changes to CMakeLists.txt
that would make updating to later versions cJSON quite a lot more
difficult.

Could you push further the topic upstream, so that we have something
that is accepted upstream, and that we can safely backport in
Buildroot?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

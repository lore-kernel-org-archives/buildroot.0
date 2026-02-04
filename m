Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F76E9539B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78BE960A56;
	Wed,  4 Feb 2026 13:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMoHLoHZ5YQb; Wed,  4 Feb 2026 13:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9835C60ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770210858;
	bh=SZsYl/SakFIbMuYTFr0VT8zt2CVV2tC6MkwVEdF1cs0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pHBsQ+kM+Tc8q3wacJ3qNzUtnIGL5ukyrKach0WNnHQR7ucajTzuNebtEjTwZUCtP
	 CpQO2ISTaUTS3nhUKYrAWdsvNRxDpUjlW09QpHnXpLPzX2sLGvzgxUeVgJQpX7Hi75
	 xJrqcSDM0XdGhbDxLUJaXeqLuz0AFojBKhDG3KbdkVKNf21lSLeafVB1Z8W+gRMePa
	 qKZYYEwU1XIKBEHbfi49FldSTf4nE9vG7mWUlLU/LXCtQrx3JTd8z9GOZHF8s3y0TY
	 RAWjrGAr8IO53T/unvdgXs8WequcXWivKiwlAbRgeGhI4b2wwKYxxHVQwzAjMIkzCn
	 9G+OtxuXQwiEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9835C60ABB;
	Wed,  4 Feb 2026 13:14:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FFBEF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D50040C2A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iw6SJVSb3Wh for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:14:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2778B40BFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2778B40BFA
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2778B40BFA
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:14:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 10BD64E423F9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:14:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB4F260745;
 Wed,  4 Feb 2026 13:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F457119A88F7; Wed,  4 Feb 2026 14:14:12 +0100 (CET)
Date: Wed, 4 Feb 2026 14:14:12 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aYNGAIULEA-4DYt3@windsurf>
References: <20251216093534.2558659-1-troglobit@gmail.com>
 <20251216093534.2558659-2-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216093534.2558659-2-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770210853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=YuSFUqkjX5EkLjDYJ40m22nGnl7+GRCQJAd2/oyPydk=;
 b=FF6rn/j9JLKUKhENwIKd+xyLsRrzEhy5N4ow114r8aBT5hunJvbds7xfBxpyN/518GIb6k
 li6wkuxsz4qu9V4V6n0hqMc59c5vIJTDSC4phMlSmMDmJGmGjlCDCuTRpmF1xEB+RT451N
 j5kbN+GgW0zFTIZNDcZK3xK49kH5TooD5ztZboO/P5qGutLUfPDUREuCois+XfhqCu5Vu8
 69tGlO41HVM1W0Wi/ywz3m+iqgZpM74EWGNgKiiSljbdnsdpKIWNa0vAbkiZUtXDmHowiP
 wwLJbQ2KFHdknbYNEehDxUeLFLbNghOUsEkcnLAx5Yc7mVUweHaU33sqORJ+Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FF6rn/j9
Subject: Re: [Buildroot] [PATCH v2 2/2] package/libite: bump to v2.6.2
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

Hello Joachim,

On Tue, Dec 16, 2025 at 10:35:34AM +0100, Joachim Wiberg wrote:

>  # Locally calculated
>  sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
>  sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
> -sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
> +sha256  b6cc7074a27b26ee4e1ccda8d634d485d0f6f819e564c663c28ed61f4cc2b451  src/pidfile.c

We normally require changes to license files to be explained in the
commit message, so I've amended the commit message with some details
about this and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

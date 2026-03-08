Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31577EA8543
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 19:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3DC60A65;
	Sun,  8 Mar 2026 19:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwJC4QHLGWnU; Sun,  8 Mar 2026 19:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 103AC608C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772999138;
	bh=M6NO792c9fclpboqZl83sDF+ouutbxWc3doqrNCyqpM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rySZ1KoakTg+dUFwt0cRXKpu80yVtkZzxdcTgt5kiJLV+4+KCJVXK/aagL3wxThD1
	 wh1cTCASkZnhaLhhMdSaRNXrkNOqcgr7za3SEYWfP/7IySMu4DuIAvt721GRZUtWzH
	 KgOyzjj0TJ2JT5OkauJxa1iYIqjVnsdOJoDAqAWhroTcM4I1DjlXYFMP5cpXuZyIMW
	 0WUZo+Atjn9oeQ62EjGe4TnrgPzgLHUbHzIB6I6CApOARdIXOF5OS7U3L+qwcDby0Q
	 Y6aVyOW/TO6+/vnPcIIISfGI28Ce6YOMlM8CO+hN6CUgGX7D3xwH8W2gzZBNWBXRvj
	 AMdSEwBsQi4aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 103AC608C5;
	Sun,  8 Mar 2026 19:45:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F0D5119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04B9882B61
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjIkEx_kHyxb for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 19:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E23382A8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E23382A8F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E23382A8F
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:45:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 67E9B4E425CF
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:45:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2CC5FF9D;
 Sun,  8 Mar 2026 19:45:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8029810369794; Sun,  8 Mar 2026 20:45:32 +0100 (CET)
Date: Sun, 8 Mar 2026 20:45:32 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aa3RtjtiX0LP_7HW@windsurf>
References: <20260308103213.1117775-1-chakrabortyshubham66@gmail.com>
 <20260308103213.1117775-2-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260308103213.1117775-2-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772999132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=SEtdsatWNes6g8wLN2enWrA5oahktk2BUvo2wV5aJzM=;
 b=26ZKF44CqOAuwXw9Jp0/SomT3QdqC1XbZ5M3Ty/r8v2OG8F6QU6udLOWBEGJn9i87q3mri
 UGsy5nJGwFTic9ixkDjPVMxhf/A4CvAAa3GEzMzpemabcy2tt7+KpVqTysQD+ZRh0n8oGS
 69g0OWCAQPXUGUyKEuPdkw5cw0AYP2fdXaEld2DATGwsEMgOS/50w3MnFEaTLxuYEN/4EC
 Zr1s10MH6tXYKup4F58OhbsWICF/nRvbMMaXGzUa+6nvOz1JxcTbGRwfVc1g9aip7/2jxd
 LeR6tXjtyalH6trSpN8l4F//3MdS0L6tmOtbk2q3h5n/AtSleqvOkCXIyftJaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=26ZKF44C
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself as maintainer of
 package/which
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

On Sun, Mar 08, 2026 at 04:02:13PM +0530, Shubham Chakraborty wrote:
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 835be1f6a3..f3ae83e53c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3058,6 +3058,9 @@ F:	package/tunctl/
>  F:	package/ubus/
>  F:	package/wolfssl/
>  
> +N:      Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +F:      package/which

Indentation is done using tabs in this file.

Also, final slash in package/which/ (to be consistent with the rest of
the file).

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

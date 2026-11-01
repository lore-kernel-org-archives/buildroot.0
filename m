Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6353606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pDr+wl1D
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EF2960681;
	Sun,  1 Nov 2026 22:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyhaLHBXFONn; Sun,  1 Nov 2026 22:47:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C96160616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793573254;
	b=f5rCCbNNb8EKxLbB+JPEbNVSIgN9yjWllz25YdDpJi1B9w0zt8pKcj0hVvsMAL4dmEHs
	 3oPFs/b0x7zgiuj9SyRs3xrrZssfGZlWcnxHTX13HD3PfW52um+5qc/37jwgIVUhDIAAc
	 akhwFi8i8d2RjIZ+RmudG3VAzTXReNIN9S8rHQf/8yPJ+DrQCf6r9G8Gfywdp+VD2bOLT
	 DlRH3moUXggF+jzFBkZcEx+pdEsMhYqQydqde9KgWFumedb/dc+KfK8mv4XmmJdZQHk1u
	 QGXoxvWtSB+m0QFaWPHqTAf2Ddnt94MHOg9F3MSMxjazfw//iDGigGmTf2TjNcj8ytA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793573254;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IXzPkPI3SpJd8gYCvCbgjWWh40BcfWwuzvq5zYSOn5M=;
	b=O7TjKuhNNlPEamEOCu4Dlm9/W8sL//DXlFRRBgNuqCq7QoG1lNeEeZbpYxwHhfkt2diF
	 Rm5StzmQyInorsqqy1ePpMI3Gj/mFYmPQ2VKSq1Ottv6UID0aREwLZqmcXODXmekQouRq
	 aZt3oZIHS03hENoZa8wdb7ZVloeMpECMpSLu8Yq080sDMBhQP37mnanHEcjnXyJQCkJCL
	 h+UGY72lXZjJBOyL/aH+u0VgGYYiGZozQ5k6peq44glvPMKuwxt6Mn5Pp78hHBsJt8ZxG
	 6/mmHlYJStWxyf+Y9N0E1HYihWM5i78JnODRazPDUrhfrS9c7yfberGJtw21QD63k8w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793573254;
	bh=IXzPkPI3SpJd8gYCvCbgjWWh40BcfWwuzvq5zYSOn5M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pDr+wl1DFjbsVPXC+GbHxlzFLUnjTaBb4UCNXNTTRYsjrqZErpG/hi+r5iF9IVski
	 6pH96dL2FX799KvnHGrDCkFR8LbJI24lLbosjAaeGQqKxjLQa6yTJf7/Pv9PVmuM6R
	 odW98T3ZU4a8jADb4/DQ52rzcvVEFk5P5sxAObBLl46KqV7fOSUJSbkJld4qcc/fvo
	 JLocZ65z+Z459sjJUt6KyxgBmZDuDmoJmaLbIAvUpFlSagrI1H7bGxG8dfIt+p0FFc
	 RZfHfTGiWJE57qrYsYVLOMC2ZpLeFsFf3qQ42iKHTxrV0ZlEso3K8BDtvMH7s6OJfD
	 grULotykNdhxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C96160616;
	Sun,  1 Nov 2026 22:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 098F6156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA3F3405C8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HopdPb0Z4wbt for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA2BF405C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793573250;
 b=T8Q675rzcKY6JNU3uEkbPjXgXcITcY/Ha2wtvwi/XmMb9uSjnMxSpyThHMTG/tdWDDfH
 XgTt6sXC7Ot3kn1rULELEDMONVglSsyEVpZq2xrZ5Ddp5fgLZmw6pFgr9wKsg8hQ3zMup
 PlANrbTClZRKvKDeBNDHB39Wdrqhj7mjLUniocjs8MLvwZQDB6OZHfvuY/L/U8N0xtZOl
 niDnDqIzaBNJWaKq0RdmuRoAKhlu6n5GqcUlpqgkCM83F2zMeGXpEtcH7saLlxqQteuLb
 YCx8l1xQ6CjzBH1Ap2yrndT92ND0VrZUUoXdvrHGmkBRvyIlLEeAfNXESbxFZep0Lhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793573250;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=NqyiRJfAxs4MjEjH7HV7t+0aN1VaZxE8/p7z0gWnQjU=;
 b=X81OdV4rBKRxv5Nge0OTR2Km+huL4my2NPJww8WEZx2Bgd6GTQ04oK+HQcKvcVBC/q1B
 SG1KTXOazerfQ2Yt7ArP9oCVz+ozdETBCjr7gfwcyzQipu1kxghZh6cve4Xg9xxNtvso7
 RqJFkZfud4/yhrnuqVNty8l1e2PMHYv8DCD7OZFwzYDe5PXlfu18x8iMQZOQfjEjk/Gnw
 gi3yhweRqJZ7mD5/hC/uN/gXmNb5FyUXe7tBxvbAl0KneumKfPoO3XekOSEnBGM7jrw1w
 jrK0zy4IeyIWq4AAnOUJUCK/q/00Fz692LKKnSWUovaNTQc/YrPAvyKQbfhzD6ImjBQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mzCkCR5v; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA2BF405C6
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:47:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EF83C4E413B0
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A808460750;
 Sun,  1 Nov 2026 22:47:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B78BD103290E8; Sun,  1 Nov 2026 23:47:25 +0100 (CET)
Date: Sun, 1 Nov 2026 23:47:24 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aufBUAf26C3d42n7@windsurf>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
 <20261029144400.2972217-5-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029144400.2972217-5-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 5/9] website: bump jQuery to version 4.0.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:43:56PM +0100, Angelo Compagnucci wrote:
> jQuery 3.1.1 is affected by several known vulnerabilities, bump it to
> the latest version.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/website/footer.html | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This doesn't apply here.

> 
> diff --git a/docs/website/footer.html b/docs/website/footer.html
> index 44ef5db17e..d9f4f75196 100644
> --- a/docs/website/footer.html
> +++ b/docs/website/footer.html
> @@ -1,4 +1,4 @@
> -	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
> +	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A==" crossorigin="anonymous"></script>
>  	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>

In master, we're using https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js

Are you sure your patch is based on master?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

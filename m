Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BB5606A320
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A67na6QA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F88A408A2;
	Tue, 20 Oct 2026 14:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_nHTD7TVI22; Tue, 20 Oct 2026 14:04:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AF6B14087E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792505083;
	b=TAB+aoNp+htshpcTG7DZqxF4Yvla7k5bnJm+LAr+RxLVRRJbYlzQQmmp/TRVV0cxc7i2
	 +n8HiM5YlEa5z8wG7DscyRjEqAiHroal299NVqb4MpIhs1EL9xSzOL4uhPctCADgpt98T
	 nJDexn2yui35f4fS8I36bTFWvKLnxlROPlX6ZIppht5UyMPm+4lmpoKie1qt+xwSSOv8x
	 3+NebQoZlk4G5A835SzUiSr++eA3H9ysZukx/Ruvq4ce0txLB05OeWYOGC+zGNlJwIKAQ
	 oLYh+LMGKQGZosOGvuacQJiSqI6pwgNG+y4Lvyh7b6nTK+xY6CCIzl6G9jVXseb1DWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792505083;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RaV/VFhvVOLBZ0J9RgEc68U5cLuIHFYvVAzX1YnkkEU=;
	b=kzrBcIExWSxPKMI9afcxwvxr4fR41gXMvbftt7nMa0nzEvZWfz1BFhnaG+qm7+y9xP7u
	 39Bdue0R4W+3vgURRua7rXOLPl34Up0mscXLQ6DOuMlmKQAM7rxqiU6GOWy+UzTq1zjgA
	 +cfLKYh/G3KCBq6s8B+hPFpSZQ8mUIKYeUE1Qd2FTC/iO+JtTj9BVgsPIEXkB1ecSRNjt
	 DCqvw8PO1jxDeSXcbzTGxFO6ABSXN/S+MMpTU/axk/aEfYekY4ErrwYmN4UH3jhrhhlln
	 CePBjSHW9+GmaylyI9cwvKtQxWQdllMOeIp9YpwNb5jmjCw3p2SCRbNNIbJjYGNgCwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792505083;
	bh=RaV/VFhvVOLBZ0J9RgEc68U5cLuIHFYvVAzX1YnkkEU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A67na6QACQ5m5V0OYoPyUqDTt/H1ryhNXuxgjybMPVi4V/THE396ZZhUUepDzg9bw
	 hwIp7aR4qVLbPHsg5VZbarm2/9ecS67Waz4iMGG+otmSwWLVwEaJ9y2XgAKQW2KJuT
	 JicfLLuf9FCLNT+Lp+mMXP+FPNAZUjTe7a5gMm0XxDfrgZZimbPoFd1vji9iSWbcXa
	 wTmvjl5zl9Nyw+5kLXa7NRPcltOf1L50vGpn1R6of+Igr6TZMvMzJlGWPxpM3U3mkI
	 ri4QEf7CH+U9GzWG3RhOMjRvWOE7VaEQmXKmdwt6HVHHnr543bIOCs+GHwWt5K683C
	 W2AbJf8cf/nOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF6B14087E;
	Tue, 20 Oct 2026 14:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7371E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9080A607ED
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNInbx06uNDQ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:04:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BF3F6084B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792505081;
 b=eTI5B37P+6igsBAC5sK7y0u5AWA/7bviW+nrIj+iJtIZscp0xGEC9NAMQJLuWnhUnysc
 v5TymC66c8xf2jJFWb4VKBaNFwR7DWz5fl05JRu/0wKN7NON7VrW4kOF7LOiRsfpIw5mn
 lEdynyY5DU3KRqrPFXAfeozW1I9CoVr2GRhuBpKYxfkE7iydKbqcdRnjzwaROTg7bmBSc
 6ROtdNZXtf46VubIpJN0cA5FmXxDmwj7ITn6RzJ2xs2CZq8lYyvIzzlxcoJ3Jv9WD/y0v
 Gtz1gl+cRqwu+AIQwg8ELm/6wUZZAGuOwwwnyEVMfuOiMxlxh/3Qjrulw/A59PFNGAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792505081;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HsomhSJfcwo3tzEFxxD2wkS+b0T7bKIhaUi05KQoDaI=;
 b=oJPiDkVRZu0IC8xg/uZnJnSNsbm0fgQzLakeX5pgJ+d81DrqDddt7vbA1LZHdPC/PUWV
 Jpu91M/a3qbvVZXAhlTIu7PJzNtr345cxfp9lLny5QB8vqGoqRJ7oTTloKpfky9ikwo+J
 bKLUI7Hp1mHCeAwpx/omggzdMZpxVtP24WVCwz1Ou54bMVi4zqjfDF5feGsgBFVGqvx7Z
 KYsDQe4Adgmpd0+KP8DZStEKqSpqAg/bW9ynYUJWsTOfbDNe1+sjv0tFWjuKQWbU9EKHb
 bS2x2Py4uEhX9euAeQFK6l4X/eKt2ZLCex0lLZpAeDxN+mJTxiy3v22xodYoD4gKePQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Siw8azBu; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BF3F6084B
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:04:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D4A23C63455
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:05:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4DABE60393;
 Tue, 20 Oct 2026 14:04:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A348710328D1B; 
 Tue, 20 Oct 2026 16:04:32 +0200 (CEST)
Date: Tue, 20 Oct 2026 16:04:31 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Joachim Wiberg <troglobit@gmail.com>
Message-ID: <atd066tLf8sEYtjX@windsurf>
References: <20261020135300.3973040-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020135300.3973040-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/mg: needs a toolchain with wchar
 support
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:53:00PM +0200, Yegor Yefremov wrote:
> Since version 4.2, mg uses iswalnum() from <wctype.h> to tell whether
> a UTF-8 character is part of a word (upstream commit ee22ef729b16
> "Tell UTF-8 words by their Unicode class"). This breaks the build with
> toolchains that lack wide character support, such as uClibc without
> WCHAR:
> 
> utf8.c:23:10: fatal error: wctype.h: No such file or directory
>    23 | #include <wctype.h>
>       |          ^~~~~~~~~~
> 
> Add a dependency on BR2_USE_WCHAR, together with the matching comment.
> 
> This issue has been present since commit 3b5fbe8f6e78 ("package/mg:
> bump to v4.4"), which updated mg from 4.1, so it pulled in this
> change. That commit is not part of any release nor of any maintenance
> branch yet, so only master is affected.
> 
> Fixes:
> https://autobuild.buildroot.org/results/9d55c1b27627118c4279d9aade9f65b45db57e52
> 
> Fixes: 3b5fbe8f6e7869c41616bb7e1e97b20f52f9976a ("package/mg: bump to v4.4")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

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

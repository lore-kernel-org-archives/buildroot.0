Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50342606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ul4DtJhl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AB5B80BBD;
	Thu, 22 Oct 2026 08:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z0izHt6-x8K; Thu, 22 Oct 2026 08:39:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 66A8080BFE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792658363;
	b=BZukLNQWCj9N1y3IfCjpZkLeLrCEDOAilcxr906P5W6O3xsZ4n/h1yYFzgGKenCgNnZq
	 bIUz+bqjjLWebpRMscOyOrPy8noT/emI9zfGPehZFn3BlqHm6/JsYwZKh5cHNwCwJ/ISR
	 KEycl9Dy0L++iP3sIqvESJc/Inwl5GGoH9EMFt9+9Eess5/g4dm1uVRodRznVIFmXz77e
	 ftK882H9rSzVTpfN12PNkfYVWQtevQ4D9QfP8T6vbwN403j/agPmjFpSjZtfhCyba/5XN
	 pF/dcYHWJpaUAPgQJOZpg0QDHl1khV+fuLMiV+Qsb3hid8qfAAED8/WhKrsoHsxJJSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792658363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wkCQn+kHuVBz01tOBe9QQbMebHmpdIeYCXxD94+E7tI=;
	b=nVdWXdnZLmYHxIUiSuLTqc1dReqgIwD05JnkGa5d7rjEToXUb+9CJMP8+W9HgFF4Vk6i
	 qDFrSNrXVB8rgT4zN/eY5mdNTsaNuA3haljMRnBGG3yFHNTUN7l/PevcQ3UC9Y//djxGf
	 iMa3tXbzew+UAVcLpEaO4dwLjl4MYDOkAvqLRM3cRh4rH8o/VZuRtXXJilDZdaLZfEAIn
	 /pBjKNVC7go66XudeqLFNrhpxL1RhXjeE+993so7BpRRiOLR9zSad9oVJpWQVz8+/0qsp
	 ouimYHGhzfmSToO7XgACyWS8ooHYSJ8dSz3Iw5Dz729UY7zr85IuhZqC/i5cQnUUFtw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792658363;
	bh=wkCQn+kHuVBz01tOBe9QQbMebHmpdIeYCXxD94+E7tI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ul4DtJhldxf7ioPT9ZszQjhBo62rYr41zse7iVAnV1ruREtGeNCqvm540RizUZbdK
	 rJjlSh1bN2ohA2kvDpJjcKvUbnyjof2poRD5bb2bykt79wbIHlfgtX0XF7jor0Lh0o
	 ZSHHO9GrmlbmtNvbhA+u2GtDhe6VEQfM0kliky8gOt1R90TeYC0wBNIoCxh0BRsPCU
	 0rV+/cIJJcslV7fqb2JNff4NHcfYpvepybeRu3rt9/wo1eTmpVxyritCL4yz+1LpoU
	 oW+A9JbHVNz8wJwWcb+q+YFojeU/L+zTARRNjLyCq/1r+6rXa6EpNT4h2sQY8Ky+hb
	 4zjKll5LJMKEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66A8080BFE;
	Thu, 22 Oct 2026 08:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F22B7235
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D80FA80BBD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 403m4n4szCSq for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:39:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C59980C0D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792658360;
 b=E6V90JxVkaw0/T14yDOpukLZQOgKzkGtXRS2Kflqfd4ogaDMxqKj1TkShpAAUgiiL56q
 vq13gYO5jtJWDaFCViMHULVs3LU/n7hACgNpHtY9shPnmQ3OmQHJjG57LNx2q3XCxipvS
 KPVqTgCiUwV8WMS66J+QaTxU3jlQ/7qiTcucWvnIpAwZW74pvNBDHgOp1eLwEj4TH4Fe7
 9xcBk2wwQuNSwb5Nx99+FL+YGU709YtNzG/JYw28nbmZBDTJRICnIk5GI7DK/UktQbyur
 MDncRTCqZelfiucpC121N1hc/uceo8dxH26akJ6LBtvik6ktX0nivSawG3Dtq8XAFjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792658360;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=unikm9L8Z8ZifPlMYMGvi8oIasmrnnbHYWvPQuPagew=;
 b=rr05JOrMQoe1nt9ljMlgcmPh1T4JhP4Da8grUBpcsnQIoG9H6feQgkUeK0zrW/DYyGy9
 6t9Uglf4BcQ/SKI63oAGPVyuJ5Us9tdFTcfJEbIzjjyDnTDKCSgj8gA5WqrD19WqdJ36q
 NiDB1jRBc+6qTkdm7otVfTM2WSAQOC5scCRMr9HiBkvaBwxb5jet5UzQM7MOIFoWSRk+1
 d5g/W1UOtNNw6pHlS5qEMOla/JmEiPiD8EaUrELwcM/8j9yKxe9aOiQDEoJoQq9dPENdK
 o9+hbuninktPgWNywJRsnABWFp9YvbeodBGbAdRc7POHuL5EqjauigFESdyEcwj/LgQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=muauOJnQ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C59980C0D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 755A9C5846E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:40:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 20B8A60360;
 Thu, 22 Oct 2026 08:39:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DEA8210328C52; 
 Thu, 22 Oct 2026 10:39:12 +0200 (CEST)
Date: Thu, 22 Oct 2026 10:39:11 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <atnLquTvHpVl5OJ2@windsurf>
References: <20261022064045.2186383-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022064045.2186383-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libconfig: bump to version 1.8.3
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 08:40:45AM +0200, Yegor Yefremov via buildroot wrote:
> For change log, see:
> 
> https://github.com/hyperrealm/libconfig/releases/tag/v1.8.3
> 
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

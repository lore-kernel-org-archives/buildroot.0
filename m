Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2817606A31F
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k10VNhgf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA85380883;
	Sat, 24 Oct 2026 17:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWiB45wTUhxi; Sat, 24 Oct 2026 17:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3420F8087C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792862326;
	b=AvvvMmnfbJlwTR/r6G05ox425h9psqb8bHJwU8GEIhXw5SBeb4z+B+Lrvv92kFhlkeMH
	 HgNXxFhMVD3HTxT5fmSgSNQPhPpcb0vrFd9yPkRnOg86THCb82FvTHyCtSGbPoHXXrfY+
	 jqHOp12PTcdJlFQBIPBpPvYUoTolAONLXU4YPZLHQ5ApZestYwtqN1uIc09W03vqaxIoR
	 M/705SP81IPQ31gr7vp9p/hu6vPm5ET/X+HpNk292RqjaJWbvstZE6GifoF0CFwIwE7Tj
	 CXZMTi91G3bGTXFXspaEnALt6XQ4O+7PfKIXPqPPg9y8lLgRMLI51pPmj1xTSKpG5Gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792862326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=Xl4ECzR6/mDdRaGc1INFQO+ozFzem0GurjVCOp6TBVs=;
	b=srOiT2THbTcxkCN8EfVzEdAxV/Rv2QEt1y6Zk4At80jnYDFH2SUNuWzxJ0LYWUZeJ22R
	 qAo+uJNDSW6P11tDFL4HwqrYnEiaNXMFfusqhKfXfvk4LACmSn0eukFOPc3w/zLrIVSR9
	 AdpYOjgGRn4pbtpMjbsg884U4WEYJiyIQlSyf38PYCh/T2jVCIQ9ndJr+f6svYfosAKQw
	 69UuQMRj+Et8BIDw0Smvk7EUQTLwT97jBa2SI0DwmvSr3O3VZRMMGtBLNnv1p4b/Rr/A2
	 vekpKW1j6YVKqgJsUfCQqiwyLBL7nEX6NwVUw6NoSSgE3aOWc+/63K6Xw2MHrbCH7fg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792862326;
	bh=Xl4ECzR6/mDdRaGc1INFQO+ozFzem0GurjVCOp6TBVs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k10VNhgfdkD4nMUi0ANz5rD/632pHxfF4drFUjyYQ9tztxDzT6idNF5qplEaOM/sN
	 5NlK3q0DNabGdEdmF7WdtI3XOwooJ9ZcWSG4T9jnBs3T9CCbPh4q9oP5Ra8qrOrkur
	 K9Imu4Bg6/1Tnacgvhg+y/uXUqJawY7P/yhjXfCsyDnpIZ3olgLwE5Reu71V47XHw7
	 gV6oqBd+mwFaUYuNDWS/2PsZUFZRaG8wKWu+BfmyoujkGk/W9MZbAelHUULUG9/hNx
	 5B8DNvQ5yLrHWu8GmZDfQjy2aMJQisyB/YArpyyMQwgI49fHHfadoymDnbn4sMa7GE
	 qa6dMhHr5k2YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3420F8087C;
	Sat, 24 Oct 2026 17:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBA424D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2290403AA
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQI7H1mqRm3m for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:18:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E89BF402DF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792862324;
 b=ZuhaKoDFmM+kmBimLUHSgtt5/GXLZF0Wq1FXOWmhzalcAFAkJgx3wSOTjCzn43NwsCkX
 TwP+cln9CbuBnEbxJ4k+xAFN71Jp+4HoCsjpFfeeg5aMUzytazIFqtiTN2waAfew//doK
 /GlWSePytHubOeIwqLb5ZUUz1cOB6SE5OWQ/VlnBzhz9KRbEnpVI8RpEEpa4fppF5Ug0V
 VACrZ4v9FzZvOy4kfb2QL3D0ZieDB0/Du4TH3FnxUl1FhxqW+zHl6E2wzUY4H/5NSZjtb
 Z+F4ZDNTxiUxm+nuG+SIr0gRy3sSMIcl74YdiFACwQNhCB6PoI5o0tu9ACP1n4WiM0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792862324;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=20OC9mWqxtME1LoB6VFE9J9HyE4Xu55hhyhinuU79r0=;
 b=QR2zl/LNG1kTNUwyan3K6/J7ZuBAAoxdIBlTVt6GVEXFAEWMZnZDmzcQ1gewwydt0aw6
 zG0Zlw9TyG+FUqsE1I/jKBxIWpMmFYJvBwU0f4c4AAX8lq6MdvDEjxHySDRH3j5qJDiiE
 TnQhAvkqTtZ+LjHHINTi8mEJciaWLPjG7YLsy5pofKpMt/PJBdw7M3yuB2xaEEg0i8o2J
 eOrqoY+vLDuo84Z2D78p6vgmEbFhbFkUmvB7OAtX+L9ipBAEXZ14ilwojvZiAJU5NuB6A
 dpP0qbJra/7EifrA5JljrFuy2xK8OKKAVaOCCFnOSZEERfhm+x4o8rx+gp9gb9gHhhw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Xs7z5n4r; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E89BF402DF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 30A1BB97A533; Sat, 24 Oct 2026 19:18:40 +0200 (CEST)
Message-ID: <7f66d899-c3aa-45a1-9e71-2e2afd586bb6@rnout.be>
Date: Sat, 24 Oct 2026 19:18:38 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261020202639.1094960-1-ju.o@free.fr>
 <20261020202639.1094960-4-ju.o@free.fr>
 <562ad192-b09a-4470-a02e-e3b0d5b2af00@rnout.be> <87zew6t6is.fsf@tarshish>
Content-Language: en-GB, fr-BE
In-Reply-To: <87zew6t6is.fsf@tarshish>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/4] arch/Config.in: change default target
 architecture to AArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 22/10/2026 11:43, Baruch Siach wrote:
> Hi Arnout,
> 
> On Thu, Oct 22 2026, Arnout Vandecappelle via buildroot wrote:
>> On 20/10/2026 22:26, Julien Olivain via buildroot wrote:
>>> This commit switches the default target architecture in arch/Config.in
>>> from i686 to AArch64. AArch64 is now one of the most common
>>> architecture on embedded Linux systems. The default CPU for this
>>> architecture remains the Cortex-A53 (Armv8.0).
>>> While at it, this commit also refreshes the .defconfig to:
>>
>>   Do we even need this .defconfig file? Isn't that a leftover from very, very,
>>   very old Kconfig?
> 
> .defconfig seems to be Buildroot specific:
> 
> support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch:
> Index: kconfig/confdata.c
> ===================================================================
> --- kconfig.orig/confdata.c
> +++ kconfig/confdata.c
> @@ -30,7 +30,7 @@ static void conf_message(const char *fmt
>   static const char *conf_filename;
>   static int conf_lineno, conf_warnings;
>   
> -const char conf_defname[] = "arch/$ARCH/defconfig";
> +const char conf_defname[] = ".defconfig";

  Well that's stupid... We don't need an architecture-specific defconfig, we 
don't need any file at all to "seed" the defconfig. So I've sent a patch to 
simplify that.


  Regards,
  Arnout

>   
>   static void conf_warning(const char *fmt, ...)
>   {
> 
> baruch
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5225CEA71AD
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 23:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C517041039;
	Sun, 19 Apr 2026 23:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHX_s7ai0UCj; Sun, 19 Apr 2026 23:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9392F4102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776640910;
	bh=vd+dopLrO7QBDqnl1lHQQUFxu82E4xe/AsoG2//acb0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=SNoD+NfVIB5nQ9J0RPgHK2ehQKx4kJ/3Ve+Hz/o8akImc3dqf+O4zjHhN9RqLujX3
	 HCubZdropB5IcN4FU3NESr1p0Ve/reO1kq5jHPMIpergAaeUxZmITxdnWWI++IzHuq
	 dpYZ60O+qpbV9YKvLvZmUDTqew/XuNsWV6dcdmv9jG4QJQJ6CX/s+z3Y2pjSV6DLzw
	 DfzBqqyFa/+OnIrsNZ0oUbfMvozc4eoI3CAspyqnCZNfh92tfX96FG9fvpI4pgyITu
	 ySL0ETyeBmYjNXqaIN0vwaykTZ40TpfvgE9NkeAnGkjx5lwx7rX+aQ39+Cpd6pLgKS
	 EwLMZNM55LFFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9392F4102D;
	Sun, 19 Apr 2026 23:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8361259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 23:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA3034100D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 23:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsXp885k1FMS for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 23:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA6A040F66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA6A040F66
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA6A040F66
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 23:21:47 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4C7902C82975;
 Mon, 20 Apr 2026 01:21:45 +0200 (CEST)
Message-ID: <0a5de70e-cac1-4932-b4e2-40deb3c18e1a@bubu1.eu>
Date: Mon, 20 Apr 2026 01:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260419173016.53785-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260419173016.53785-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776640905; bh=uA5s/j4sUfNjjyfb0urTSDMcD9FIASMBva0iOZDlOoY=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=A+OWJxwKP6HqXEAS6lpHwWio1oUjqbJAzb9DMBr5f5pzyt36UTFNIVu3HdiAxWtT/
 Q8i3LZRSQwzvQ6LbRA7agnCA9bmFtT5Lofh6K9nclVy9+o4YyAjH7mnuKAaIQnJMwx
 HkL9Z0rKdHOvUp8IQLuVga2ZR9r7/++BnABNhKLqhgjM8f3HIMKBvyTFmnRqbw2oQ4
 tqRKkGGF1lL5xaw4pTEIB48QXna29KkAu82Vxb+g7qTkBkKeueY404teXS3r3XP6CY
 x+eroZoOTN74en/wAxdweYXiV5iKzQ9fcYahk4cY1hfaco5T07NSaEMfGwL44hlh7y
 gW05lE1LrOk5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=A+OWJxwK
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.37.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Shubham,

On 4/19/26 19:30, Shubham Chakraborty wrote:
> For details see the Debian changelog:
> https://tracker.debian.org/fakeroot

This page doesn't really directly provide a changelog as far as I can 
tell? It does link to the debian package changelog, but while debian is 
also the upstream here, the debian package changelog only, unhelpfully, 
states "new upstream version".

The actual changes are these; 
https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.1.2...upstream%2F1.37.2?from_project_id=28340

I don't think there's a proper upstream changelog though, unfortunately.

> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   package/fakeroot/fakeroot.hash | 5 ++---
>   package/fakeroot/fakeroot.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
> index 1f52d37f1a..9fc8e0a54e 100644
> --- a/package/fakeroot/fakeroot.hash
> +++ b/package/fakeroot/fakeroot.hash
> @@ -1,5 +1,4 @@
> -# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.2-1.dsc
> -sha1  925958f4730b172f4e1ae5dbeb9734f3da95da13  fakeroot_1.37.1.2.orig.tar.gz

As the upstream signed message explicitly lists the sha1sum, we should 
keep this updated here as well.

> -sha256  959496928c8a676ec8377f665ff6a19a707bfad693325f9cc4a4126642f53224  fakeroot_1.37.1.2.orig.tar.gz
> +# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
> +sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
>   # License files, locally calculated
>   sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> index ea0edb7665..12d7f1c4a1 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -FAKEROOT_VERSION = 1.37.1.2
> +FAKEROOT_VERSION = 1.37.2
>   FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
> -FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250513T025019Z/pool/main/f/fakeroot
> +FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
>   
>   HOST_FAKEROOT_DEPENDENCIES = host-acl
>   # Force capabilities detection off


Applied with these changed, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

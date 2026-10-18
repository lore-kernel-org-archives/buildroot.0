Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B9FCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ACF880F37;
	Sun, 18 Oct 2026 20:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kl-fQfKDeJVl; Sun, 18 Oct 2026 20:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A108280DF6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792354844;
	b=S4PnVD9KlAxJUqo6SqNlezrWLwVEvxhjxtsWOvCF+PhVdRkChTvJ/L5FJ4wh7e6ZGadc
	 dbYV6CuvbC7W3isqmTIr656dQPfl/TVvt+q08/EbqDoytj5LCr6QnhRzQbAf3WY3Sqhe7
	 7v166iqDmIVuIO1IlgpePw4O2krtsDkmM9/HARRofQyk2phu0USRySeQYv+0I4Yjp67sX
	 wc2tgiz/qa8nZKy8hXV47mTtr9wL3Lps+T5wzuHRJLVJM+PJ+2BF6zP9WH5oVJAcTODRu
	 WaGB1pbpwxfAN+8KPDUxHn8gt7qA84PQMN/1cO1J4wFYcH9+dudrCadm/CKXB61lckQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792354844;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=HVH26b0psfcMCYRN5ak7fb6CgkSyfpPSLbXDMazzm0w=;
	b=A3Cg7K7bJym09+qfUKsZACBYVEOv/rjFXTMJldogVA3RTvmjA4P3wKzN1BEhQOiEdx1y
	 aepsPUQ4bQQP/VtYqHXVz1dCRH9ovFo1pnrZjedbiJNIsfZ1wkBiI0BCAoVP2yaOqAZNa
	 bnRFyk7DEAXE87u5OqeoJm8MZmrp4zRJzRtNj02f3eV1K2RP8qkT2u44ZWRJPSDD5/Clj
	 0jBdIBIcN+7U26LcnkJvQq76B+BJnO6eQDDxiV/Dcs4SSvR8NoywmLj30sxsTdnNmcmFI
	 6i3ZVj2SJ7/pw2sxMkpLzhZ1PR4e3edIkDLW5B2xqr5qLxLOsBnQZNV5GBM4IGUB/fA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792354844;
	bh=HVH26b0psfcMCYRN5ak7fb6CgkSyfpPSLbXDMazzm0w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nvO7Q8NL8XARnrkr+zIpBswbMw3emezjih/IQ10bzGf8cBFhSENV32TJlDgD2at6N
	 VZve4sLdxW5Ib6L1+bqvjtUCboibCsQ9zCzIBKz+D7gnqqRE9hfWVj3N6dpVMkj2jo
	 5of/OMwCi/ck9W+pMq6xJhYDlk7SO3KYFV9Eqvb7czhEZRNcePSICJddtMcL0LBlOs
	 zzzZuGpztEBuf4mCA7MVNKvfN4BEWInEePwX/lLCnogCnoC1AgmiSYV00ONaxvE6Xu
	 Usbtx0rwHh1tXvAHKYiy150k0dLZgPdlF3M4YM3krlecTRTeyH5zbMYp7xUjMkB0lu
	 EsvLqpajfMj+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A108280DF6;
	Sun, 18 Oct 2026 20:20:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF3BC769
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55BD80DF6
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfzBn0iySprm for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0232180DE5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792354842;
 b=M4GBK2LElCo9ASkEuC9cfeJHb8HSHUEB9esDI26se/jaN3c9pIsXm9wFYtXSJKfnPF5l
 Z4lgz2g02TmcI/8elMp6irFwAck6sAoGHvlYP189PAzHeMbhDLeQJSD6xweCaoI48XN6F
 wBJT1e37gM+3il/pa11AYC/D0SutSllt516bAmGN7wGEZdBGzseRyCDlybgK/3hqohTtO
 i/1pfOxfwr0qsVu0JvHvRNITbtKgAxta9Uo/5p1YEQQPNVGTGDelWnpJejDdaywLZAYAA
 uZ+s9Exv+fhugNfcWmLbuUFDdyipwQc+FmvSEUWBMk5Hdya/KkWr/Pwr7lSRIg+DAzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792354842;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=bItGCwFzyKRep/TA/vxrvb+WRT+PbbAxj1tBHwBgV/M=;
 b=gaKT9dtim2DRXNbfVKQcrt0mb+zRp71PSsUIuYxYTgPQLqwWaDKg26+Kcsy+E2CAoovu
 JkQwM3vBHFfnJ38GcdS+AbqjqwwnZzGYhF30pVDnxi9OF4L1XvjCYRySGzvKN/tgPmuCp
 XwZxIRLzd6fFvNZKEPJHXteW/r7VQnebodtUZrvqvtw5sT+j61gfiOqf5Yn6I3z9mD5fP
 1j87+DrCEcKb+yH9qFVx3jzvtXIoZPsaezY8NpxFmsrjbTi9XFiqlZxQhSzKAQ5QouvOn
 3gRu58suERupkEPtq/u33OkFs9nf022BCS5FLQTYZy8haC4OUUIE1rwJs18LDJ8IWPg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pT6jPUah; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0232180DE5
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:20:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 591B978035B;
 Sun, 18 Oct 2026 22:20:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 22:20:35 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 22:20:35 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>
In-Reply-To: <20261014074101.3674446-1-dario.binacchi@amarulasolutions.com>
References: <20261014074101.3674446-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <9bf0de6ee4dbdc77084053e3feed3136@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and
 Linux versions
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/10/2026 09:41, Dario Binacchi wrote:
> This patch bumps:
> 
> - U-Boot to version v2026.10
> - Linux kernel to version 6.12.112 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

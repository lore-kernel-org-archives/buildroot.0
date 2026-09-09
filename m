Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14EAC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 21:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91CD1607F6;
	Wed,  9 Sep 2026 21:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqC-BOPFbQ3x; Wed,  9 Sep 2026 21:05:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6EEDB607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788987944;
	b=CiymhD76NjOD8TmHFRKW0PRY8SjlrfZB9ygMaasVCnuzqD66LxmwmHY+zJe9zKFDk+Rz
	 W+xWXyhHrHXGOZL4U0e+3Qw2AYU6nIN9rRXApMhdqi3T+oecqaJZ10qvesoeuzr4FfQSM
	 OjgLSTVlfC1P/qzS8IsDVsEWfgEsXVpuiQEs/EHuldO97gkEoCAmj5YqsR6kVo9lAAyvw
	 Cndd7NIoA5JXmheHOatRYWcHHKYjh+cDbFeZkQ9d0C6LuDT1QgOmYrbZglJ7F/M9k95bs
	 WmPVkpJJ+cMVmEFyAUeRU2sHJwqo2vCivfCEwAPIOJyKfPhNiN0LLbBFy09gN2WG/oQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788987944;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=EU84nNkju4EA+Gt0ASBF+t5plqLZ9chwu2X/PWghaOk=;
	b=Ecx4Dy4M3rwg78Rw+p8pvcblgirwjaE52UkusFkuJVOCjdL+xoHseMfPMVMn52KcmUFY
	 xPT0A5POiysqrXS+pqyp0gL+GLiDOW+HlCa7yX4kj6ENW9XpSPiazPfFjCjkf7xMsmMaG
	 n6GLGQZ8EFhT/OgegtlOGH24OqPSIaML2hfznT2QbTbdhcEdBPzLwaFs8NQnf/nhNq51T
	 Opky1jfPU/83yTluse/+E1CRd0SsE1wD1c8+2Hi1cnH4Gl75e1/busK0tMSsryXLE+saT
	 vBJa0TZZFdiy/yOJT01GdvTL+wkhteOBhT94KKi1lHImbUAj8cZeTsDiVoZlpa1fX+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788987944;
	bh=EU84nNkju4EA+Gt0ASBF+t5plqLZ9chwu2X/PWghaOk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E9OaL3Ci3D6A4gJPoA9ol6aDU5yRQO0L92HgywWwFcfZyeJN8OIIHFWdi3N8MDCZX
	 ytSsnG4hYbWQd+WAQwimII2aJH6p/2tm7+rWXRu8syqRDB3O4k2j3aU8Cr4Y479bq2
	 +xa9leNA5EeRcHoF943alDQt5GGqlmxySd0Wbn8GGxTSuDGIZQwQUtN5OCj7byXHap
	 9GrgRTXQcWYiz5XCx/gtvsnltP4KedJKhTEvImz0xNOv8WMLm58qeRV+UEPpiuwRSA
	 XnnPijxDnZxw+nF5hocWI5CdblHKhTvdeH9JiLIfE0Rnxf+A/Qy9KjbIumui2CeNUw
	 v0ob/M1EgBW3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EEDB607FF;
	Wed,  9 Sep 2026 21:05:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87BFB96A
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CE51810D5
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LK8Txkq4vyX for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 21:05:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E367810D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788987942;
 b=SUD964Hb68WB00D7ZQsaTjBhYokDl+nTyPVQzayZxuaZVmk+5VbE/xGWr+25EuzOeZ4Z
 EzkKf0KnANNWmvo1/Q+y64bmViuoMUbwnM6ALoVVDM4ZSM9aInKRBPKK/s/6htu4UIYN3
 tA/DjnO1zZ0H1zJ2keXNSWISER0OzGqWJU8vKmz2WCZuayCTkmq8Kr6UhXerB0Vd7uu0s
 joSNVfNZ2rd8O9bB9LY1HUWKIxzPsZofpdG8OTLre+p4qTdV4IwyUzywlcmy6hUxFNFQ7
 jl8COpERZvpxKab1noOhRaYz2dH4O/OlySAjO3fPeOVR/LzwKJuK0lRoGhVsnhxkmfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788987942;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Js9lbcGBUs17F3o+QDKIV1Q/elpSoVNu0IthsqNwZM4=;
 b=rPz2Xr4rnQglio72cyNr5exV25T3h4R0igC3Zp0lrcF5kQW2+wjxkdRfyOoZcsMADo9T
 dcNW9PUreelX/5CAB+0HFHaq6F4HMF/MEYJbLMl69qCqtyPEKMOKeH6B+cAMlIDPmDfpH
 t0F7QxSgfSy/n8H7AEciOtdLvA0t9S3giFeRQFy2+6fOXnQi3Ddy8RXwJFqSXXgVXzUTo
 RxJMKrt6S/ZCRn05DmmGx0G0RJ3rALwj9M38VgF7v+nTg5ZSq4BmX+ZTowIVp28VLVG/w
 RKSb9Iv55ubxgjYbk5xtl8zIhBw6faDY7GjeLHQrBoajTeTUBsZUOb4SEno8rSC7VEA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Myv4cKQa; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E367810D3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:05:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B4B665FFAA;
 Wed,  9 Sep 2026 23:05:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Sep 2026 23:05:35 +0200
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 23:05:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260907155344.3755749-3-bernd@kuhls.net>
References: <20260907155344.3755749-1-bernd@kuhls.net>
 <20260907155344.3755749-3-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <cfffc374b447ed2c0711fe41e23197d6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 3/3] package/llvm-project: bump version to
 23.1.0
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

HiBernd,

Thanks for the patch.

On 07/09/2026 17:53, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-23-1-0-released/91654
> 
> Removed compiler-rt patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/llvm-project/llvm-project.mk 
> b/package/llvm-project/llvm-project.mk
> index 5cbbda6e06..31b2a4dae7 100644
> --- a/package/llvm-project/llvm-project.mk
> +++ b/package/llvm-project/llvm-project.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -LLVM_PROJECT_VERSION_MAJOR = 22
> -LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
> +LLVM_PROJECT_VERSION_MAJOR = 23
> +LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0

With LLVM 23, bcc is failing to build when I tested with bpftrace.
I tested with command:

utils/docker-run support/testing/run-tests \
     -d dl -o output_folder \
     tests.package.test_bpftrace

It fails with error:

/buildroot/output_folder/TestBpftrace/build/bcc-v0.36.1/src/cc/bcc_debug.cc:151:68: 
error: no matching function for call to 
'llvm::MCContext::MCContext(llvm::Triple&, 
std::unique_ptr<llvm::MCAsmInfo>::pointer, 
std::unique_ptr<llvm::MCRegisterInfo>::pointer, 
std::unique_ptr<llvm::MCSubtargetInfo>::pointer, std::nullptr_t)'

So could you send a v2 of the series, adding before
the llvm bump, a bcc bump to 0.37:
https://github.com/iovisor/bcc/releases/tag/v0.37.0
which also includes a backport of:
https://github.com/iovisor/bcc/commit/dad0db93fd0f443b2a4f43bc2f23c621c9202516

Could you make sure the bcc or bpftrace runtime test works with that, 
please?

>  LLVM_PROJECT_SITE = 
> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
>  LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
> 
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

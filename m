Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6A606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=D4f9ANhh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=A/MOQzI3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E85E406FA;
	Tue, 27 Oct 2026 14:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5gS8JYXmkVG; Tue, 27 Oct 2026 14:33:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 15BAA40713
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793111606;
	b=GKGcDIZu6d+LzApi4thT7yU5PUG1yg/n78ygVlXKdQ/GE4zGjgA+e4zbkI+kjGfFoZHB
	 ZFZasDt8vz8R/7NKXxixvv4dHBRMVXifT2UMu4YEzD31PGnLIOr4/1WcbLJ5CLtq3/jPO
	 YS06LQgErQbyIMM21K05yh05rug8PUkRjUlb5KQtAIhY5Oc6x5rx7gZ71LJh4ij58cO8u
	 lTO+4urX2DeOfWWfYrT5tmzy7Ut1YksOSxE1oFlJoR3HDEIsx4jX4jAZj4HaWFFbI75CC
	 aIzoQfUPKmwtpOVKLOOg+cxql4ZrKm1XCAI4ZGjHP5Q1jPwXFodsr6UcrzR9dP3JlBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793111606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:From:In-Reply-To:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=4in3N6gnJdvP+ShCnbt/KYFvWzJoGa9FgU4gNOmMMtA=;
	b=IJbZoni3PAXc1HiogeJ2qwIPdMHV1eRpw8SGwNFTNiE9xUfFZXxDJOi9WG1oBJBgcagL
	 y35wY5vXX+zgFxOGEmuAfKvqLdvq/7FNH9fXtTDrrgAsmiYp4hRRLUF18iTxB3cmOawHJ
	 4M2Qf/Ap9zaJNbmiQpugnDQwrtsFe4Ye3FAbFWGprHm1O0BEjg6GnIfRdqmqOsi9SUVGc
	 2l+YHu35Zv90I3CQeGl4UDxU2Yy/9/U0VsuB/BLBACh28iuc3pfVHTu0/Wzambwq8f+lD
	 UxVP0qc74sJTCAv6ANPFleVSXtgD96SLvjQ2pNWOR0mBAkP6ltxtTd+Wj47Q8/kITTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793111606;
	bh=4in3N6gnJdvP+ShCnbt/KYFvWzJoGa9FgU4gNOmMMtA=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4f9ANhhFFtRyZd4dolFf9b1nEkdIj6TkEAMpitohVmsfHPRQHwFYxC7qE5tB/zIi
	 WIpNxCQidnebcF1vxoM5LBm5gRnNf/V5E9i/GIgbk2X9e6+aZ4sdJnXu2JHtToCh/x
	 NnkZG83AQaGULhADA4WLVR7P231dBmlezF5ywiIvvCcHjy1PF2AzMq/1kRMm2Jk5t5
	 37Ks+eSPRaUXlZTHObR87oOMm1znR4qCAqe4rW0c+WmkzHDgj6uULwVrghC/najhV9
	 BqiI0Ht9AYl35vBiHck+zvZbmPAYAF08gVJdyRyxQ1CT8SOQY3yNGIAFfSXWmymUWR
	 6ouA6Ov/+puSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15BAA40713;
	Tue, 27 Oct 2026 14:33:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 565963D9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C49D402AF
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wynxAY5L6fKU for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:33:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8A62B4028C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793111602;
 b=Eheq0b+sPNWkPlzYkpv/c4W3OzuqBAnCSxU47J9mlxAVcW9r5JI4wPg+LwtCkhZxR4vb
 SyuaEE6ODUp9KNCZisQ2/4fgHC1LhAFs2dbGH1NmvBOZXt5IUFudyaOc62P/Z80HcbA4v
 58N4QjKDeVMixwBNmMh4Tve0JpmEf+FnoP4Mt6mrmFDMZzQxVqpFl3ZfgBIC3UTE1yt+y
 gPrIAeV1QjDxFn761SlSJlC30klXrP4jQNcGEGDMjtcgwIFD4esBJvV+oa9CCBU7BDhoe
 u1ei1c76Q3E+fqWK+SB/M+QWROFchg5LwxpcWHrwRtBtg6hcoZB4TfBCxRy68hYM27A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793111602;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=x5IonHjA0myawrt96mYmG1mWTtVzY0fFxZ2U1Px+NDg=;
 b=F0uRKNYqv2/XDe/zvKq5D9C8J38Pyh+ltjdwXEPkXMfbNfQS2braP6dYZIIYqd2ohjuJ
 5X36WjZdSA3Bqxecq/6Cr5XugpXVGsZRWeIEFFZzo0EOociFtFbigklTqb5zU3t8ncbnf
 zXJnNkAH1SZfhYzLf+rfg/+AVtyDiHZGjz/iOtg/Zi95ySaSpgBa22dxsv9o/8aFvd7mL
 dGR0sH3+ptQg85IavbU8Ea9Yo29ZLQvSbww2e+RSGBq/vgRZMo/4nN48Zz5q4a8XqcIlF
 2wgrE91+tp1nA9hU/FbGyAjAnda880cOutg3HdkWDL8vPqorNrTRgflO87lxWO9gQeg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b="A/MOQzI3"; 
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=A/MOQzI3
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A62B4028C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:33:20 +0000 (UTC)
Received: from [192.168.1.115] ([151.95.84.63]) by Aruba SMTP with ESMTPSA
 id LiEoxe7HjtleFLiEoxKiKt; Tue, 27 Oct 2026 15:33:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793111598; bh=CERLnrATe7I9vcTDIN4WhGxZ4Y7OgHCFdS/Tx991Sg4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=A/MOQzI321ueesORGH3qlTmdBAUarDM7be89G5Oqpt7gpwd3e/ptJVkiDZ1eIZ46J
 99rtdcoacm4zeR9SPgHTXsaUiQnMTcbhYNldUgLiclj3dXFWpPlOxMTTs6WjmfpeMQ
 EilWCE4bBlq0FwFWbyLTW3gv9fJkfTsj2S7CwqYvQsg0t84CmDt8Somo+gk5RPHQzN
 zFsa7lRfGJALtXvtJ41/KRy8Hu9liDk+wDuVkXDROUUgYijZIM477yYK5GhDHc2EWY
 TNion6s+IKcAjtiwGGBVoMRR6go4UdqxAjkhJKYJUI5fwhczfyPfeSelnTvuG8eNxk
 TBhpRv71QDQ/w==
Message-ID: <5ab12319-dee6-461b-a90e-8f85b9e4a630@benettiengineering.com>
Date: Tue, 27 Oct 2026 15:33:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20261027143028.1515138-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261027143028.1515138-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfL9HD9b9Gl/N3/SJ3H+wFgCnACHhhKbh6193kBkRPCIXam/+Y0NU0UuWM2BW27RqUYKN+lVUMOKv9ZmkabdT/H94uoB+ijMRXFWR/ukX1gJ8+Owe4vKM
 DzREp3FR3ynadpMJpuprue2TiOT2VzUiWxh3iJKxz//RZJBooqu/991WYKxxNZy7BsLM8oSh3Ff6y+KVL1ls2+6jD8obgnEGWeyelY5t5tzUhtpIZUAjNSHw
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2026-10-27
 version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/26 15:30, Giulio Benetti wrote:
> This version allows to build up to Linux version 7.2.

Fixes:
https://autobuild.buildroot.org/results/a454b667f7af437d41dbbfd599f1bbda32c8c67f

Giulio

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8723bu/rtl8723bu.hash | 2 +-
>   package/rtl8723bu/rtl8723bu.mk   | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
> index e230485226..4b2b71ddb2 100644
> --- a/package/rtl8723bu/rtl8723bu.hash
> +++ b/package/rtl8723bu/rtl8723bu.hash
> @@ -1,2 +1,2 @@
>   # Locally computed
> -sha256  22d81a21318cdae23ab6a65bed7c24d7cc98e7d1afef7a200804761c72036019  rtl8723bu-ac3d2f564bdf6816f1e3a3384524dc1a966f78a3.tar.gz
> +sha256  eaebe07d38931408c8f5dedb3a8c61e251862e0b8859b899d193f9d5cb77d748  rtl8723bu-8292ef94965fb61d3052ff2bf068fcd830e665c1.tar.gz
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index f1c4eda4ed..4175d02d52 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -4,13 +4,14 @@
>   #
>   ################################################################################
>   
> -RTL8723BU_VERSION = ac3d2f564bdf6816f1e3a3384524dc1a966f78a3
> +RTL8723BU_VERSION = 8292ef94965fb61d3052ff2bf068fcd830e665c1
>   RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
>   RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>   
>   RTL8723BU_MODULE_MAKE_OPTS = \
>   	KVER=$(LINUX_VERSION_PROBED) \
> -	KSRC=$(LINUX_DIR)
> +	KSRC=$(LINUX_DIR) \
> +	USER_EXTRA_CFLAGS="-Wno-error"
>   
>   define RTL8723BU_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADE4CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556C661311;
	Thu, 27 Nov 2025 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ga1tiYPlDtpw; Thu, 27 Nov 2025 19:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B1260A58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B1260A58;
	Thu, 27 Nov 2025 19:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB262A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3A14413C6
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eV2o5LHTpIG for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:49:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE324413B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE324413B6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE324413B6
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:49:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C8ABFB979CE7; Thu, 27 Nov 2025 20:49:53 +0100 (CET)
Message-ID: <5c070ddf-95af-4711-994f-5cded3ea5896@rnout.be>
Date: Thu, 27 Nov 2025 20:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20251107012804.2080218-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251107012804.2080218-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764272993; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5DnlR5xczdtjrkqDYNFih+BGc1t6Loh5n9yxyCfzi3o=;
 b=mYheV40l4BuI818x22q8DeqfM/54qM0eboWWa9Y/aHuVqc9Au/M+/gqulc/O2KT5roau2M
 nlqxicbVGb8UalJXTaaFX/cimypeJNDYt1bJiwG8PvqknQ+c/KGkrh7rXbPpUHUy5Q4IJF
 ia6WEINl5kfAVuYHuZ6z6WcNfsjg0ic03ycUlT0qjyUCetdFNAkERHdqAaZGj5mvCL2K2G
 D4NnY4QiwJJOAgX9OT+6IVflnZ27BVAL5Vi/R/mKp9obDKu7tIexTK6yZ4x3dKQRcfpRuj
 kGXNEpURgEOAKZ4GPshuxa/D0XG4t3YEeXCzj+PN8Bd1yDTiTMSVUR94cZ77Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=mYheV40l
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: add missing config
 fixups
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/11/2025 02:28, James Hilliard wrote:
> There are a number of kernel config fixups required for tailscale to
> function properly, these are commonly enabled by default in various
> kernel configs but lets make sure they are all enabled here as well.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/tailscale/tailscale.mk | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
> index 3c6c7bce1e..86039fd4b1 100644
> --- a/package/tailscale/tailscale.mk
> +++ b/package/tailscale/tailscale.mk
> @@ -28,6 +28,19 @@ endef
>   TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
>   
>   define TAILSCALE_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6_MULTIPLE_TABLES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLINK)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV6)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
>   endef
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

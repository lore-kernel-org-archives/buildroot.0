Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03315CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE8241172;
	Thu, 30 Oct 2025 08:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rr6sYQSm13To; Thu, 30 Oct 2025 08:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAC8441059
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC8441059;
	Thu, 30 Oct 2025 08:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D4982A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F4A541059
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPA3g0dAMS-k for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:15:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 599FC41035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 599FC41035
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 599FC41035
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6D3DB979355; Thu, 30 Oct 2025 09:14:58 +0100 (CET)
Message-ID: <0f1465b4-e996-434a-ab3b-186462e82560@rnout.be>
Date: Thu, 30 Oct 2025 09:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20251027213756.64947-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251027213756.64947-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761812100; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Dgztb1dZjLLVJFThvztfCgEL+pcYOknKU3uOjVxXfd0=;
 b=N3tNNnCZw7/q1T6w1b9dOrgDyZs4UK6w71FOcj/uSmSw7rktqs3QVKOQaPVstj0wEWAUfO
 SuRkI40giey4T0/tM3oul3BTlT2VVY8hoLftvHCoO5IvnCPGkAICIHavv1d11ySxhd9wo/
 PbKtPaH/zXejmSj+2/qHHpn/IZfl+sEswne4D61gSCSmA27rEYLOIYkRHEVIBODjzbLeop
 TiocTCuSHoqOZpiv74SVM5i8RX+1Ipz2e/7wHL/ZjERlxABvHKRv1RdNTCGkOEiv2bZreY
 Jc/94/FieT4hbcgrW6IWWjbtj63g2N8hUDcnPbMP30xaiB1D49fUdMngWgG8IA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=N3tNNnCZ
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/netsnmp: revert drop stale ignore CVE entries
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



On 27/10/2025 22:37, Thomas Perale via buildroot wrote:
> In commit [1] the package netsnmp was bumped on master to version 5.9.4.
> This version included fixes for CVE that were already patched in
> buildroot and thus was not picked on the LTS branch.
> 
> As a consequence, the commit [2] was made on master which removed the
> stale 'IGNORE_CVES' for the patches no longer presents. This commit was
> wrongly picked on the LTS branch.
> 
> This reverts commit [3] which was included in 2025.02.x to set the
> 'IGNORE_CVES' back to the state of version 5.9.3.
> 
> [1] 1799cfebfd package/netsnmp: bump to version 5.9.4
> [2] 4a3eab8341 package/netsnmp: drop stale ignore CVE entries
> [3] 3ef8c1d0db package/netsnmp: drop stale ignore CVE entries
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/netsnmp/netsnmp.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index 7cd31ff209..6575ff1afa 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -11,6 +11,10 @@ NETSNMP_LICENSE = Various BSD-like
>   NETSNMP_LICENSE_FILES = COPYING
>   NETSNMP_CPE_ID_VENDOR = net-snmp
>   NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
> +# 0001-snmp_agent-disallow-SET-with-NULL-varbind.patch
> +NETSNMP_IGNORE_CVES = \
> +	CVE-2022-44792 \
> +	CVE-2022-44793
>   NETSNMP_SELINUX_MODULES = snmp
>   NETSNMP_INSTALL_STAGING = YES
>   NETSNMP_CONF_ENV = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

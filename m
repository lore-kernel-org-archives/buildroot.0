Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8209CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083926126C;
	Mon, 17 Nov 2025 20:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQNXasuIekP1; Mon, 17 Nov 2025 20:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9475C60F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9475C60F94;
	Mon, 17 Nov 2025 20:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44301158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A531816F6
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7On6_bH3HvV for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25E09816E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E09816E3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25E09816E3
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1162BB9796C0; Mon, 17 Nov 2025 21:06:20 +0100 (CET)
Message-ID: <a9abba35-6856-4a47-9ccd-1c9faf0578d7@rnout.be>
Date: Mon, 17 Nov 2025 21:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>
References: <20250828134427.177601-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250828134427.177601-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=L2APW0esCPV+bNktO1FWI1EZ2x56gX2/T1GdTHwbjZM=;
 b=GVQ5nzUuaLpo21dmdXQj55KoPBcLQAx/5y+kAT1bmL+WBlWx00XyzJDrOtKrZidgcrV/TA
 1/jXTAGR6riL/upr2+7QuGbUst8CU3eWlQXn9YZNHEu31cGo/P80XQAQHGgiEqBAdToCj9
 kJaUIrz12O4CUo17EjsTs+gris22k4xE0Q5mEvt62JXckPW8s9qpAzMuyVQBbiwaLOx8Yy
 bzOTNxnibIt98KBRT1YAjZzjWX+FSt25T59ojYhXHf10yn5vdHLJ6ALpZuDZdIVfTlomxP
 w1SLLoTRs3Rwun5KB4M+WvZ04xWbeCmO0gHFJKZjjb+FRjBmiMFBH6e5IcuBEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GVQ5nzUu
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: use more sensible
 default value for <pkg>_CPE_ID_UPDATE
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



On 28/08/2025 15:44, Thomas Petazzoni via buildroot wrote:
> Setting the "update" field in the CPE ID to * doesn't actually make
> much sense, as * is a wildcard. Instead, this field should really
> reflect the "subrelease" / "update" of the package, which unless
> specified explicitly by the package .mk file, is empty.
> 
> Using a wildcard causes a few CVEs to be incorrectly identified as
> affecting some of our packages.
> 
> For example https://nvd.nist.gov/vuln/detail/CVE-2013-1428 has a
> CPE configuration that goes like this:
> 
> cpe:2.3:a:tinc-vpn:tinc:*:pre6:*:*:*:*:*:* up to including 1.1
> 
> and this CPE configuration is currently identified as affecting our
> package. This isn't correct as our package is using 1.0.36, not a
> "pre6" version. But because the CPE ID generated by Buildroot uses *
> as the "update" field, and * is the wildcard, it does match with this
> CPE configuration.
> 
> After this change, two CVEs are no longer identified as affecting
> Buildroot packages:
> 
>    https://nvd.nist.gov/vuln/detail/CVE-2013-1428
>    https://nvd.nist.gov/vuln/detail/CVE-2017-9454
> 
> and in both cases they are indeed CVEs not affecting our package.
> 
> Reported-by: Titouan Christophe <titouan.christophe@mind.be>
> Cc: Titouan Christophe <titouan.christophe@mind.be>
> Cc: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-generic.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 95ff9135bd..cf55101265 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -727,8 +727,6 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
>    ifndef $(2)_CPE_ID_UPDATE
>     ifdef $(3)_CPE_ID_UPDATE
>      $(2)_CPE_ID_UPDATE = $$($(3)_CPE_ID_UPDATE)
> -  else
> -   $(2)_CPE_ID_UPDATE = *
>     endif
>    endif
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

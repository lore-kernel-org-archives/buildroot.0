Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A0D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2672406FD;
	Sun, 28 Dec 2025 22:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A79I6drAo-be; Sun, 28 Dec 2025 22:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F2C4056F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766961803;
	bh=A3VF8QpZv2tCJG/uCeYvEaYFTkyV/KAHmfFswOXBgoA=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a7NWnEm5SpuRaa0ECUgWCHl1ZScYyxl0kbClgXuSXJfXhceoMBszocNJ/dzh90zO1
	 YMEe9aI1+HLkCvqrf3qRRYFmP6eFz0cbZla9PRyFEFAM/YMSBjlyB1VoosInD1tui1
	 8hNsEYRVA6S9KfDd+aKAPNA+mwIl8pUC943X+Od420GmbWC28SMbbOehN0mtN1NgsK
	 WKJj49V4rCEoySjjwqvjV+rZ4aT7H5KTKj1qQ7LdDDjGWvYqw0DX/5bKPaKSt19Dqc
	 mWoikgqpxpFthvClyNU/UPR2r0Kvqt+kHrmdLBU6OtB4m32advM16K/9rTrDmo9SX5
	 RTeGPlegEw3/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F2C4056F;
	Sun, 28 Dec 2025 22:43:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C7BFB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E03E80C93
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uw7JOrLtRrDQ for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0713E80C88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0713E80C88
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0713E80C88
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:43:20 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id ZzTpvXo6PGVgvZzTpv0ZJ3; Sun, 28 Dec 2025 23:43:18 +0100
Message-ID: <63a3c5fe-d564-4c14-9dab-4808159f908b@benettiengineering.com>
Date: Sun, 28 Dec 2025 23:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251228223653.2130377-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251228223653.2130377-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfOv+wteDyEJxyRku3Foql6hmqktw9xdPFi5Q8PgOAD7WbRwtYWNtsIQBSCJl/m6UxXsLupcOdFBz4XCV6sxQG/lZ/I23kRX8ETNQ/+pGMz68/a1E9p5X
 fEK/5B/NqfVGrsW5TJo3WWi0ddm3VDwb74j63Y1HprcuJNBPAl7WUInVXGXaYB3LqvdQpTX1FDoBNivp6nA6qpX+jXatDBnGLc7OXks0dvbmHuOYvmV7glv5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766961798; bh=IViOEFPQyRXgNwZ1b0KDG/FmSjkEqQb6ul4e8ev4zuo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=M4yFQp/aX6iSVQ6tv1ItFJxNzDp80N0QwsHnwJ9aNgYqmHGg92pU6nSbrrcEjCUqy
 LAuqvGAzp/0soPBFjdZ5KYT+ZY1KEfOEMso2mduPWBFor6W4IIt7pKnmO8FDHMVcbG
 XqY+5zY5j575fuDY7zw7hMI4TjuQIL4/R7DTPje0wMby3C8FZqYJ2LnTm0coC2f5Tp
 sXEEfpvtA7T40pPizMKFavbLGUJJ/4eVZTfNaJej1Ji9nT9KKveY0zJjqFXSR0fsrn
 UEKLhheXmRmNZ7P/MWI8CFezZzQ8wK6yD/kYYZJEf36RBj09pDnVcHcO/qlR/ptamu
 5tpxlfXJvRkLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=M4yFQp/a
Subject: Re: [Buildroot] [PATCH] package/gobject-introspection: fix harfbuzz
 GIR linking
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

this patch needs to be tested with all gobject-introspection package
since this change could break some build because some package's 
workaround fixed the bug.

This is more a RFC rather than a patch and I've forgotten to tag it as 
it should be.

Best regards
Giulio

On 28/12/2025 23:36, Giulio Benetti wrote:
> Prepend sysroot by default in gobject-introspection-1.0.pc to let pkgconf
> checking for girdir to find the extended path including sysroot.
> 
> Fixes:
> https://autobuild.buildroot.org/results/3d4e909b07b717a49e97a2452578bd3870a5bb48/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/gobject-introspection/gobject-introspection.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index dbf0ee3fa8..aa01844d0a 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -136,7 +136,7 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>   	# of which pkg-config appends the sysroot directory. This results in files
>   	# being installed in $(STAGING_DIR)/$(STAGING_DIR)/path/to/files.
>   	# Changing the prefix to prefix prevents this error.
> -	$(SED) "s%girdir=.*%girdir=\$${prefix}/share/gir-1.0%g" \
> +	$(SED) "s%girdir=.*%girdir=\$${pc_sysrootdir}\$${prefix}/share/gir-1.0%g" \
>   		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
>   
>   	$(SED) "s%typelibdir=.*%typelibdir=\$${prefix}/lib/girepository-1.0%g" \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

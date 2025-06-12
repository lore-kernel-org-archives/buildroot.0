Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAADBC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A34094074D;
	Thu, 12 Jun 2025 20:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW6410e9rDIz; Thu, 12 Jun 2025 20:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C3840726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C3840726;
	Thu, 12 Jun 2025 20:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B774183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F16A34090B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YMDrDKE7xyH for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:11:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 21DFC40456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21DFC40456
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21DFC40456
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B07C1C107D; Thu, 12 Jun 2025 22:11:16 +0200 (CEST)
Message-ID: <353f75f3-05fc-4c62-88e1-1bca38ea8913@rnout.be>
Date: Thu, 12 Jun 2025 22:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250608110317.16552-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250608110317.16552-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749759076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zoDDC11mtl2tvgxGikBgoMe6+EJWZ1u2w2xOHIfXlDw=;
 b=SoMUVaskyvJPS6fEYRXCic50MDWNPzR/3MtSesbKI9JpnAj54uQvYpbpCgut6aCFtw7cQk
 JE/O3DvsqOs8yqVSUSsql7UIcjgD3IbmyfCCuE2CIMVo18HtRoAQvT8TRCvxrDdWHHo6LA
 hlnCQs0BGKni6kYhe2t0I/ch0toUnttDDb72tDwZq5mIF3na5D/ZtAYUjRUrOVXuLI9QoY
 /ozkEJeOOHjOu+zMHKBS5QwAeXXIgu2wCebgfkiihycEreBMwoCpLNAlWhZ4I32tv+T7mf
 iNBePd1iAzCogkqutGCqU6JZx7wMZWrFjpqr5jOFr2QjuCp6KXpq1ILIUvOupQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SoMUVask
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: add missing mariadb
 dependencies for mysql support
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



On 08/06/2025 13:03, Julien Olivain wrote:
> Buildroot commit [1] removed mysql and replaced it by mariadb in all
> packages, but did not propagated all dependencies.
> 
> This commit fixes the issue.
> 
> Fixes:
> 
>      WARNING: unmet direct dependencies detected for BR2_PACKAGE_MARIADB
>        Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && (BR2_TOOLCHAIN_HAS_ATOMIC [=n] || BR2_TOOLCHAIN_HAS_SYNC_8 [=n]) && BR2_USE_WCHAR [=y]
>        Selected by [y]:
>        - BR2_PACKAGE_DOVECOT_MYSQL [=y] && BR2_PACKAGE_DOVECOT [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/8708f3a23a7e28fdb04fc57406e13e6b7ff4a337
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dovecot/Config.in | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
> index 517040fad6..e109ce6be8 100644
> --- a/package/dovecot/Config.in
> +++ b/package/dovecot/Config.in
> @@ -21,12 +21,16 @@ config BR2_PACKAGE_DOVECOT_MYSQL
>   	bool "mysql support"
>   	depends on BR2_INSTALL_LIBSTDCPP # mariadb
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
> +	depends on BR2_USE_WCHAR # mariadb
>   	select BR2_PACKAGE_MARIADB
>   	help
>   	  Enable MySQL support.
>   
> -comment "mysql support needs a toolchain w/ C++, threads"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +comment "mysql support needs a toolchain w/ C++, threads, wchar"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_USE_WCHAR
>   
>   config BR2_PACKAGE_DOVECOT_SQLITE
>   	bool "sqlite support"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

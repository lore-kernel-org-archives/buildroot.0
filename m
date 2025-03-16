Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1EBC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 10:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA8696074C;
	Sun, 16 Mar 2025 10:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sxACU2Yf5A4; Sun, 16 Mar 2025 10:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E750860756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E750860756;
	Sun, 16 Mar 2025 10:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FB23D5
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 10:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34D3D60724
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 10:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8Drv902FraK for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 10:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06E8A60707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E8A60707
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06E8A60707
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 10:54:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B296813F8B3;
 Sun, 16 Mar 2025 11:54:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 11:54:35 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 11:54:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, Andrey
 Yurovsky <yurovsky@gmail.com>
In-Reply-To: <20250316075756.333766-1-peter@korsgaard.com>
References: <20250316075756.333766-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d3fa638db3bf0ad03f5f9d345011c2eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742122479;
 bh=gKmUIFdJkEdYzQOqr6sUq/aJYyemJz2w8fInSs/jzQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k/AsbB+5zcAs7tIE9cCRLZq0ZlFRRPQB+bCPCioWO831geDG9RwRJrOV4xfRN3ibG
 79U8T9k58wuJMNeAkyGfd9ksdMMUOBnBxSu61avQKJ1sIROQPghyG79TvYRtLV4N4E
 gsxNYmt0m0P+eRdF4jJBZJW7kP2fea9vZBVWFktnrWKEb2OLDCzq8/aAJjQ+woKgg/
 /LexGKqr+Q8dRGTvPKRMxOO8eEak9dLe24RvUhOcmpGysa09CNDUeHSw6NWSZkByIa
 BAgSLEp+fd0BnI9J+hbrzlvH29DXaJk4ToaiTx7LU8BKVM+QNv1gdKe1auZnZnHDOY
 08u+ngd76vltA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k/AsbB+5
Subject: Re: [Buildroot] [PATCH] package/rauc: needs libopenssl, not libressl
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

Hi Peter,

On 16/03/2025 08:57, Peter Korsgaard wrote:
> Fixes 
> http://autobuild.buildroot.net/results/6efc1275d3aac9f0a4c000f3d0911b5a880e495d/
> 
> Rauc uses X509_PURPOSE_get_by_id() since rauc-1.3 with commit 
> 375dbb16dd94
> ("src/signature: add support for codesigning certificate purpose"):
> 
> ../src/signature.c: In function 'signature_init':
> ../src/signature.c:97:13: warning: implicit declaration of function 
> 'X509_PURPOSE_get_by_id'; did you mean 'X509_PURPOSE_get_id'? 
> [-Wimplicit-function-declaration]
>    97 |         if (X509_PURPOSE_get_by_id(id) >= 0) {
> 
> Which is not provided by LibreSSL:
> 
> nm -D target/usr/lib/libcrypto.so | grep X509_PURPOSE_
> 00000000001377b0 T X509_PURPOSE_get0
> 0000000000137850 T X509_PURPOSE_get0_name
> 0000000000137860 T X509_PURPOSE_get0_sname
> 00000000001377d0 T X509_PURPOSE_get_by_sname
> 00000000001377a0 T X509_PURPOSE_get_count
> 0000000000137840 T X509_PURPOSE_get_id
> 
> So force the use of libopenssl.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/rauc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> index af0b99c36b..701ffef76b 100644
> --- a/package/rauc/Config.in
> +++ b/package/rauc/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
>  	depends on BR2_USE_WCHAR # glib2
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # uses 
> X509_PURPOSE_get_by_id

If we force libopenssl here...

>  	# uses ENGINE_* API
>  	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
...should we also remove the "if" condition here?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

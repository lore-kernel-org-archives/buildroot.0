Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F51FC72AD
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 14:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D099F40C72;
	Sun, 22 Mar 2026 14:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38vBzHDe_6XF; Sun, 22 Mar 2026 14:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D375440FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774191366;
	bh=/iHJHh2FOac0XIj1bRaa6FGP9VDuX/FsF+RlgSFSCf4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JeVElgmdWpnE3JcK2t94YMFAiSFOKQGnRru5+BM8mQN+/YAP27RcJY+RVfBZGQq05
	 lC86rPuOQ0KMzOSTMyuLJN42Bo0o4UIW+rWKfYVEDyGXecEazuqmVgoS0hmzULtKUW
	 Hkn4ZNbGRsi3ISJDqiRwRAOTsHDuJ5Wy6Owozjg4qBWYbWXeMvrsvuyOHKZAxEnZtm
	 uR5d8REsqA8tiueFZezy+UtViJ2+SmHYZL00KgfH8qEgq+22chpfXIeTzxl28NSSRq
	 Ad1xxWsMzD6EeHXtrwqt+WQvsQD5KXYiXFLqERN+aG/iGNaKkx1aCgkC6ipCnPeO2Z
	 FvKZ6wA2zKFFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D375440FF4;
	Sun, 22 Mar 2026 14:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C4F25C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2FB660FE6
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R16BeHwHe51Z for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 14:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F04A6066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F04A6066F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F04A6066F
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:56:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5CBBB13F8A9;
 Sun, 22 Mar 2026 15:55:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 15:55:59 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 15:55:59 +0100
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org, Danomi Manchego <danomimanchego123@gmail.com>
In-Reply-To: <20260312094558.120765-2-mooz@blockos.org>
References: <20260312094558.120765-2-mooz@blockos.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <28c45d0ea293dd8eadfcc35b6fb8c1f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774191361;
 bh=uyM5QDbNNxgNK+Isi6eMnBtxJX/1RsIXhhcEWo8XscY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=orlTvSyED49xRtmhPy7x9W28abLwkU6fJ6+G+fux05KEUxRZY2jkuf7ltych36zRT
 /AX3sdRzR+0q3tZuY4XE7oMmfvyNGU2u+ht4s7b1Qvz/CzwRk0Kg7bXOdQtfZP131u
 Q1pWqllgyVlBSkTQk9XrR/fkkpqrZ+/FS8zT6Tn7J0LyfbjYu83HG2Eq4qFdlTWEir
 BAMhth3LmHFe+bqJFqcdrcX0OaG12ai+60FcTgbDxBiykAUtcjVhRYvhLRGTDOBJnI
 qM326mE5I4HIH2+PJZevHQVkhJB2agb+3H2rTh02N1xZ0LUfAZZA1XhpRln8W8IGDy
 Qbvq2RmwC/w3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=orlTvSyE
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump version to
 4.5.4
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

Hi Vincent,

On 12/03/2026 10:22, Vincent Cruz wrote:
> Changelog:
> https://github.com/warmcat/libwebsockets/blob/v4.5.4/changelog
> 
> Signed-off-by: Vincent Cruz <mooz@blockos.org>
> ---
>  package/libwebsockets/libwebsockets.hash | 2 +-
>  package/libwebsockets/libwebsockets.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libwebsockets/libwebsockets.hash 
> b/package/libwebsockets/libwebsockets.hash
> index 1466c8d9a2..cd0f3e8b59 100644
> --- a/package/libwebsockets/libwebsockets.hash
> +++ b/package/libwebsockets/libwebsockets.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  
> 472e6cfa77b6f80ff2cc176bc59f6cb2856df7e30e8f31afcbd1fc94ffd2f828  
> libwebsockets-4.4.1.tar.gz
> +sha256  
> f2aa31a0be16d45470360b868f3b5b114990da038ba5e49569f0732c58b2d9fc  
> libwebsockets-4.5.4.tar.gz

This hash is now failing. There was apparently a small mistake
made upstream. See:
https://github.com/warmcat/libwebsockets/issues/3558

Could you send a new patch using the newest version (4.5.7)
with a correct hash, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

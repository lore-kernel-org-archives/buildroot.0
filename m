Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE659C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A2241134;
	Thu, 17 Jul 2025 20:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tj-ArD-kiOKd; Thu, 17 Jul 2025 20:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEDA04073B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEDA04073B;
	Thu, 17 Jul 2025 20:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 337571A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1996740503
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJspgNhAMR_y for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2989F40442
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2989F40442
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2989F40442
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:40:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD11CB977A8D; Thu, 17 Jul 2025 22:40:11 +0200 (CEST)
Message-ID: <68894fbe-103d-4331-88a3-88180510c02c@rnout.be>
Date: Thu, 17 Jul 2025 22:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20250715202012.385593-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250715202012.385593-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752784812; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GoYsYl2nILcEFuiLne/7K5eQ4y+TU0KY4EQVvqrjFiI=;
 b=pbq9itf09QlpNR6PLsgSFHjw4QqIbGsuuxqOdC5vok448u6BWtcmhYdqtnb2La362FQamk
 y1A3yNj8ZY/jOiLidQAt3TOu5mNX4U2wbg5gNfKtODlhzPCptk2xk59ViVqra26VbAJnFI
 xJ+VjxCvodnaoJ5pM6QGyFBANx+BHxVcN1uVbNYOAZwkOFgNdMxv5B1lRARSVy+264HLJ7
 EXMFc/EWiVCSpgNN7H8oDb6JGjU3wvps7cqGWzNEiLKbdhinIHNYUItDI8Kx6xWi0zZ2Jf
 hj/cBeOCkXwqlDj7SIcRObjWG5ArM9h5a95fVdiR3kXeuYVBlKbK/0c5lBtE2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pbq9itf0
Subject: Re: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.18
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



On 15/07/2025 22:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/vala/vala.hash | 4 ++--
>   package/vala/vala.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/vala/vala.hash b/package/vala/vala.hash
> index a16875ac6a..1babb375d7 100644
> --- a/package/vala/vala.hash
> +++ b/package/vala/vala.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/vala/0.56/vala-0.56.17.sha256sum
> -sha256  26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a  vala-0.56.17.tar.xz
> +# From https://download.gnome.org/sources/vala/0.56/vala-0.56.18.sha256sum
> +sha256  f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c84ff2d795f482fe926a382  vala-0.56.18.tar.xz
>   # Locally computed
>   sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/vala/vala.mk b/package/vala/vala.mk
> index 85f928202a..24dadeb346 100644
> --- a/package/vala/vala.mk
> +++ b/package/vala/vala.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   VALA_VERSION_MAJOR = 0.56
> -VALA_VERSION = $(VALA_VERSION_MAJOR).17
> +VALA_VERSION = $(VALA_VERSION_MAJOR).18
>   VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
>   VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
>   VALA_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

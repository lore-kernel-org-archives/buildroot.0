Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7083EC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B6AB40669;
	Fri, 16 May 2025 11:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enXCJ0UNHsbg; Fri, 16 May 2025 11:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6291A4094D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6291A4094D;
	Fri, 16 May 2025 11:00:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB6F713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BC346103E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLqZoacDwFYQ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:00:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C15F160BB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15F160BB8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C15F160BB8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:00:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E41551C10F7; Fri, 16 May 2025 13:00:39 +0200 (CEST)
Message-ID: <4984fc40-075a-43de-8cea-c7a136af19d4@rnout.be>
Date: Fri, 16 May 2025 13:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Doug Kehn <rdkehn@gmail.com>, buildroot@buildroot.org
References: <20250509230843.334094-1-rdkehn@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250509230843.334094-1-rdkehn@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393240; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bW29gPAtWfTzeHtuJgs+3pZkMqz6hin8hnMgRozE4vA=;
 b=eoA99bFWgL5M+5zKhFkOsrEDOaINLOnrU1bmxyDhAHU6X3H5RjxdNbtZCQarHbIKuQa9oH
 PsIVdBXTezM15EcjJwAM5WuSyIibLkviGizg6UfJ69HrZhPkWpmAYv+P23ggBEWUyWTzQ2
 Wo3Ed9GUetViriv4z5SEsRePlCVgsgW+2oUts1sLoh7t4xKa8ri+WMOHCezjRtt2KPBHsp
 JnxcigoN3qfS91z+imlEGzWVJ+//bioqgI3ZJKFQ1BNdOb6oi4MxJjJ0vK/ufgvM1oTFcM
 jtjAd9gCyp2+GVpDIVKZFjQPcKGmT8bfVgP+L/sdQP7zsuXzgbQKVpX0+PTUng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eoA99bFW
Subject: Re: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: bump version to
 0.9.13
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



On 10/05/2025 01:08, Doug Kehn wrote:
> Signed-off-by: Doug Kehn <rdkehn@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/nss-pam-ldapd/nss-pam-ldapd.hash | 6 +++---
>   package/nss-pam-ldapd/nss-pam-ldapd.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
> index 3286f127dc..868c737ab3 100644
> --- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
> +++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
> @@ -1,5 +1,5 @@
> -# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.12.tar.gz.md5
> -md5  cc30ee0ab91d6c94b7a343ae09b5dc69  nss-pam-ldapd-0.9.12.tar.gz
> +# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.13.tar.gz.md5
> +md5  f6fbb61e537029804c401741ecb76224  nss-pam-ldapd-0.9.13.tar.gz
>   # Locally computed:
> -sha256  c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14  nss-pam-ldapd-0.9.12.tar.gz
> +sha256  e01784e17cb533bb66bd0601e205e785263445c3c2df7a6f90232ab4131c716d  nss-pam-ldapd-0.9.13.tar.gz
>   sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
> index 60f6328496..92f9ef079e 100644
> --- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
> +++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NSS_PAM_LDAPD_VERSION = 0.9.12
> +NSS_PAM_LDAPD_VERSION = 0.9.13
>   NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
>   NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
>   NSS_PAM_LDAPD_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

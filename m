Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1C7C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 15:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E19FA40A80;
	Sun,  3 Mar 2024 15:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPjXLQwExyr2; Sun,  3 Mar 2024 15:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9570240ADB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9570240ADB;
	Sun,  3 Mar 2024 15:50:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FEA51BF293
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 15:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D5CC81EE7
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 15:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoLZr9A2ISJa for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 15:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E14481EE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E14481EE6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E14481EE6
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 15:50:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6D0F76013F;
 Sun,  3 Mar 2024 16:50:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33904])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Mar 2024 16:50:40 +0100
MIME-Version: 1.0
Date: Sun, 03 Mar 2024 16:50:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
In-Reply-To: <20240303151913.286560-1-gilles.talis@gmail.com>
References: <20240303151913.286560-1-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <5450e445f2e7bd80eb216c7e846cd108@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709481041;
 bh=T8I5pih90ROUOwiDx8y/5WIrjsliNxzhhKzvzanA3b0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q5+5zZsAA7uAAJu0B3AU5mN+AjqtfHMr9Miuv1gRrP3hIVzFJLa+KmqpzxDBpqYBN
 2V3sFr5Ar0raBS1rtqrGDQe0kbzrnCF8GUZTz+vcuklFXHoSVj4o17vdOEHRskFzfT
 vdO4A+Tvt1ZOpQcEbdH/P88rBYMDRxwLwtME2+7Wu6+XWdWeAwtwuqehVbmCWB/iOd
 HRYWslkAbkbKdRJlaBj6ZNcjLQgbSMkIkHXt4Z7iDD8Z9lImmLXWK7AbWDwmdBDD0H
 fusmb7/w01cMGnubB4D4gSyB1J22xUJXBhT4DU0BtJ+1VvtYDGiBpZoFkrnkiKNauC
 /XDPh0pDZFkwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q5+5zZsA
Subject: Re: [Buildroot] [PATCH v2] package/iozone: bump to version 3.506
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Gilles, All,

Thanks for the updates!

On 03/03/2024 16:19, Gilles Talis wrote:
> - Upstream archive moved back to tar from tgz
> - For change log, see end of file:
> https://www.iozone.org/src/current/Changes.txt
> 

Reviewed-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> Changes v1->v2 (review from Julien Olivain):
> - Added license information (file and hash)
> - Updated commit log with archive format and change log
> ---
>  package/iozone/iozone.hash | 3 ++-
>  package/iozone/iozone.mk   | 7 +++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
> index 9ecf1d1af8..936ab5a646 100644
> --- a/package/iozone/iozone.hash
> +++ b/package/iozone/iozone.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
> -sha256  
> 5a52f5017e022e737f5b55f320cc6ada0f2a8c831a5f996cce2a44e03e91c038  
> iozone3_493.tgz
> +sha256  
> 114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7  
> iozone3_506.tar
> +sha256  
> bff7909fd698708d15613a4fb977a193cff98f44ef170c2dc1dd502974df75b2  
> docs/License.txt
> diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
> index 2df4a2aa84..b1b29d1098 100644
> --- a/package/iozone/iozone.mk
> +++ b/package/iozone/iozone.mk
> @@ -4,12 +4,11 @@
>  #
>  
> ################################################################################
> 
> -IOZONE_VERSION = 3.493
> -IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
> +IOZONE_VERSION = 3.506
> +IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
>  IOZONE_SITE = http://www.iozone.org/src/current
>  IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
> -# IOzone license details can be found at:
> -# http://www.iozone.org/docs/Iozone_License.txt
> +IOZONE_LICENSE_FILES = docs/License.txt
> 
>  # AIO support not available on uClibc, use the linux (non-aio) target.
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> --
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

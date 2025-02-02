Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C83C02190
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 05:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6313560A92;
	Sun,  2 Feb 2025 05:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyCbzOCJyAtF; Sun,  2 Feb 2025 05:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A1C060A56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A1C060A56;
	Sun,  2 Feb 2025 05:38:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23D4A185
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 05:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0749060A56
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 05:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwTzAwduREzl for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 05:38:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72A306078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A306078F
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72A306078F
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 05:38:36 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 8CE14440A00;
 Sun,  2 Feb 2025 07:33:22 +0200 (IST)
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250202002102.44367-1-nemaakhilesh@gmail.com> (Akhilesh Nema's
 message of "Sat, 1 Feb 2025 16:21:02 -0800")
References: <20250202002102.44367-1-nemaakhilesh@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Sun, 02 Feb 2025 07:38:31 +0200
Message-ID: <8734gw29ew.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1738474402;
 bh=/3SVdv2HSZzgHcZASeBanE9HqWgJGSnG8Gi9XlOsJVY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NQvoV6V2iAOHGaZNemNw5hpbrNSAmzOUS/i+DzjA7wOFinWhMrrlaNSewuEiG/jvY
 IztJPSQVE+Y2SuZLXHWLkxoQdio8YFKzY8/tDmX5lki/J4OsRyDYdbJDy4V+WbJtXD
 ZlFtx7jurXQB1oYF39ikMTnHMIgnNyBehWmngOTXOx7g+x9RdRx+CoVehKmDgq7op7
 0Garc56CdEUhafN6fhV+J/ZoNWd+L8ZtLdPbZOaZZb8oMPgLhlGBtmZZ1lorjoj3ob
 b8lKjCPzF04ZUiSKIgJLjJBLqeHLqF0AA7lo2xZYPH24kS7OkofqY2BeeUIoCuvzIK
 M/kZ/+UQWs5kA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=NQvoV6V2
Subject: Re: [Buildroot] [PATCH 1/1] package/socat: security bump to version
 1.8.0.2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Akhilesh,

On Sat, Feb 01 2025, Akhilesh Nema wrote:
> It fixes an arbitrary file overwrite vulnerability in the readline.sh.
> (CVE-2024-54661)

Thanks for the patch.

Note that technically Buildroot is not vulnerable since we do not
install readline.sh. But this update to good to have anyway.

baruch

> see - http://www.dest-unreach.org/socat/contrib/socat-secadv9.html
>
> README hash changed due to version update.
>
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/socat/socat.hash | 6 +++---
>  package/socat/socat.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/socat/socat.hash b/package/socat/socat.hash
> index 70c6e6a8f1..136dce4a71 100644
> --- a/package/socat/socat.hash
> +++ b/package/socat/socat.hash
> @@ -1,8 +1,8 @@
>  # From http://www.dest-unreach.org/socat/download.md5sum
> -md5  e53a6e8e8594ac87476fe4ae361bbcd1  socat-1.8.0.1.tar.bz2
> +md5  7272fe53d51c63ca0e08e0339681803a  socat-1.8.0.2.tar.bz2
>  # From http://www.dest-unreach.org/socat/download.sha256sum
> -sha256  6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81  socat-1.8.0.1.tar.bz2
> +sha256  adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625  socat-1.8.0.2.tar.bz2
>  # Locally calculated
> -sha256  6c07bae42bf0a919c9dd6583f76cc9020a472652dcdad3e84923074a1f412d75  README
> +sha256  a18cf021c6380e8ef212c7a95460aff2d96fe9e2146bb09058651bc3b86f4d43  README
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index 84d9cd3cf8..aa9a94aec4 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SOCAT_VERSION = 1.8.0.1
> +SOCAT_VERSION = 1.8.0.2
>  SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>  SOCAT_SITE = http://www.dest-unreach.org/socat/download
>  SOCAT_LICENSE = GPL-2.0 with OpenSSL exception

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

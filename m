Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D80CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77B240240;
	Sun,  9 Jan 2022 22:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfB4dc6AjgXY; Sun,  9 Jan 2022 22:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B30640239;
	Sun,  9 Jan 2022 22:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3B631BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFB364010E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PK1NJUfQZL2k for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97321400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r10so15756621wrc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DcoiQC5Y0gJmaERS2J4OIVKxpvJ0Ykyu8myfKyVwylQ=;
 b=GXz4JY+DY0lDUymagtbtZE8LS4nzEX5b4/cvsMJ+MipbBa7Wy2MLVGrmTutDnK7FOc
 scnGBtNkkVzkWsblBv/l/Tl5KSdvD5VCwyPpMeCwhb7oNqZXWCih4OcxdcPwZ9ab4l1S
 jQaAm7wRSTqvTqCCu9nVbQvo9D+FgUnGluwptqUUjIEeLkVOYjYRgv+AbPGEFGED4Dzr
 CH2oTQUYXSFC7/bI6JYvIFGMBthVAZI7c3d/nwPzANgrPYV4SJD4zWFD0hmdP++Qb4Ow
 4Ch3/1tonSDU1oO97aexrBSKOLPpygdbQfOnn6l3TP4j1J4ojgjcbjYWRkAdOUJOC7xA
 8wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DcoiQC5Y0gJmaERS2J4OIVKxpvJ0Ykyu8myfKyVwylQ=;
 b=gU+bsaeNVeQUfjyfTUUcqaAb/d8UfI17X9/XANH/pkNfrcu3Nk+W8DUnoYjq83dU+V
 4ut3MjipUkgh8fnYS0i+kRzLKYeXTsR0YF9bqrvwB3xk6tBMPhqxNefR7bfivabgZaOh
 v0H1DgeFMR7z0cxsVE+9b0Fmv09yebAsY+BOmgVU0QcDxJm2a3mWxd2cuX3K+625rJql
 xa5NLyZToH8fpeCnWW26EpdWrZZ3WamucD7PPyQbSFU/t7Id76C8a6syU7+F9Bxp9B/f
 3QFCQ2iv8UyDEIa/6BG53GKKA+nR34I7sZXA9iBfOAsPDQqlj9r/1VtGazH1Kcc5LmJE
 FUSQ==
X-Gm-Message-State: AOAM531j9l6vxbOtokAG1eBipvThExu3pdY29Tk1a/e2BKWmyL75c65P
 +bO6Xd8ea6UFwGKjUkZsscigYOwa3EMO0LYT
X-Google-Smtp-Source: ABdhPJycxdeUp7Njiy7QHeYm5LDbBQB6SLc56LHEiPojv/2NZuiaAFur3zh+L0RlHzaehww6eGKlKw==
X-Received: by 2002:a5d:4087:: with SMTP id o7mr525561wrp.189.1641768582942;
 Sun, 09 Jan 2022 14:49:42 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id j3sm5004314wrt.14.2022.01.09.14.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 14:49:42 -0800 (PST)
Message-ID: <2c1b9114-6723-d670-3031-2345735d2b58@mind.be>
Date: Sun, 9 Jan 2022 23:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220109112337.294418-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109112337.294418-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix build on
 kernel < 5.10
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 12:23, Fabrice Fontaine wrote:
> zoned depends on kernel >= 5.10:
> https://github.com/kdave/btrfs-progs/commit/d4b4baf312ff083fb1e85de92167ea3e968c684c
> 
> Fix the following build failure raised since bump to version 5.15.1 in
> commit 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359:
> 
> checking linux/blkzoned.h usability... yes
> checking linux/blkzoned.h presence... yes
> checking for linux/blkzoned.h... yes
> checking for struct blk_zone.capacity... no
> checking for BLKGETZONESZ defined in linux/blkzoned.h... yes
> configure: error: linux/blkzoned.h does not provide blk_zone.capacity
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/381c7e8b4bfa624c3eca3ce072cfa412aba57f84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/btrfs-progs/btrfs-progs.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index b010a0e0be..54922df839 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -44,6 +44,12 @@ else
>   BTRFS_PROGS_CONF_OPTS += --disable-libudev
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10),y)
> +BTRFS_PROGS_CONF_OPTS += --enable-zoned
> +else
> +BTRFS_PROGS_CONF_OPTS += --disable-zoned
> +endif
> +
>   HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
>   HOST_BTRFS_PROGS_CONF_OPTS = \
>   	--disable-backtrace \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

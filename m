Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7939AC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 15:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E47F240ADF;
	Sat, 19 Sep 2026 15:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sO2Qtl4v96mo; Sat, 19 Sep 2026 15:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E12A240AAD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789832520;
	b=Z9v/Rg4Rj9HSZW/2Lytj734GBr7ZJtAPdJAj08zMfh2OiMg6KZZeQn68JlrtesW/2Kqp
	 mCwQSL9DK5DaJV2bo2+rnpl866k/8VUqGoZ62JMUHG4j1KG7v74WTyxNWoxLi0tjUa7Uz
	 J6EBFqBHc53Es+5NmrNZ2mdDDiZ8NN3EzhMAW4mbjm1NaobXBmgmuF+PuwVoF30W6Y1tc
	 iAD0emWsaT9TntfjnR/OAGQBvj1i/xf0iXg+qGH1j1EN9v/1lR6vSMGJYr65XG0h+Yw2y
	 s1V0PUpdt1i+DZ2nRhomeoccZr7n4soFgNgmKnyrBy8KfwcgNGuGyWCE1CcIBpu36gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789832520;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3mIjdyurRvR2tfgV/AEfSS3xBtJwmtQ+StG+FE8fC9M=;
	b=pawUgBmSUvRRqRfg1A++lOaYnRJMPrJAo+BI6qBzc+ISoFt4/KEVl+SF2WEy+QaGy8au
	 R0Ds8bM3bh+UHs5JcFO7VVb0RozmqigPBxhB8GivhdE0BzVt9YfBoI80gX4ahMvKac46T
	 YsA1lAnaIysjl1HYH+gWAlgk+wlXdAGIHZfZp6xWrM6Dnrkikg82TA6GLsssmskO0H4Xw
	 5RKLPl+KZxZm47mzTc4C6o0GQCx5IPVWCwJk6beQAQ7vPnSdU4mHJEwQ4avvmKVHxxS4h
	 V24yKU1foYtCFrKsdLIT7LizOS8abX9qhQfMlY1pqON4CnNV5INwEVYLHdB7gq3xm7w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789832520;
	bh=3mIjdyurRvR2tfgV/AEfSS3xBtJwmtQ+StG+FE8fC9M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rmTC9hofXPHYOfp85QHLHAFV8u3I6JPqJbNoXgT+gXYKXdfXYSLrrCS4Pch5moKT5
	 +odgUWIsXFgZSiYiqCZZkPyb/4c+vEhyzX3A/N4Y9V2F1UkuekBZNSIvlj6l5MdfQK
	 Lt4Wy/8Iw1Lt25p6v/MXzOd5qGMxj/Ii3mtLE9d9h2+CojzZi3kna8tHyRO5kfy+I8
	 lj1fA0QqQKBoJb3ttfvPYkb/V6wWz0H072Tcgcm4zbnRLX3RpTneZBS3k3XsyxzH8f
	 lsNEkJi2F1T23xQvffhZABo9zHQQsxu5YBf3toMtj7mvt3ufiwQXB4yKsa34XsoIyz
	 DtuNK84CHRT9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E12A240AAD;
	Sat, 19 Sep 2026 15:41:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7446E362
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 717DA6066E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGP973xZ5e0x for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 15:41:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 306B560666
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789832517;
 b=CVlQpCl/c/MkxMte8jtLDAHmWOhRTTELi7G7hwB5BuYtgd7WZpnMMJpSwwWGKRwm9tiv
 K71zLZ4APGg245WxwkKc57GY47V85V/MZ4MHbbg2U6e3LrJDJNXSQktOlJvkhKBiadtU3
 OojVXfQXraa6b/ep0PUEzjIUBSrga9WDCodnPe7TQBrorvWDuPQWZG3ldqf28+g3mg9Zp
 FwK40W8fW+MJsrS+iRdhAi7e+i8VkCDxk9VvUyYTHnr7EGwGprPs1A96keVDu29WCGUcJ
 uemWeBPkvMj0Z8LmuZDFHCuRSW51u2roAqJ1dyFVNVvuMbrtcwx8aETSTJBJrYeAUvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789832517;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=TvNwYjW+hHRc4h3iQgGBF23/K3PK7+6hKUXfVUJh/ZU=;
 b=GAICt1j+aw6WQ7MZuEWm2YKEgln3+FMxY5JoT2gT82f6Zp0Kf8orqiIjXVKohUcU23eZ
 c0pySGSfxSXNQIFAGLdPDDoFNBZGnMEuRitSgAYRq/ySIl7ZnluITD87qufhWl2oGnj+1
 DnvD5AJumXfd1GwCD6mZaVwxl+QD7If8MUWruG2fg3UwnLwpmIfbjtzd7EmBrfrnyoz/I
 ZnRSdOhRoIc1ZuDJFfZNjNLWZy/weVE2/l5gf7n/5vB9RsR4/4oqL6J5xiO8N7bv/il03
 NHGrUuBBDtoPv0F+s3pmlVwzjeTD3MaEV91DrzHo/edBhw3IIYdPvolYx7ynldjgWOA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WtJymQL2; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 306B560666
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:41:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CED442003DD;
 Sat, 19 Sep 2026 17:41:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Sep 2026 17:41:52 +0200
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 17:41:52 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260916110912.265693-2-fiona.klute@gmx.de>
References: <20260916110912.265693-1-fiona.klute@gmx.de>
 <20260916110912.265693-2-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <998ccddb36c081ac7f6850a3cb4ad084@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 2/3] fs/squashfs: add option to build
 verity tree
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

Hi Fiona,

On 16/09/2026 13:09, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * add BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS
> 
>  fs/squashfs/Config.in | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index cb2f5ec969..9773f5af20 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -121,4 +121,27 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
>  	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
>  	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
> 
> +config BR2_TARGET_ROOTFS_SQUASHFS_VERITY
> +	bool "create verity hash data for root filesystem"
> +	select BR2_PACKAGE_HOST_CRYPTSETUP
> +	help
> +	  Create verity hash tree for the root filesystem. This allows
> +	  setting up a dm-verity device for the root filesystem, to
> +	  ensure data integrity. The root hash must be provided from a
> +	  trusted source, or with a kernel-verifiable signature.
> +
> +	  The verity hash image will be called rootfs.squashfs.verity,
> +	  with the root hash in rootfs.squashfs.verity.root-hash.
> +
> +if BR2_TARGET_ROOTFS_SQUASHFS_VERITY
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS

This new _EXTRA_ARGS is generating an error with our
"utils/check-symbols" checker:

fs/squashfs/Config.in:138: BR2_TARGET_ROOTFS_SQUASHFS_VERITY_EXTRA_ARGS 
defined but not referenced

It's probably due to the way this config is used in fs/common.mk as
$(BR2_TARGET_ROOTFS_$(2)_VERITY_EXTRA_ARGS).

Improving the check-symbol seems complex, as it would need to evaluate
completely the Makefiles.

Do you think it is possible to rewrite it slightly differently so it
passes the check-symbols script?

> +	string "Additional arguments for veritysetup"
> +	help
> +	  Additional arguments for the "veritysetup format" call. Use
> +	  this if you want to set options, e.g. the hash algorithm,
> +	  instead of using defaults.
> +
> +endif # BR2_TARGET_ROOTFS_SQUASHFS_VERITY
> +
>  endif
> --
> 2.55.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

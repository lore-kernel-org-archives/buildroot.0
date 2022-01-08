Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885A9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45CBC6072A;
	Sat,  8 Jan 2022 15:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tx5ScDwS5YcE; Sat,  8 Jan 2022 15:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB14606C0;
	Sat,  8 Jan 2022 15:14:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBBB71BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C639D40979
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhsUs0TsiJPO for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:14:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 971FF40897
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:14:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s1so17200089wra.6
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=0q32PNEouK8NhCI37+YCrsuEEBdVLLseszDlUgI4aSg=;
 b=Z5bASowr2m6yrJBrdWmPgXHuQKMHUac1khTsEECb/O+ZJYprdDQzycdDXRa1/EE7qc
 wrl8xFjpqp3ocgRBRelyxcoDqbqT3+H28pQQobaM/o4ZdpdUo3be9lSZ7Pl/hdszbn5G
 5w05jEBSJVMpEhpkK5IPCL+J5iJm+R3kkRZiJABXInnEAdghsNzpiIpVJA1YzIPqqgxl
 vrcjveJKPpvk7tKndSq2LaZnN35wtMbge1z1XSOQhuxVpB1pIfNc97GeGEjD4VcAFqVN
 TtFu+QVNGtXof8KacawZNMoyQuZ50Ocrdux/vhyPJwTwbo9gCrZtk7BiCoI8mQjLuNQP
 l1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0q32PNEouK8NhCI37+YCrsuEEBdVLLseszDlUgI4aSg=;
 b=GdB9sNEYB+VSD5aukmcflCVrg9zpBZ0MR8uSdvPCbyPikWVA9PyCniQgXG3+HtXwhx
 9Oc/ovPuDDvh3lP4KvQTsztIMMuuI+s/KZH+B2kf53e3haS0cLG4elDwdgZlnj0Nsanp
 pXAv6bHYufycyQ0E21g/UO0bBLw9cmNF49LNwuD6PNkbDNwSx3FRF2tkwH+YJhXza/j/
 eJLZRQ6ZSPy6tp7s0lAhHrSamDNA/4mbKICEdXh+GNK3MHAYwnERcRatNjgFPXjr3wK7
 clSQ+mHhoWusHAmuNc+HIvEGM/xYO1UXcPUrQg7eLoXhoCWZnuMxzxay4E+s5MTwiEWa
 fZgQ==
X-Gm-Message-State: AOAM532S5JIknAqYD6LvIAl6N77b9oJFnTxwUSb+b9I2Ar0tfSl9kcXw
 Ik5JOIXFY5mxLsMbc1MAvqyUUQ==
X-Google-Smtp-Source: ABdhPJzQ3lNVwTfSu/lsGxtzvQ7lXtGuc3vvOtq6net1yMSHmGm5yJSpwK/YZIb01AjeFQ+9X/8YUQ==
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr53707090wrg.348.1641654873922; 
 Sat, 08 Jan 2022 07:14:33 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id k19sm1770782wmo.29.2022.01.08.07.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:14:33 -0800 (PST)
Message-ID: <9e32dc06-12ef-02e9-619a-aaf2bbf4acc5@mind.be>
Date: Sat, 8 Jan 2022 16:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220108095451.1078507-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108095451.1078507-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libldns: bump version to 1.8.1
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



On 08/01/2022 10:54, Bernd Kuhls wrote:
> Reformatted hashes.
> 
> Changelog: https://github.com/NLnetLabs/ldns/blob/develop/Changelog
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libldns/libldns.hash | 10 +++++-----
>   package/libldns/libldns.mk   |  2 +-
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
> index c8fb39d478..cab8b7dbdf 100644
> --- a/package/libldns/libldns.hash
> +++ b/package/libldns/libldns.hash
> @@ -1,7 +1,7 @@
> -# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha1
> -sha1 d075a08972c0f573101fb4a6250471daaa53cb3e  ldns-1.7.1.tar.gz
> -# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.7.1.tar.gz.sha256
> -sha256 8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229  ldns-1.7.1.tar.gz
> +# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha1
> +sha1  df19a0404a608821b571525214a18988bc88bb46  ldns-1.8.1.tar.gz
> +# From http://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.1.tar.gz.sha256
> +sha256  958229abce4d3aaa19a75c0d127666564b17216902186e952ca4aef47c6d7fa3  ldns-1.8.1.tar.gz
>   
>   # Hash for license file:
> -sha256 9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
> +sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
> diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
> index 9c248bbc19..7deca978da 100644
> --- a/package/libldns/libldns.mk
> +++ b/package/libldns/libldns.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBLDNS_VERSION = 1.7.1
> +LIBLDNS_VERSION = 1.8.1
>   LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
>   LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
>   LIBLDNS_LICENSE = BSD-3-Clause
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

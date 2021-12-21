Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69728C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B214540A77;
	Tue, 21 Dec 2021 21:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LX4b6X332AK; Tue, 21 Dec 2021 21:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3E6B4054E;
	Tue, 21 Dec 2021 21:45:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CCB51BF40B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C6C44156D
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38ogxt_wg5gy for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 21:44:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2427641549
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 21:44:58 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o6so542195edc.4
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 13:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ehrg8SgNXAvt7h/FSY3SULLh8wAOuPfgcmCNpXRbffA=;
 b=AfLRwM2TxykT/eF5H9R5ql/KqJ4GIng6qkjsCOy9ec2iLyH0+SW95kPdfEel7/SZB2
 BmDWJT/Y/sGHaAtIIFnT5x5z8P8uFCGFsmyaV/z8pSItdC8jOVv90IJP+QWa0xBANdGX
 KZ/WpBUInyIO20vYaKvCADr30nNtf3piZihmCziABuZi75aUb+Zx9PJ3K3LkclCLVS/l
 OCiCi0oYBKNFgaxMADKyH3/qF16D/GvVLaAW3VAJM5q4Q0PjYbFcYsJ7OgZ0v8erRnCb
 xcNo66xJWHDi4mW76LJ7DuaddjZsdV+5XkB1aCNhUKNTU3+weLHKtPWCM+yLDPhgSPYd
 Vuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ehrg8SgNXAvt7h/FSY3SULLh8wAOuPfgcmCNpXRbffA=;
 b=C8T2RAQFSTFQ681PFhWGAoLdwL5CoFCywmMyxaw0Xk+hhmBgM1+f9m1q9x3/4LpEky
 5QmC2SiJE9cd98Mr/VrkeQi4jtaZ14LWi6eelu2whcG1itjNS6dPgyPEKwnDQSMVXq3p
 2xo7froJZarYgpBzqCemksk6C/pNNb9RxuaVq2QPvhx0whzRvHCuhuSf66fJMYyWsiZv
 fTpUiMvgsQVZo0xmNpu+vESqG4ZxpEKTch3zB+yaNaZ603XiaSCRUYu7FrEk/gZIar78
 1TqVUghZiGyU/kR5Y2wSH6rF/WJFloz0UV8U2uvp1Iom/WASWc7eX0GdmPYzVuBlCAX4
 wj/A==
X-Gm-Message-State: AOAM533GR4/VrEncpfyqcvsdrG7DVqQgDk9TuTXeznoKN3CwO5gzevI6
 LdMHnZeUX4BdyCeNr5kt1prnlg==
X-Google-Smtp-Source: ABdhPJwN/I6n/0w8nORgmO/o/tdhgbXuh0Gai8FXJ7RiAoVMekzyVcyGOSvHVEdRlxisEhoxuprp7w==
X-Received: by 2002:a05:6402:2686:: with SMTP id
 w6mr204235edd.79.1640123097059; 
 Tue, 21 Dec 2021 13:44:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w10sm13416edt.16.2021.12.21.13.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 13:44:56 -0800 (PST)
Message-ID: <fd7b51bd-5e63-ea80-1ea5-18c539c3a9c8@mind.be>
Date: Tue, 21 Dec 2021 22:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20211221145428.43829-1-flaniel@linux.microsoft.com>
 <20211221145428.43829-2-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211221145428.43829-2-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] package/pahole: new host package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Francis,

  Some relatively minor nitpicks.

On 21/12/2021 15:54, Francis Laniel wrote:
> pahole is a tool used to show data structure embedded in debugging information
> formats like DWARF.
> It is notably needed by the Linux kernel to generate BPF Type Format (BTF)
> information used by Compile Once - Run Everywhere (CO-RE) BPF tools.
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>   DEVELOPERS                    |  3 +++
>   package/Config.in.host        |  1 +
>   package/pahole/Config.in.host |  6 ++++++
>   package/pahole/pahole.hash    |  2 ++
>   package/pahole/pahole.mk      | 20 ++++++++++++++++++++
>   5 files changed, 32 insertions(+)
>   create mode 100644 package/pahole/Config.in.host
>   create mode 100644 package/pahole/pahole.hash
>   create mode 100644 package/pahole/pahole.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 64db6c51d0..70df957415 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -939,6 +939,9 @@ N:	Floris Bos <bos@je-eigen-domein.nl>
>   F:	package/ipmitool/
>   F:	package/odhcploc/
>   
> +N:	Francis Laniel <flaniel@linux.microsoft.com>
> +F:	package/pahole/
> +
>   N:	Francisco Gonzalez <gzmorell@gmail.com>
>   F:	package/ser2net/
>   
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 6e5a5c5fc5..ae512c5643 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -60,6 +60,7 @@ menu "Host utilities"
>   	source "package/omap-u-boot-utils/Config.in.host"
>   	source "package/openocd/Config.in.host"
>   	source "package/opkg-utils/Config.in.host"
> +	source "package/pahole/Config.in.host"
>   	source "package/parted/Config.in.host"
>   	source "package/patchelf/Config.in.host"
>   	source "package/pigz/Config.in.host"
> diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.host
> new file mode 100644
> index 0000000000..e427629632
> --- /dev/null
> +++ b/package/pahole/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_PAHOLE
> +	bool "host pahole"
> +	help
> +	  Pahole and other DWARF utils.
> +
> +	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
> diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
> new file mode 100644
> index 0000000000..2573fde8c9
> --- /dev/null
> +++ b/package/pahole/pahole.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 76b7eaf5747dbb7250a1a50185136d4639e0d70aa11c5d7c68139c0c8ca9be80 pahole-v1.22-br1.tar.gz

  You should also add COPYING to the hash file.

> diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
> new file mode 100644
> index 0000000000..1f69f5391e
> --- /dev/null
> +++ b/package/pahole/pahole.mk
> @@ -0,0 +1,20 @@
> +########################################################################
> +#
> +# pahole
> +#
> +########################################################################
> +
> +PAHOLE_VERSION = v1.22

  There's a v1.23 now.

> +PAHOLE_SITE = git://git.kernel.org/pub/scm/devel/pahole/pahole.git

  kernel.org also has a tarball download:

PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot

(cfr. e.g. f2fs-tools).

  That also allows you to set VERSION without the v, which we prefer because 
that way it can be used in CPE info and in release-monitoring.

> +PAHOLE_SITE_METHOD = git
> +# pahole contains git submodule and relies on them to be built.

  Darn, so much for the tarball download :-(

  This is something we'd typically put in a comment or the commit message so 
later down the line people remember why we didn't choose a tarball download.

  However, we normally prefer to unbundle dependencies, and we already have 
libbpf (though not for the host at the moment). For host packages, the 
unbundling isn't terribly important, so if it's difficult, don't bother. But if 
it's easy to use an external bpf rather than the submodule, then please do that.

> +# We need to add this option to fetch the submodules before creating the
> +# archive.

  This comment is redundant, the first sentence was enough.

> +PAHOLE_GIT_SUBMODULES = YES
> +# Better to build it statically so we do not rely on the host having
> +# corresponding libraries.

  This doesn't make a whole lot of sense to me... We're building it, so the 
libraries are there, otherwise it would fail to build, right? Again, not 
terribly important for a host package, but we prefer to do special stuff if not 
needed.

> +HOST_PAHOLE_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF -D__LIB=lib

  Why is the __LIB=lib needed? What does it do? It's enough to mention this in 
the commit message.

  Regards,
  Arnout


> +PAHOLE_LICENSE = GPL-2.0
> +PAHOLE_LICENSE_FILES = COPYING
> +
> +$(eval $(host-cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

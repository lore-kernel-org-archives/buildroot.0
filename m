Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38973C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E019540306;
	Sun,  9 Jan 2022 14:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmg6ZLnLyusV; Sun,  9 Jan 2022 14:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 272D140305;
	Sun,  9 Jan 2022 14:50:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3F11BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D4A360B24
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeTJCB20jJn1 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:49:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50B71606C0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:49:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k30so4295679wrd.9
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 06:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cMlUdIkGlmxE1SHyhs5IRhpWSLOFYRoO34bxbyZcoNc=;
 b=EeZf3x3HG7aSC1uy8dyh7htfU+PqDppFmsa2xLkwjgX61t2shZ3dAIfuGW9HED2nha
 /WR246au3cBvDpcm21FEucazU+PafasKiPFzBljAgl4n+etidqhA36o9qr7axYOdZDLU
 T99uoCL1IOFZHwNFLscM4EcZ2MLPQE7mfZa5MR9H1ZxZQqTWaRo4l75L9eIGHwzn0Ilv
 C2gDpGPBfg7w8ku8sK2wgLDP88igUjmQzTi4hZWzwVsrLnLuFWD7f2VTdEqbGC1pJoUD
 moPbosc5CFPa38bd5FuVwES1HAzPm59Y+BhVmiEPLOQfGXiDaZq8JO85Xbo9YU/AC9kr
 eeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cMlUdIkGlmxE1SHyhs5IRhpWSLOFYRoO34bxbyZcoNc=;
 b=8NW71uc/5k1o7maCD+JeLqoNsRSn0R+PQhPbrWy08aYUHmgcx8VPyDzC0R1mLGKQsf
 MXmme7APQ5bsQ+6qMYPSdJpOYFTl4NHnEJR12l/HCYEyHlr3a7hKe7VglwAiDCWaq7ku
 lFaK5iXE8f0fU6oyDgGxqwIxyjxWEh4/3H7QRxT3NDYUv97ynYi3rSwhL98xkHUWWUJl
 CjuEYZI7XPCNibCLvyaATOesrd2v520Iak/oJCRhuywXdAtle9C9VREHpdaqghuCBw5K
 5UzlT43nYxpgpjwe+cjNw1bAYK3NXcnW4gQ7Xc4XGvaUq/xKjHSeYyZeRzJ/7ouiC6jF
 wkzw==
X-Gm-Message-State: AOAM533iBpP0+WTaoMCx3phbcTVD9/7X++4gAemrxAgqCtJeZFuTy31J
 7+76Sn1GG9Cy2UmoxY6CRNs9bA==
X-Google-Smtp-Source: ABdhPJz8c+dXKP+HglIz5z030512Pg6WgjTm4p8Ns6e0X8Ec8iJ2lwW3a9APOLKcFSVKXsl45bDWsQ==
X-Received: by 2002:adf:cd09:: with SMTP id w9mr461702wrm.395.1641739775626;
 Sun, 09 Jan 2022 06:49:35 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id f6sm4799582wmq.6.2022.01.09.06.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 06:49:35 -0800 (PST)
Message-ID: <41020492-1207-aaae-4a38-03f096c5b0e1@mind.be>
Date: Sun, 9 Jan 2022 15:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220109110736.3963-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109110736.3963-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v3] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: jeremy.rosen@smile.fr, yann.morin.1998@free.fr, maxime.hadjinlian@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 12:07, Norbert Lange wrote:
> Especially for read-only filesystems it is helpfull to
> pre-create all folders for non-volatile paths.
> 
> This needs to run under fakeroot to allow setting
> uids/gids/perms for the target fs.
> 
> systemd-tmpfilesd supports specifiers and target rootfs,
> but some specifiers resolve to information from the host,
> it is necessary to specially handle (skip) entries that
> contain problematic specifiers.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v1->v2
> *   add a script to skip/handle specifiers that might
>      otherwise take information from the host
> v2->v3
> *   adopt fakeroot_tmpfiles.sh to current systemd-tmpfilesd (v250),
>      several more specifiers are supported directly for our usecase.
> ---
>   package/systemd/fakeroot_tmpfiles.sh | 57 ++++++++++++++++++++++++++++
>   package/systemd/systemd.mk           |  9 ++++-
>   2 files changed, 64 insertions(+), 2 deletions(-)
>   create mode 100644 package/systemd/fakeroot_tmpfiles.sh
> 
> diff --git a/package/systemd/fakeroot_tmpfiles.sh b/package/systemd/fakeroot_tmpfiles.sh
> new file mode 100644
> index 0000000000..7e9b02cc0a
> --- /dev/null
> +++ b/package/systemd/fakeroot_tmpfiles.sh
> @@ -0,0 +1,57 @@
> +#!/bin/sh
> +#
> +# The systemd-tmpfiles has the ability to grab information
> +# from the filesystem (instead from the running system).
> +#
> +# However there are a few specifiers that *always* will grab
> +# information from the running system examples are %a, %b, %m, %H
> +# (Architecture, Boot UUID, Machine UUID, Hostname).
> +#
> +# See [1] for historic information.
> +#
> +# This script will (conservatively) skip tmpfiles lines that have
> +# such an specifier to prevent leaking host information.
> +#
> +# shell expansion is critical to be POSIX compliant,
> +# this script wont work with zsh in its default mode for example.
> +#
> +# The script takes several measures to handle more complex stuff
> +# like passing this correctly:
> +# f+  "/var/example" - - - - %B\n%o\n%w\n%W%%\n
> +#
> +# [1] - https://github.com/systemd/systemd/pull/16187
> +
> +[ -n "${HOST_SYSTEMD_TMPFILES-}" ] ||
> +  HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
> +
> +[ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||
> +  { echo 1>&2 "$0: need ROOTFS argument"; exit 1; }
> +
> +${HOST_SYSTEMD_TMPFILES} --no-pager --cat-config --root="$1" |
> +  sed -e '/^[[:space:]]*#/d' -e 's,^[[:space:]]*,,' -e '/^$/d' |
> +    while read -r line; do
> +      # it is allowed to use quotes around arguments,
> +      # so let the shell pack the arguments
> +      eval "set -- $line"
> +
> +      # dont output warnings for directories we dont process
> +      [ "${2#/dev}" = "${2}" ] && [ "${2#/proc}" = "${2}" ] &&
> +        [ "${2#/run}" = "${2}" ] && [ "${2#/sys}" = "${2}" ] &&
> +        [ "${2#/tmp}" = "${2}" ] && [ "${2#/mnt}" = "${2}" ] ||
> +          continue
> +
> +      # blank out all specs that are ok to use,
> +      # test if some remain. (Specs up to date with v250)
> +      if echo "$2 ${7-}" | sed -e 's,%[%BCEgGhLMosStTuUVwW],,g' | grep -v -q '%'; then
> +        # no "bad" specifiers, pass the line unmodified
> +        eval "printf '%s\n' '$line'"
> +      else
> +        # warn
> +        eval "printf 'ignored spec: %s\n' '$line' 1>&2"
> +      fi
> +    done |
> +\
> +TMPDIR= TEMP= TMP= ${HOST_SYSTEMD_TMPFILES} --create --boot --root="$1" \
> +  --exclude-prefix=/dev --exclude-prefix=/proc --exclude-prefix=/run --exclude-prefix=/sys \
> +  --exclude-prefix=/tmp --exclude-prefix=/mnt \
> +  -
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 7bf8018438..e136229c8e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -709,10 +709,15 @@ define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
>   endef
>   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
>   
> +define SYSTEMD_CREATE_TMPFILES_HOOK
> +	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
> +		/bin/sh $(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
> +endef
> +
>   define SYSTEMD_PRESET_ALL
>   	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>   endef
> -SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK SYSTEMD_PRESET_ALL
>   
>   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>   SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> @@ -783,7 +788,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	-Dvconsole=false \
>   	-Dquotacheck=false \
>   	-Dsysusers=false \
> -	-Dtmpfiles=false \
> +	-Dtmpfiles=true \
>   	-Dimportd=false \
>   	-Dhwdb=false \
>   	-Drfkill=false \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

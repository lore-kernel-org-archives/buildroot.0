Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C66C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D2A58191E;
	Sun,  9 Jan 2022 14:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGBWtIw4J1Kf; Sun,  9 Jan 2022 14:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7FB78187F;
	Sun,  9 Jan 2022 14:49:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B63F1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13B8D400FE
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DObR4OyjBFoA for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:49:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8535A400F3
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:49:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r10so14212737wrc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MlIMD5iJl+OmZZZI/eS8Nq7UMv/WP7iClIgA5J+ue48=;
 b=CUcqlCLOAtWGiVzTFHaX8yXutudjXTtsfaDXoqjr5giy9RYvN1+Z1bfokE339cU9Rs
 QYd509YmeuVTryOLcDnd+rPRNbwN1Xa3kTRcmVFs1En6fPuBesYJr76Lp7jaUFzOOGbf
 Tn87boVYZE4sxEuEY8jbmk7NwHIkdXBJoxjwpsTGPoUkpc4qB9PMS65/oyOXA8IQ1fj9
 EmOBmh5BmxZKnRegWoHjTkqV1Y/8M2o8b6YLSoilOsHQT+t5AvhqhqvOJ+dDO9p5aeRT
 HB4O4JesqKzkzd8WVtKsQbUl/muUeYWZCwVpb12QOzE1FJXBHWzFs/uYhpOO4mGnRYJz
 pJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MlIMD5iJl+OmZZZI/eS8Nq7UMv/WP7iClIgA5J+ue48=;
 b=keMF6ImVArmI2N/Zz12lZ7Atw2svBVuV99TA3tC8/hYwFdkEJg2UIJ3jn0c4SwgxCx
 xiKaGEglRFKJF1B0SIJfGo4fhiSZHV0F4NQs/3xSsKvMg7fqoABUp55Gm6iO83PlGyNs
 gUphflRIy6vIMpHNZ5P5RO1yxrATOWm+xNeQVVH3AliZp4lJsSoDR0mn6ob995W4YlRT
 OV3ATm+vNmcsmYzbhqdsHyFHxge/DImw0YZk1skmdejVt/Z9OhnRJDFaZt0mvCUhxi4W
 QZqypX0QPfCHVr2I0jmWcC/fwYUyy/kat9Fhg9a+rORWDvrhTautd73RHC0ovxW0Hjp4
 +6gA==
X-Gm-Message-State: AOAM532AlkX96VF95YirIipc0SjanQazwQeywIO4kKiWgEZZc0JtF56y
 AGxe3A0ynkrHRvZyd9tU7TLHxQ==
X-Google-Smtp-Source: ABdhPJy+fJ7zikFdBLwQW0N7JSM+0IS4v0L2e+JpAofFWNkS51uLm1yC/a/KFqFo3hDP2QpwKLfevg==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr3480784wrw.459.1641739748494; 
 Sun, 09 Jan 2022 06:49:08 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id r62sm4153867wmr.35.2022.01.09.06.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 06:49:07 -0800 (PST)
Message-ID: <b0810e1e-923c-60b0-afc1-e43120315720@mind.be>
Date: Sun, 9 Jan 2022 15:49:07 +0100
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
Cc: jeremy.rosen@smile.fr, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Norbert,

  Applied to master, thanks. I have a bunch of stylistic remarks, but it's 
nitpicky so I didn't apply them. The only thing I did is the indentation (4 
spaces in shell scripts).


On 09/01/2022 12:07, Norbert Lange wrote:
[snip]
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

  Instead of skipping, perhaps we should terminate with an error? Or would that 
mean that it never passes with current systemd?

> +#
> +# shell expansion is critical to be POSIX compliant,
> +# this script wont work with zsh in its default mode for example.

  I don't get this... If the script doesn't work with /bin/sh == zsh, maybe use 
/usr/bin/env bash instead? (We already check for bash in dependencies.sh so it's 
fine to require it.)

> +#
> +# The script takes several measures to handle more complex stuff
> +# like passing this correctly:
> +# f+  "/var/example" - - - - %B\n%o\n%w\n%W%%\n
> +#
> +# [1] - https://github.com/systemd/systemd/pull/16187

  The end of that is that Lennart merged something which does (AFAIU) part of 
what you need done. Would it be possible to rebase your changes on top of that?

> +
> +[ -n "${HOST_SYSTEMD_TMPFILES-}" ] ||
> +  HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
> +
> +[ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||

  I don't understand why you need "${1-}" and not simply "$1". In this context 
(with the quotes around it) there is no difference at all between the two, right?

  Also, I prefer

ROOTFS="$1"

and use $ROOTFS further down; IMHO that's more readable.


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

  All these excludes are already excluded above from the "directories we don't 
process" block, so maybe it can be removed?

  OTOH, if we can later get upstream to no longer have those ignored specs, we 
can remove the preprocessing and it's handy to have the exclude statements already.

  Anyway, I added a comment to the comment block in the beginning to explain why 
they're excluded:

# tmpfs directories (/tmp, /proc, ...) are skipped since they're not
# relevant for the rootfs image.

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

  Since the script has a shebang line, I remove the /bin/sh here and made it 
executable.

> +endef
> +
>   define SYSTEMD_PRESET_ALL
>   	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>   endef
> -SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK SYSTEMD_PRESET_ALL

  We normally add the hook immediately after the definition of the hook, so I 
changed that as well.


  Regards,
  Arnout

  PS There's no need to keep Maxime in Cc, he's no longer involved in Buildroot 
at all.

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

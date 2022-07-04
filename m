Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A46C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 06:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22C60403B8;
	Mon,  4 Jul 2022 06:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22C60403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THdZnt7dGmUr; Mon,  4 Jul 2022 06:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC52440112;
	Mon,  4 Jul 2022 06:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC52440112
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0673F1BF399
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 06:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D46F7409D3
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 06:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46F7409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTMuPtw6_16g for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 06:41:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3516408D7
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3516408D7
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 06:41:26 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar26.francetelecom.fr (ESMTP service) with ESMTPS id 4Lbx6D1rT4zFpX1; 
 Mon,  4 Jul 2022 08:41:24 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 08:41:21 +0200
Date: Mon, 4 Jul 2022 08:41:21 +0200
From: <yann.morin@orange.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <3810_1656916884_62C28B94_3810_456_1_20220704064121.GA2889@tl-lnx-nyma7486>
References: <20220109110736.3963-1-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109110736.3963-1-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1656916884;
 bh=x5cZRk2w5aGNLgkrU4aAoAQt2fAO4hmeKCTuoLgVKdw=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=igjYviWMWB0CfbSHKLBPxujx3cYaGnxDvuVyNGhe0xcgtG1lFonKnXMNf8fwlqIc+
 qogLH3jstnhkVp0BQ+Ls2vEwn7h1I9F88BMFaQ3J0SavQhxYOZMYMeGzozgnntc8xR
 WidayxktNNXTzs3J3IT7GvC1+m5DHtQk5o5G7qkHKKegLYpe0jm085PHioTW/ICuYu
 dNsGKbiQ82SD1VV0yo2FpLl67jF5S5Az1QYU1/vCJRkKBXBy40zWOLCkTaeWecyuRJ
 pNdSp7tCvA9Mi4vqG9PvNb+KrSqEVjpFucbwpcdWoic7rJdopo3WeAUPFUJZIKuxE0
 DEguUUwa1c3DQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=igjYviWM
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
Cc: jeremy.rosen@smile.fr, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2022-01-09 12:07 +0100, Norbert Lange spake thusly:
> Especially for read-only filesystems it is helpfull to
> pre-create all folders for non-volatile paths.

I'm revisiting this old change of yours, and I have some issues
understanding the original issue this is supposed to fix...

Indeed, for read-only filesystems, we do generate a factory for /var.
This code is guarded by a condition on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW,
so indeed, if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set, we do not
create the factory. But if it is set, then we do create the factory:

  - move /var away to /usr/share/factory/var
  - register its content as a tmpfiles.d:
    https://github.com/buildroot/buildroot/blob/master/package/skeleton-init-systemd/skeleton-init-systemd.mk#L37

  - mount a tmpfs on /var:
    https://github.com/buildroot/buildroot/blob/master/package/skeleton-init-systemd/skeleton-init-systemd.mk#L31

Now with this change of yours, /var is no longer empty in the generated
filesystem, and this is in fact useless because a tmpfs is mounted over
anyway.

I've just tried reverting this change, and my /var is still correctly
populated at boot.

What was your original issue that prompted running tmpfiles at build
time? Did you have BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW still enabled by
chance?

(Hint: I think we should just hide away read-only filesystems when
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set).

Regards,
Yann E. MORIN.

> This needs to run under fakeroot to allow setting
> uids/gids/perms for the target fs.
> 
> systemd-tmpfilesd supports specifiers and target rootfs,
> but some specifiers resolve to information from the host,
> it is necessary to specially handle (skip) entries that
> contain problematic specifiers.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1->v2
> *   add a script to skip/handle specifiers that might
>     otherwise take information from the host
> v2->v3
> *   adopt fakeroot_tmpfiles.sh to current systemd-tmpfilesd (v250),
>     several more specifiers are supported directly for our usecase.
> ---
>  package/systemd/fakeroot_tmpfiles.sh | 57 ++++++++++++++++++++++++++++
>  package/systemd/systemd.mk           |  9 ++++-
>  2 files changed, 64 insertions(+), 2 deletions(-)
>  create mode 100644 package/systemd/fakeroot_tmpfiles.sh
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
>  endef
>  SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
>  
> +define SYSTEMD_CREATE_TMPFILES_HOOK
> +	HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
> +		/bin/sh $(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
> +endef
> +
>  define SYSTEMD_PRESET_ALL
>  	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>  endef
> -SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK SYSTEMD_PRESET_ALL
>  
>  SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> @@ -783,7 +788,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>  	-Dvconsole=false \
>  	-Dquotacheck=false \
>  	-Dsysusers=false \
> -	-Dtmpfiles=false \
> +	-Dtmpfiles=true \
>  	-Dimportd=false \
>  	-Dhwdb=false \
>  	-Drfkill=false \
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

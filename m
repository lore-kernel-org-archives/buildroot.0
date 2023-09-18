Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0A0CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 06:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6251400FE;
	Mon, 18 Sep 2023 06:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6251400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ClmfFbk5h6F1; Mon, 18 Sep 2023 06:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B76BA40446;
	Mon, 18 Sep 2023 06:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76BA40446
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3DE91BF40F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888FF40952
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888FF40952
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ixhz9j5IWtI for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 06:44:05 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E5C84094C
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 06:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E5C84094C
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so11184904a12.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 23:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695019443; x=1695624243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zheyl0NsCHlkUgxISRgwpMKdHc+3EkgiwCAfgtXJF2s=;
 b=NqxKR3s343SuyordzrqLDqXDliWZoyjWCDzI14XgzoCRKRAPcXb9hv+WkGjq6KyTPD
 IbsSYYf+2oesm5sIO3PlBDyffIo9HLl+S6mUWamwd4JMftYBE321DBsiUebugv5rw/rS
 REbAnYb3rz7c29ztaSyvYQ5qzp6KR9EV6PDeyD4zzF4YNjSfaAB7s8RYbvTXQpvgMAJz
 JJfMXvknDYE1KgCCZWl9a+PRVO4K1KDVX5OXSnNAVFvAgFwVxOqxa3fD3XsKo55I6JPF
 gQG4cnZ+PZQRx5gqq9p9vaW4//CwCO/DeMDGA6N9m9QIz7tH2Kmk7FSfYAYBqZ4R29zZ
 Lx8g==
X-Gm-Message-State: AOJu0YwpAca23VKAZsrQeacA+l9EoGtpqLL1d9lGJ17bJgDawbWumrB6
 NzUGUzjVA2KPQbMQIRmTbWaZVPDSEhdCDyX21yvfkFojKMk=
X-Google-Smtp-Source: AGHT+IGtpeWGolMKrnnP7wkmL+33bvvbQFHMMfu/fJUmhpUorBzK1E1rUxyGSC4Ckr99tZ3FgG9tH7CVYMw28GQI6mI=
X-Received: by 2002:a17:907:1c1e:b0:9a5:7dec:fab9 with SMTP id
 nc30-20020a1709071c1e00b009a57decfab9mr13179577ejc.9.1695019442815; Sun, 17
 Sep 2023 23:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-5-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-5-arbab@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Sep 2023 06:43:51 +0000
Message-ID: <CACPK8Xeh+pXaLbn0KtDnozZ1foW3_Ldzb6Lp_QXaZzVWjSO+Cw@mail.gmail.com>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1695019443; x=1695624243; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zheyl0NsCHlkUgxISRgwpMKdHc+3EkgiwCAfgtXJF2s=;
 b=j5MV2KnWUrCDJ4xClDqhPjMk9F0Ed6/icxJ3aOQU5cZZqqboLl+QnQFKsmHJmeD6iw
 QtMRM4VdWPJ7owzkcs2xVcLezSRfE4c0DaXgNPXVS7fiLA+eDaidX9r0fgZJcLCcxVio
 Z0sheYi4oJ/VxfMOWvb4IhzaEPCUlmpD2DMAI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=j5MV2KnW
Subject: Re: [Buildroot] [PATCH v2 4/5] package/petitboot: enable discovery
 of software RAID devices
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
Cc: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Sept 2023 at 15:58, Reza Arbab <arbab@linux.ibm.com> wrote:
>
> Petitboot can support filesystems on software RAID arrays. If mdadm is
> selected, install the associated udev rules to assemble the device.
>
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  package/petitboot/63-md-raid-arrays.rules | 41 ++++++++++++++
>  package/petitboot/65-md-incremental.rules | 69 +++++++++++++++++++++++
>  package/petitboot/petitboot.mk            | 10 ++++
>  3 files changed, 120 insertions(+)
>  create mode 100644 package/petitboot/63-md-raid-arrays.rules
>  create mode 100644 package/petitboot/65-md-incremental.rules
>
> diff --git a/package/petitboot/63-md-raid-arrays.rules b/package/petitboot/63-md-raid-arrays.rules
> new file mode 100644
> index 000000000000..92aec36e69d4
> --- /dev/null
> +++ b/package/petitboot/63-md-raid-arrays.rules
> @@ -0,0 +1,41 @@
> +# do not edit this file, it will be overwritten on update
> +
> +SUBSYSTEM!="block", GOTO="md_end"
> +
> +# handle md arrays
> +ACTION!="add|change", GOTO="md_end"
> +KERNEL!="md*", GOTO="md_end"
> +
> +# partitions have no md/{array_state,metadata_version}, but should not
> +# for that reason be ignored.
> +ENV{DEVTYPE}=="partition", GOTO="md_ignore_state"
> +
> +# container devices have a metadata version of e.g. 'external:ddf' and
> +# never leave state 'inactive'
> +ATTR{md/metadata_version}=="external:[A-Za-z]*", ATTR{md/array_state}=="inactive", GOTO="md_ignore_state"
> +TEST!="md/array_state", ENV{SYSTEMD_READY}="0", GOTO="md_end"
> +ATTR{md/array_state}=="|clear|inactive", ENV{SYSTEMD_READY}="0", GOTO="md_end"
> +LABEL="md_ignore_state"
> +
> +IMPORT{program}="/sbin/mdadm --detail --export $devnode"
> +ENV{DEVTYPE}=="disk", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}", OPTIONS+="string_escape=replace"
> +ENV{DEVTYPE}=="disk", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}"
> +ENV{DEVTYPE}=="disk", ENV{MD_DEVNAME}=="?*", SYMLINK+="md/$env{MD_DEVNAME}"
> +ENV{DEVTYPE}=="partition", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}-part%n", OPTIONS+="string_escape=replace"
> +ENV{DEVTYPE}=="partition", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}-part%n"
> +ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[^0-9]", SYMLINK+="md/$env{MD_DEVNAME}%n"
> +ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[0-9]", SYMLINK+="md/$env{MD_DEVNAME}p%n"
> +
> +IMPORT{builtin}="blkid"
> +OPTIONS+="link_priority=100"
> +OPTIONS+="watch"
> +ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{ID_FS_UUID_ENC}=="?*", SYMLINK+="disk/by-uuid/$env{ID_FS_UUID_ENC}"
> +ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
> +
> +ENV{MD_LEVEL}=="raid[1-9]*", ENV{SYSTEMD_WANTS}+="mdmonitor.service"
> +
> +# Tell systemd to run mdmon for our container, if we need it.
> +ENV{MD_LEVEL}=="raid[1-9]*", ENV{MD_CONTAINER}=="?*", PROGRAM="/usr/bin/readlink $env{MD_CONTAINER}", ENV{MD_MON_THIS}="%c"
> +ENV{MD_MON_THIS}=="?*", PROGRAM="/usr/bin/basename $env{MD_MON_THIS}", ENV{SYSTEMD_WANTS}+="mdmon@%c.service"
> +
> +LABEL="md_end"
> diff --git a/package/petitboot/65-md-incremental.rules b/package/petitboot/65-md-incremental.rules
> new file mode 100644
> index 000000000000..153d12fe6f7e
> --- /dev/null
> +++ b/package/petitboot/65-md-incremental.rules
> @@ -0,0 +1,69 @@
> +# This file causes block devices with Linux RAID (mdadm) signatures to
> +# automatically cause mdadm to be run.
> +# See udev(8) for syntax
> +
> +# Don't process any events if anaconda is running as anaconda brings up
> +# raid devices manually
> +ENV{ANACONDA}=="?*", GOTO="md_end"
> +
> +# Also don't process disks that are slated to be a multipath device
> +ENV{DM_MULTIPATH_DEVICE_PATH}=="?*", GOTO="md_end"
> +
> +# We process add events on block devices (since they are ready as soon as
> +# they are added to the system), but we must process change events as well
> +# on any dm devices (like LUKS partitions or LVM logical volumes) and on
> +# md devices because both of these first get added, then get brought live
> +# and trigger a change event.  The reason we don't process change events
> +# on bare hard disks is because if you stop all arrays on a disk, then
> +# run fdisk on the disk to change the partitions, when fdisk exits it
> +# triggers a change event, and we want to wait until all the fdisks on
> +# all member disks are done before we do anything.  Unfortunately, we have
> +# no way of knowing that, so we just have to let those arrays be brought
> +# up manually after fdisk has been run on all of the disks.
> +
> +# First, process all add events (md and dm devices will not really do
> +# anything here, just regular disks, and this also won't get any imsm
> +# array members either)
> +SUBSYSTEM=="block", ACTION=="add|change", ENV{ID_FS_TYPE}=="linux_raid_member", \
> +       RUN+="/sbin/mdadm -I --export $env{DEVNAME}"
> +
> +# Next, check to make sure the BIOS raid stuff wasn't turned off via cmdline
> +IMPORT{cmdline}="noiswmd"
> +IMPORT{cmdline}="nodmraid"
> +ENV{noiswmd}=="?*", GOTO="md_imsm_inc_end"
> +ENV{nodmraid}=="?*", GOTO="md_imsm_inc_end"
> +SUBSYSTEM=="block", ACTION=="add", ENV{ID_FS_TYPE}=="isw_raid_member", \
> +       RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +LABEL="md_imsm_inc_end"
> +
> +SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}=="?*", \
> +       RUN+="/sbin/mdadm -If $name --path $env{ID_PATH}"
> +SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}!="?*", \
> +       RUN+="/sbin/mdadm -If $name"
> +
> +# Next make sure that this isn't a dm device we should skip for some reason
> +ENV{DM_UDEV_RULES_VSN}!="?*", GOTO="dm_change_end"
> +ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="dm_change_end"
> +ENV{DM_SUSPENDED}=="1", GOTO="dm_change_end"
> +KERNEL=="dm-*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
> +       ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +LABEL="dm_change_end"
> +
> +# Finally catch any nested md raid arrays.  If we brought up an md raid
> +# array that's part of another md raid array, it won't be ready to be used
> +# until the change event that occurs when it becomes live
> +KERNEL=="md*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
> +       ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +
> +# In case the initramfs only started some of the arrays in our container,
> +# run incremental assembly on the container itself.  Note: we ran mdadm
> +# on the container in 64-md-raid.rules, and that's how the MD_LEVEL
> +# environment variable is already set.  If that disappears from the other
> +# file, we will need to add this line into the middle of the next rule:
> +#      IMPORT{program}="/sbin/mdadm -D --export $tempnode", \
> +
> +SUBSYSTEM=="block", ACTION=="add|change", KERNEL=="md*", \
> +       ENV{MD_LEVEL}=="container", RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +
> +
> +LABEL="md_end"
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 9326738aa038..596e801b781c 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -46,6 +46,16 @@ else
>  PETITBOOT_CONF_OPTS += --without-fdt
>  endif
>
> +ifeq ($(BR2_PACKAGE_MDADM),y)
> +define PETITBOOT_POST_INSTALL_MDADM
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/63-md-raid-arrays.rules \
> +               $(TARGET_DIR)/etc/udev/rules.d/63-md-raid-arrays.rules
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/65-md-incremental.rules \
> +               $(TARGET_DIR)/etc/udev/rules.d/65-md-incremental.rules
> +endef
> +PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL_MDADM
> +endif
> +
>  define PETITBOOT_POST_INSTALL
>         $(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
>                 $(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
> --
> 2.39.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC49C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 21:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1083B401F9;
	Sat,  8 Jan 2022 21:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNdetwaR_ROS; Sat,  8 Jan 2022 21:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B3440354;
	Sat,  8 Jan 2022 21:47:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2F7F1BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB2E60A4F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0Q2W7I5Oxb3 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 21:47:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C889560A90
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 21:47:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j11so29484809lfg.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 13:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Prh9hd6yQeJTi/y9xrZh5KoqEhs+94X1ZduHCVWRa4=;
 b=GxXW+3VDGIpXsl1fvJUAw2hxoFwPJQS9hu9BhRmqTS7SETlP+irljmusYbODj4zT4x
 bn1gbBDh7SoNmK6wcKPdB4O2tiueOqzCq5J/qdt5u3sfDNoNnDECjdTTFZF/JWj6hC0E
 WJaPZTZBpyqwFCxeI8GYpJIcoM3MjcZEAgZX6KVrzZSh9YZHkMkI4/Dehlr9JKf2cpiy
 kSnvoQ16PMMqdPn1jXqMq/+c4EFg7eM55987aNK9a3EzAgAHddVoGHClm2NpgyYcupqH
 /oyMzsACiQx0Ymh6Ie7cEOEr5fwX9DlK7/YxjL+2mhByBxe8UyVTBxS56hVfcOxLig2E
 InLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Prh9hd6yQeJTi/y9xrZh5KoqEhs+94X1ZduHCVWRa4=;
 b=jmfaLMU3vceqO/HCnCs2rz3pEO4A7leTVyU5aA2lAVAbQ2LZ5/OkzmBQ7YbPIqGNcm
 /7jyB9Pofpcl4ip3ImFG9BmjYxmvjXdCKlaxpGRJt7Pd16j7Xbg/mz2AMM/oycwa+t0n
 noMnGC5WIli51Y6CzQxHKcwIGXPKOggw5gcxUZXOJ4/3Ugg8sZgQ8YfNBNybfatNbJiX
 0gkqDgUQ8Apu8/Om8j+gJaBrCMutGCZ5gqk3UvKzTsomuhJrz/plLvVcfnrOTu8wTtKk
 IVeMi/KjnrC5xSenXMCf8nJAPInK9QS4h3szSsFbZn8K6DP3hlcPtS4XqsgGqGHO+Q1s
 SuYQ==
X-Gm-Message-State: AOAM5310YIdnZV2R8v3QX8UfelGT/KyL1l6rzwC0o8gxQZ8VuRlYaQvG
 eVJsxiIfLAFnLjMQAz1km9i45U7rmspi+Ylq78L2MTE/bXQ=
X-Google-Smtp-Source: ABdhPJzRri5RjjTTEoY6htP43kGb4FDlCkSh01ltJuic+bl0s4VaZikjsV08bqnsZqc2SpsDBnM/jaR8DE3OisAc6zg=
X-Received: by 2002:a05:6512:23a3:: with SMTP id
 c35mr62358441lfv.150.1641678425823; 
 Sat, 08 Jan 2022 13:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20201126144745.502228-1-nolange79@gmail.com>
 <eae1a293-c218-3527-db3b-cd71c94135b3@mind.be>
In-Reply-To: <eae1a293-c218-3527-db3b-cd71c94135b3@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 8 Jan 2022 22:46:54 +0100
Message-ID: <CADYdroM-xNg-4XBbPh0bUhmgqr41j9f_CR-ou_Y3UgOy88+sfw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v3 1/1] package/systemd: add support for
 creating journal catalog DB
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sa., 8. Jan. 2022 um 20:41 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>   Hi Norbert,
>
> On 26/11/2020 15:47, Norbert Lange wrote:
> > journald supports catalog files, or rather a binary database of
> > those.
> > Functionality added includes:
> >
> > -   A config option allows enabling the binary database.
> >
> > -   if the option is enabled, the database is built and moved to
> >      /usr/share/factory. A symlink is created in /var pointing to
> >      that file.
> >      If BR2_ENABLE_LOCALE_PURGE is enabled, the catalogs not in the
> >      language whitelist are deleted first.
> >
> > -   the service normally used for creating the DB during boot,
> >      and the catalog source files used as input are deleted.
> >
> > The move to /usr/share/factory is helpful for having /usr as whole
> > system distribution.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
>   I was going to apply a second time, but then I noticed that I made some
> comments on v2 [1] that you haven't answered to and I still think they're valid.
> So I've marked this patch as Changes Requested.

I did reply and cover the comments in [2], not sure whats missing?
Separating into 2 independent patches is not really helpfull IMHO.

>
>   If you respin, please also include in the commit message the additional
> explanations you made in reply to Romain.
>
>   Regards,
>   Arnout
>
> [1] https://lore.kernel.org/buildroot/1d09c49a-6d08-1cd7-9785-92b56c17ae06@mind.be/
>
>
> > ---
> > v1->v2:
> > -   Moved all logic into systemd.mk
> > -   solved the LOCALE_PURGE order that way
> > -   use the factory to store the file
> > -   option to enable the DB (similar to udev HWDB)
> > -   cant be anabled with !ROOTFS_RW, tons of
> >      issues with that one
> > v2->v3:
> > -   use backticks instead of $$()
> > -   be more explicit about what happens in
> >      SYSTEMD_LOCALE_PURGE_CATALOGS
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >   package/systemd/Config.in  | 14 +++++++++++++
> >   package/systemd/systemd.mk | 41 ++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 55 insertions(+)
> >
> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > index ec34478e3d..d576e6035b 100644
> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -269,6 +269,20 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
> >
> >         http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
> >
> > +config BR2_PACKAGE_SYSTEMD_CATALOGDB
> > +     bool "enable journal catalog database installation"
> > +     depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW # conflicting tmpfiles magic
> > +     help
> > +       Build and install the journal catalog database.
> > +
> > +       catalog files are used to provide extended and potentially localized
> > +       messages for the journal.
> > +
> > +       The original catalog files will be built into a DB at
> > +       /usr/share/factory/var/lib/systemd/catalog/database.
> > +
> > +       https://www.freedesktop.org/wiki/Software/systemd/catalog/
> > +
> >   config BR2_PACKAGE_SYSTEMD_LOCALED
> >       bool "enable locale daemon"
> >       help
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index cb12f667d6..ae99c02abf 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -613,6 +613,47 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
> >       $(SYSTEMD_INSTALL_NETWORK_CONFS)
> >   endef
> >
> > +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> > +define SYSTEMD_LOCALE_PURGE_CATALOGS
> > +     # go through all files with scheme <basename>.<langext>.catalog
> > +     # and remove those where <langext> is not in LOCALE_NOPURGE
> > +     for cfile in `find $(TARGET_DIR)/usr/lib/systemd/catalog -name '*.*.catalog'`; \
> > +     do \
> > +             basename=$${cfile##*/}; \
> > +             basename=$${basename%.catalog}; \
> > +             langext=$${basename#*.}; \
> > +             [ "$$langext" = "$${basename}" ] && continue; \
> > +             expr '$(LOCALE_NOPURGE)' : ".*\b$${langext}\b" >/dev/null && continue; \
> > +             rm -f "$$cfile"; \
> > +     done
> > +endef
> > +
> > +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_LOCALE_PURGE_CATALOGS
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_CATALOGDB),y)
> > +define SYSTEMD_UPDATE_CATALOGS
> > +     $(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
> > +     install -D $(TARGET_DIR)/var/lib/systemd/catalog/database \
> > +             $(TARGET_DIR)/usr/share/factory/var/lib/systemd/catalog/database
> > +     rm $(TARGET_DIR)/var/lib/systemd/catalog/database
> > +     ln -sf /usr/share/factory/var/lib/systemd/catalog/database \
> > +             $(TARGET_DIR)/var/lib/systemd/catalog/database
> > +     grep -q '^L /var/lib/systemd/catalog/database' $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf || \
> > +             printf "\nL /var/lib/systemd/catalog/database\n" >> $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf
> > +endef
> > +
> > +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
> > +endif
> > +
> > +define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> > +     rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/*/systemd-journal-catalog-update.service
> > +endef
> > +
> > +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> > +
> >   define SYSTEMD_PRESET_ALL
> >       $(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
> >   endef
> >

Norbert

[2] - https://lore.kernel.org/buildroot/1d09c49a-6d08-1cd7-9785-92b56c17ae06@mind.be/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DECC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8503960BBB;
	Sun,  9 Jan 2022 21:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTiAk0b81SBn; Sun,  9 Jan 2022 21:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9954B60BC5;
	Sun,  9 Jan 2022 21:01:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5AC1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1983740215
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BuLEXmK_wwv for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:01:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3B2440213
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 21:01:55 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h2so37447041lfv.9
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 13:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OpF6Gx0v/hHc+cv4F2aqIPICwwXwFSsADZ4GAxvIpuI=;
 b=e03mh/V6Xa1qD3c61306H624vaKz/GzSlf0IXEoOwg3NVgFApGOKi/a2xT500t92JF
 xLZCo8xoRWUa06Lc3EphC67XYgDUSfJNiF5zkrkziwlYI3emqTjLZm5YHQBuBG11QrSy
 6zOuNhnpJ3hl6LoTdzr8/0Hqy02Bj9G4k01uJgsw+xDWXWO/huH0rSxhMnqy0JgzeB1i
 Ue7ZpprjX+vc3TX85+YaFQ6tF1WTannuZYdbTxUinyYK9WF8OOg6mVj5sb8faFqWRZbH
 PwWKs/nIpu6G2E2numRf1KzBUQg20mgN1Z77EbF9viM+i4NkwrjGZUiMADw2ye1L15sD
 0fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpF6Gx0v/hHc+cv4F2aqIPICwwXwFSsADZ4GAxvIpuI=;
 b=aeaF4M8cHyjKgZJTNyiTA1ewsrHmt4SoU/yy/3Tuzm5scC60FTy+64g4c/94uN+Ew5
 FQBz602qUBb8Y8JM3nLeelwzZ3U2TLFV9c7Ppw9TUdqAIOvs35VECjEH7JMG+/RVqMXd
 LwAF/tM+F7vzPlMwLVpB2Az9dwkzP/hgnxv85pEJF2jiCa/X6tMeZQ/KxtwK3+vkZzx8
 wTtfxg39Y2hNDJfkeuja2CxTpqekqTkEHtEjzzvZnzDFV1rykz6P1c4TuSq1m0tzocQh
 n/JPQE2NIuCO55LXQc/UnGpZ195NCQJSZFrB5T2yik8ICpMhZ7e4HsbygDC4yQ1hsqND
 lYkA==
X-Gm-Message-State: AOAM532ycrFyEebjKh/h9LMejqKabuK7Y6fb2BYJSOIin/VDgJpetp09
 N/O7giFmpEHbBWENqJPNVWEcC0BOnIKAfec57XDcnEtvJDA=
X-Google-Smtp-Source: ABdhPJzimyxLNtvqHaueFHbjEQJci19UQYqxGTt93JnpVxbpVDhOgILXVnOzENWrc+Xm/qLXhxg60fqnMmeDDZOqVxk=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr50852473ljp.50.1641762113451; 
 Sun, 09 Jan 2022 13:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20220109110736.3963-1-nolange79@gmail.com>
 <b0810e1e-923c-60b0-afc1-e43120315720@mind.be>
In-Reply-To: <b0810e1e-923c-60b0-afc1-e43120315720@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 9 Jan 2022 22:01:42 +0100
Message-ID: <CADYdroMQ1BrnHpTskDgajhAGmyNRDUVWR6LhbWbXhqgSQwuUNA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am So., 9. Jan. 2022 um 15:49 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>   Hi Norbert,
>
>   Applied to master, thanks. I have a bunch of stylistic remarks, but it's
> nitpicky so I didn't apply them. The only thing I did is the indentation (4
> spaces in shell scripts).
>
>
> On 09/01/2022 12:07, Norbert Lange wrote:
> [snip]
> > diff --git a/package/systemd/fakeroot_tmpfiles.sh b/package/systemd/fakeroot_tmpfiles.sh
> > new file mode 100644
> > index 0000000000..7e9b02cc0a
> > --- /dev/null
> > +++ b/package/systemd/fakeroot_tmpfiles.sh
> > @@ -0,0 +1,57 @@
> > +#!/bin/sh
> > +#
> > +# The systemd-tmpfiles has the ability to grab information
> > +# from the filesystem (instead from the running system).
> > +#
> > +# However there are a few specifiers that *always* will grab
> > +# information from the running system examples are %a, %b, %m, %H
> > +# (Architecture, Boot UUID, Machine UUID, Hostname).
> > +#
> > +# See [1] for historic information.
> > +#
> > +# This script will (conservatively) skip tmpfiles lines that have
> > +# such an specifier to prevent leaking host information.
>
>   Instead of skipping, perhaps we should terminate with an error? Or would that
> mean that it never passes with current systemd?

Nope, there are for example directories created for each boot with an boot uuid,
those should be skipped.
systemd-tmpfilesd will create those on the real boot, so its no error,
just something
you cant do ahead of time.

>
> > +#
> > +# shell expansion is critical to be POSIX compliant,
> > +# this script wont work with zsh in its default mode for example.
>
>   I don't get this... If the script doesn't work with /bin/sh == zsh, maybe use
> /usr/bin/env bash instead? (We already check for bash in dependencies.sh so it's
> fine to require it.)

Sorry, worded badly. the script should run with any shell, as they will use a
POSIX compliant mode if run as /bin/sh.
You cant copy paste the lines into a zsh terminal, as then it would not work
due to some differences in parameter expansion.

>
> > +#
> > +# The script takes several measures to handle more complex stuff
> > +# like passing this correctly:
> > +# f+  "/var/example" - - - - %B\n%o\n%w\n%W%%\n
> > +#
> > +# [1] - https://github.com/systemd/systemd/pull/16187
>
>   The end of that is that Lennart merged something which does (AFAIU) part of
> what you need done. Would it be possible to rebase your changes on top of that?

That's more or less what I did with v3 of the buildroot patch. Lennart
did his own
Implementation of handling a staged rootfs. The things he did not
include, he did
so on purpose (as noted in the PR).

Notably, you will end up creating some directories containing the boot UUID
of your running system.

Filtering out the offending lines seems to me the smallest amount of pain.

>
> > +
> > +[ -n "${HOST_SYSTEMD_TMPFILES-}" ] ||
> > +  HOST_SYSTEMD_TMPFILES=systemd-tmpfiles
> > +
> > +[ -n "${1-}" -a -d "${1-}"/usr/lib/tmpfiles.d ] ||
>
>   I don't understand why you need "${1-}" and not simply "$1". In this context
> (with the quotes around it) there is no difference at all between the two, right?

Yes, I typically write my scripts to not fault on "set -e". No
difference if this mode is not enabled.

>
>   Also, I prefer
>
> ROOTFS="$1"
>
> and use $ROOTFS further down; IMHO that's more readable.

Yeah, its a reasonably simple script tho ;)

>
>
> > +  { echo 1>&2 "$0: need ROOTFS argument"; exit 1; }
> > +
> > +${HOST_SYSTEMD_TMPFILES} --no-pager --cat-config --root="$1" |
> > +  sed -e '/^[[:space:]]*#/d' -e 's,^[[:space:]]*,,' -e '/^$/d' |
> > +    while read -r line; do
> > +      # it is allowed to use quotes around arguments,
> > +      # so let the shell pack the arguments
> > +      eval "set -- $line"
> > +
> > +      # dont output warnings for directories we dont process
> > +      [ "${2#/dev}" = "${2}" ] && [ "${2#/proc}" = "${2}" ] &&
> > +        [ "${2#/run}" = "${2}" ] && [ "${2#/sys}" = "${2}" ] &&
> > +        [ "${2#/tmp}" = "${2}" ] && [ "${2#/mnt}" = "${2}" ] ||
> > +          continue
> > +
> > +      # blank out all specs that are ok to use,
> > +      # test if some remain. (Specs up to date with v250)
> > +      if echo "$2 ${7-}" | sed -e 's,%[%BCEgGhLMosStTuUVwW],,g' | grep -v -q '%'; then
> > +        # no "bad" specifiers, pass the line unmodified
> > +        eval "printf '%s\n' '$line'"
> > +      else
> > +        # warn
> > +        eval "printf 'ignored spec: %s\n' '$line' 1>&2"
> > +      fi
> > +    done |
> > +\
> > +TMPDIR= TEMP= TMP= ${HOST_SYSTEMD_TMPFILES} --create --boot --root="$1" \
> > +  --exclude-prefix=/dev --exclude-prefix=/proc --exclude-prefix=/run --exclude-prefix=/sys \
> > +  --exclude-prefix=/tmp --exclude-prefix=/mnt \
>
>   All these excludes are already excluded above from the "directories we don't
> process" block, so maybe it can be removed?

Yep. doesn't hurt having them tho

>
>   OTOH, if we can later get upstream to no longer have those ignored specs, we
> can remove the preprocessing and it's handy to have the exclude statements already.

upstream does just do the wrong thing *for us* on those specs and its
unlikely to change,
the way it is now makes sense for running in containers.

>   Anyway, I added a comment to the comment block in the beginning to explain why
> they're excluded:
>
> # tmpfs directories (/tmp, /proc, ...) are skipped since they're not
> # relevant for the rootfs image.
>
> > +  -
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 7bf8018438..e136229c8e 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -709,10 +709,15 @@ define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> >   endef
> >   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> >
> > +define SYSTEMD_CREATE_TMPFILES_HOOK
> > +     HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
> > +             /bin/sh $(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
>
>   Since the script has a shebang line, I remove the /bin/sh here and made it
> executable.

Sure

>
> > +endef
> > +
> >   define SYSTEMD_PRESET_ALL
> >       $(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
> >   endef
> > -SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> > +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK SYSTEMD_PRESET_ALL
>
>   We normally add the hook immediately after the definition of the hook, so I
> changed that as well.

Ok

>   Regards,
>   Arnout
>
>   PS There's no need to keep Maxime in Cc, he's no longer involved in Buildroot
> at all.
>
> >
> >   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> >   SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> > @@ -783,7 +788,7 @@ HOST_SYSTEMD_CONF_OPTS = \
> >       -Dvconsole=false \
> >       -Dquotacheck=false \
> >       -Dsysusers=false \
> > -     -Dtmpfiles=false \
> > +     -Dtmpfiles=true \
> >       -Dimportd=false \
> >       -Dhwdb=false \
> >       -Drfkill=false \
> >

Maybe its easier with an example, these are the lines I get when
running buildroot:

PATH="/tmp/ZBuild/host/bin:/tmp/ZBuild/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
FAKEROOTDONTTRYCHOWN=1 /tmp/ZBuild/host/bin/fakeroot --
/tmp/ZBuild/build/buildroot-fs/tar/fakeroot
rootdir=/tmp/ZBuild/build/buildroot-fs/tar/target
table='/tmp/ZBuild/build/buildroot-fs/full_devices_table.txt'
ignored spec: h /var/log/journal/%m - - - - +C
ignored spec: x /var/tmp/systemd-private-%b-*
ignored spec: X /var/tmp/systemd-private-%b-*/tmp
ignored spec: x  /var/lib/systemd/coredump/.#core*.%b*
ignored spec: z /var/log/journal/%m 2755 root systemd-journal - -
ignored spec: z /var/log/journal/%m/system.journal 0640 root systemd-journal - -


Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

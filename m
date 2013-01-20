From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 20 Jan 2013 16:37:37 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <CAHXCMMKsibOa7nXEzF8gjt17AUWzO_Him=ZZDDd5HynsAn3+GQ@mail.gmail.com>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
 <50FBD6BA.1010700@mind.be>
 <CAHXCMMKsibOa7nXEzF8gjt17AUWzO_Him=ZZDDd5HynsAn3+GQ@mail.gmail.com>
Message-ID: <50FC0131.8000405@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

20.1.2013 14:35, Samuel Martin kirjoitti:
>>
>>  Of course, for each package that actually uses this infrastructure, it has
>> to be checked if it does the right thing. If it doesn't then the infra can
>> still be fixed. Therefore, this patch gets my
>>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>> and I hope to see some patches that use it! For volunteers that want to
>> contribute fixes, here's a list of *-configs that currently don't do the
>> right thing:
>>
>> imagemagick
>> divine
>> gd
>> gsl
>> libdnet
>> giblib
>> libart
>> libcdaudio
>> libesmtp
>> libftdi
>> libusb
>> libvncserver
>> log4c
>> neon
>> libnspr
>> libpcap
>> taglib
>>
> And a number of others already do some per-package fix:
> package/cups/cups.mk
> package/directfb/directfb.mk
> package/divine/divine.mk
> package/freetype/freetype.mk
> package/gd/gd.mk
> package/giblib/giblib.mk
> package/icu/icu.mk
> package/imlib2/imlib2.mk
> package/libcurl/libcurl.mk
> package/libdvdnav/libdvdnav.mk
> package/libdvdread/libdvdread.mk
> package/libgcrypt/libgcrypt.mk
> package/libmcrypt/libmcrypt.mk
> package/libnspr/libnspr.mk
> package/libpng/libpng.mk
> package/libusb-compat/libusb-compat.mk
> package/libxml2/libxml2.mk
> package/libxslt/libxslt.mk
> package/ncurses/ncurses.mk
> package/neon/neon.mk
> package/netsnmp/netsnmp.mk
> package/pcre/pcre.mk
> package/php/php.mk
> package/sdl/sdl.mk
>
> Time to unify (and document) all this stuff! ;-)

Well, I can do that individual package fixing and adding
<pkg>_CONFIG_FIXUP to all
those packages that need it according to your list and Arnout list.

And also that documentation part.

But that further fine tuning of what is the best sed magic to use
 I leave for your guys to decide ;-)

Regards
Stefan

>>  Oh, and one of them (libnspr) doesn't have exec_prefix at the beginning of
>> the line, so the expression should be:
>>
>>  -e "s,^ *exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,"
> Or just fix the nspr-config.in file to match "^exec_prefix=.*" ?
>
> Regards,
>

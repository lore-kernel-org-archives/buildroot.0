From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 23 Dec 2012 23:19:24 +0100
Subject: [Buildroot] [PATCH 1/2] libfribidi: new package
In-Reply-To: <201212232249.16467.yann.morin.1998@free.fr>
References: <CAOWBBJxB8rzAUNJNap5sLQppA68wcBByKZeE=hQK0a267zuQ7Q@mail.gmail.com>
 <201212232249.16467.yann.morin.1998@free.fr>
Message-ID: <CAGduivyVG9j-OpdGx4fREUQ+_n=zseftm=71CdGTuJ0XSH58JA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mikhail, All,

On Sun, Dec 23, 2012 at 10:49 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Mikhail, All,
>
> On Sunday 23 December 2012 Mikhail Boiko wrote:
>> ---
>
> You need to add a Signed-off-by line, like:
>     Signed-off-by: Your Real NAME <your.mail@adress>
>
> Please see Documentation/SubmittingPatches in the kernel source tree
> for the reasons and meaning of the SoB line.
>
> [--SNIP--]
>> diff --git a/package/libfribidi/Config.in b/package/libfribidi/Config.in
>> new file mode 100644
>> index 0000000..11aed62
>> --- /dev/null
>> +++ b/package/libfribidi/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_LIBFRIBIDI
>> + bool "libfribidi"
>> + help
>> +  GNU FriBidi is an implementation of the Unicode
>> +  Bidirectional Algorithm (bidi).
>> +
>> +  http://www.fribidi.org/
>
> config BR2_PACKAGE_LIBFRIBIDI
> <TAB>bool "libfribidi"
> <TAB>help
> <TAB>  GNU fribidi...
>
> That is, one TAB before keywords, and one TAB and two spaces before the
> hepl text.
>
>> diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/
>> libfribidi.mk
>> new file mode 100644
>> index 0000000..5cd1bc9
>> --- /dev/null
>> +++ b/package/libfribidi/libfribidi.mk
>> @@ -0,0 +1,14 @@
>> +#############################################################
>> +#
>> +# libfribidi
>> +#
>> +#############################################################
>> +
>> +LIBFRIBIDI_VERSION = 0.19.5
>> +LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
>> +LIBFRIBIDI_SITE = http://www.fribidi.org/download/
>> +LIBFRIBIDI_INSTALL_STAGING = YES
>> +LIBFRIBIDI_CONF_OPT = --disable-docs
Don't forget to add the LICENCE, I assume these are correct for fribidi :
FRIBIDI_LICENSE = GPLv2+
FRIBIDI_LICENSE_FILES = COPYING
>
> --disable-docs is already passed by the autotools-package infrastructure,
> so is not needed.
>
>> +LIBFRIBIDI_DEPENDENCIES = host-pkgconf
>> +
>> +$(eval $(autotools-package))
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

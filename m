From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 11:17:42 +0100
Subject: [Buildroot] Problem linking xlib_libXpm-3.5.12/sxpm
In-Reply-To: <1514949858.20163.19.camel@panix.com>
References: <1514949858.20163.19.camel@panix.com>
Message-ID: <20180103111742.76c727d8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 02 Jan 2018 22:24:18 -0500, Ormund Williams wrote:

> My host machine died and I had to upgrade, so I went from an x86 32bit
> to and AMD 64bit (WOW!!).  That required a complete rebuild since the
> tool-chain would no longer work due to 32-64 conflicts.
> 
> But a seemingly unrelated error cropped up:
> 
>       CCLD     sxpm
>     sxpm.o: In function `Usage':
>     sxpm.c:(.text+0x14): undefined reference to `libintl_gettext'
>     sxpm.c:(.text+0x30): undefined reference to `libintl_gettext'
>     sxpm.o: In function `ErrorMessage':
>     sxpm.c:(.text+0x170): undefined reference to `libintl_gettext'
>     sxpm.c:(.text+0x186): undefined reference to `libintl_gettext'
>     sxpm.c:(.text+0x1ba): undefined reference to `libintl_gettext'
>     sxpm.o:sxpm.c:(.text+0x1d0): more undefined references to `libintl_gettext' follow
>     sxpm.o: In function `main':
>     sxpm.c:(.text.startup+0x3a): undefined reference to `libintl_bindtextdomain'
>     sxpm.c:(.text.startup+0x46): undefined reference to `libintl_textdomain'
>     sxpm.c:(.text.startup+0x81): undefined reference to `libintl_gettext'
>     sxpm.c:(.text.startup+0xa17): undefined reference to `libintl_gettext'
>     collect2: error: ld returned 1 exit status
>     Makefile:417: recipe for target 'sxpm' failed
> 
> I don't need libXaw (Athena Widgets) so I disabled it but the error
> again pops up when samba starts linking:
> 
>     [3246/3801] Linking default/lib/util/libutil-tdb-samba4.so
>     default/source4/heimdal/lib/com_err/error_126.o: In function `com_right_r':
>     error.c:(.text+0x85): undefined reference to `libintl_dgettext'
> 
> Some research into this error points to an "incorrect sequence of
> CCFLAGS or LDFLAGS", help?

What Buildroot version are you using ? Do you have a Buildroot
configuration that allows to reproduce the problem ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

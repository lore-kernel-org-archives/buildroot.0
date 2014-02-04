From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2014 12:11:40 +0100
Subject: [Buildroot] [pkg-perl infra V3 10/12] libcurses-perl: new
	package
In-Reply-To: <1385198749-6249-11-git-send-email-francois.perrad@gadz.org>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
 <1385198749-6249-11-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140204111140.GG3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2013-11-23 10:25 +0100, Francois Perrad spake thusly:
> (depends on ncurses)

Not needed in the commit message.

[--SNIP--]
> diff --git a/package/cpan/libcurses-perl/libcurses-perl.mk b/package/cpan/libcurses-perl/libcurses-perl.mk
> new file mode 100644
> index 0000000..81ba645
> --- /dev/null
> +++ b/package/cpan/libcurses-perl/libcurses-perl.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libcurses-perl
> +#
> +################################################################################
> +
> +LIBCURSES_PERL_VERSION = 1.28
> +LIBCURSES_PERL_AUTHOR = GIRAFFED
> +LIBCURSES_PERL_SOURCE = Curses-$(LIBCURSES_PERL_VERSION).tgz
> +LIBCURSES_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GI/GIRAFFED/
> +LIBCURSES_PERL_DEPENDENCIES = perl ncurses
> +HOST_LIBCURSES_PERL_DEPENDENCIES = host-ncurses

Missing _LICENSE and _LICENSE_FILES.

> +$(eval $(perl-package))
> +$(eval $(host-perl-package))

Do we need the host variant?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

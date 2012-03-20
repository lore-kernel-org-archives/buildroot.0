From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 00:29:24 +0100
Subject: [Buildroot] [PATCH 03/11] manual: update prerequisite.txt
In-Reply-To: <1332285001-12881-4-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
 <1332285001-12881-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20120321002924.064d044a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,

Good work. I'll try to reply to your introduction e-mail soon with
general comments. Below some specific comments on this patch.

Le Wed, 21 Mar 2012 00:09:53 +0100,
Samuel MARTIN <s.martin49@gmail.com> a ?crit :

> +Mandatory packages
> +~~~~~~~~~~~~~~~~~~
> +
> +* Build tools:
> +** +build-essential+ (only for Debian based system)
> +** +gcc+
> +** +g+++
> +** +autoconf+
> +** +automake+
> +** +libtool+

autoconf/automake/libtool are not needed.

> +** +bison+
> +** +flex+
> +** +gettext+
> +** +patch+
> +** +gawk+

gawk is not in the list of mandatory dependencies. For example, the
crosstool-ng package builds host-gawk because it needs gawk. So this
tool is not current part of the mandatory dependencies.

> +* Source fetching tools:
> +** +curl+

curl is not needed.

> +** +wget+
> +** +cvs+
> +** +git+
> +** +mercurial+
> +** +subversion+

None of the version control systems are part of the mandatory
dependencies. They will only be needed if the user has selected only
one package that needs to be fetched from one of those version control
system.

I know it's nitpicking, but I think that one of the good thing with
Buildroot is that the amount of mandatory dependencies on the host is
relatively small, so it would be a shame to mark all those tools are
mandatory even though they are not.

> +* Development libraries:
> +** +ncurses5+
> +** +lzo2+
> +** +lzma+
> +** +zlib1+
> +** +acl1+
> +** +uuid+

Except ncurses5, none of these libraries should be needed, I think. We
build host-zlib when needed, and I don't see where the other libraries
are coming from.

> +* Documentation generation tools:
> +** +asciidoc+

This one should be part of the optional dependencies, people /using/
Buildroot will not need to re-generate the documentation.

> +** +texinfo+


> +
> +[[requirement-optional]]
> +
> +Optional packages
> +~~~~~~~~~~~~~~~~~
> +
> +* Interface dependencies (requires development libraries):

s/Interface/Configuration interface/

> +** +ncurses5+ to use the 'menuconfig' interface

This one is already listed above as a mandatory dependency.

> +** +qt4+ to use the 'xconfig' interface
> +** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
> +
> +* Development libraries:
> +** +glib2+
> +** +netpbm10+ (for +fbtest+)
> +** +python-xcbgen+ (for +Matchbox+ on Debian based system)

Huh, why?!? We build host-libglib2 when needed, and the other ones
should be fixed if they don't build correctly without those host
components installed.

> +** +jdk+ and and depending on the host system +gcj-compat+ for Java
> +development (for +java+, +jamvm+ and +gnu-classpath+)

We don't have Java packages anymore in Buildroot, at least at the
moment.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

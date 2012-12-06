From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Dec 2012 00:09:55 +0100
Subject: [Buildroot] [PATCH] tcllib: new package
In-Reply-To: <1354833972-17700-2-git-send-email-zinosat@tiscali.it>
References: <1354833972-17700-1-git-send-email-zinosat@tiscali.it>
 <1354833972-17700-2-git-send-email-zinosat@tiscali.it>
Message-ID: <201212070009.55814.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Davide, All,

On Thursday 06 December 2012 Davide Viti wrote:
[--SNIP--]
> diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
> new file mode 100644
> index 0000000..471720d
> --- /dev/null
> +++ b/package/tcllib/tcllib.mk
> @@ -0,0 +1,13 @@
> +#############################################################
> +#
> +# tcllib
> +#
> +#############################################################
> +TCLLIB_VERSION       = 1.13
> +TCLLIB_SOURCE        = tcllib-$(TCLLIB_VERSION).tar.bz2
> +TCLLIB_SITE          = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
> +TCLLIB_LICENSE       = tcllib license
> +TCLLIB_LICENSE_FILES = license.terms
> +TCLLIB_DEPENDENCIES  = host-tcl

On my machine, tcllib uses /usr/bin/tclsh8.4 instead of our own,
newly-built host-tcl:

>>> tcllib 1.13 Installing to target
PATH="/home/ymorin/dev/buildroot/O.tcl/host/bin:/home/ymorin/dev/buildroot/O.tcl/host/usr/bin:/home/ymorin/dev/buildroot/O.tcl/host/usr/sbin/:/home/ymorin/bin:/opt/zbar/bin:/opt/stgit/bin:/opt/qemu/bin:/opt/pkg++/bin:/opt/hg/bin:/opt/firefox/bin:/opt/bencode/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" PERLLIB="/home/ymorin/dev/buildroot/O.tcl/host/usr/lib/perl"  /usr/bin/make -j24 DESTDIR=/home/ymorin/dev/buildroot/O.tcl/target  install -C /home/ymorin/dev/buildroot/O.tcl/build/tcllib-1.13/
/usr/bin/tclsh8.4 `echo ./installer.tcl` \
                -no-examples -no-html \
                -pkg-path   /home/ymorin/dev/buildroot/O.tcl/target/usr/lib/tcllib1.13 \
                -app-path   /home/ymorin/dev/buildroot/O.tcl/target/usr/bin \
                -nroff-path /home/ymorin/dev/buildroot/O.tcl/target/usr/man/mann \
                -no-wait -no-gui

We really want tcllib to use our newly-built host-tcl's tclsh, in case
tcllib is not compatible with the host tclsh.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

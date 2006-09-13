From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 13 Sep 2006 17:44:33 +0200
Subject: [Buildroot] Buildroot fails on powerpc with busybox login.c
In-Reply-To: <45043EA7.5070709@pacbell.net>
References: <45043EA7.5070709@pacbell.net>
Message-ID: <20060913154433.GC13069@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 10, 2006 at 09:34:47AM -0700, Michael Boutte wrote:
>Hi,
>Ever since approximately version 16076 the initial make of buildroot 

Sounds like vda's r16075 change to me.

>fails with errors in the busybox/loginutils/login.c as shown in the snip 
>below.
>  CC loginutils/login.o
>/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c: 
>In function 'login_main':
>/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c:143: 
>warning: implicit declaration of function 'read_or_build_utent'


r16112 has a partial fix to make it build again. We (e.g. vda ;) should
provide empty bodies for read_or_build_utent() and write_utent() if UTMP
support is disabled. This can go hand in hand with removing the
pointless forward decls for said functions.

thanks for pointing this out,
Bernhard

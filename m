From: Michael Rommel <rommel@layer-7.net>
Date: Sun, 29 Sep 2013 16:02:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-28
In-Reply-To: <20130929135818.GA3285@free.fr>
References: <20130929063005.E848752C1A0@lolut.humanoidz.org>
 <E69A5ED7-8837-4975-B209-CB92E817949A@layer-7.net>
 <20130929135818.GA3285@free.fr>
Message-ID: <B0C253A3-8F58-48ED-BC96-984A7A9CC940@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sep 29, 2013, at 15:58 , Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> 
>    depends on !BR2_PREFER_STATIC_LIB
> 

Great info - thanks!

> /home/test/test/1/output/host/usr/bin/arm-none-linux-gnueabi-gcc
>    [-- SNIP -D flags --]
>    -D_LINUX -D HAS_IFHEAD -D AICCU_TYPE="\"linux\""  --static -lgnutls
>    -lpthread -lresolv -o aiccu main.o ../common/tun.o ../common/aiccu.o
>    ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o
>    ../common/heartbeat.o ../common/tic.o ../common/ayiya.o
>    ../common/aiccu_test.o ../common/resolver.o ../common/aiccu_linux.o
> 
> From ld's man page:
>    The linker will search an archive only once, at the location where
>    it is specified on the command line. If the archive defines a symbol
>    which was undefined in some object which appeared before the archive
>    on the command line, the linker will include the appropriate file(s)
>    from the archive. However, an undefined symbol in an object appearing
>    later on the command line will not cause the linker to search the
>    archive again.
> 
> Although all the interesting -l flags are present, they are before any
> of the .o files, so the libs won;t be searched for unresolved symbols.
> 
> To confirm this, just have a look at how gcc calls the linker, by adding
>    -v -Wl,--verbose
> 
> to the commandline above, and run it manually.
> 
> If I'm correct (which is still to be proven! ;-) ), we'll just have to
> devise how to fix aiccu?

I'll try that and look into reordering the object files and see if this makes a change!

Thanks for the pointer!

  Michael.

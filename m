From: A M <madwifi@vermark.com>
Date: Fri, 22 Jun 2007 19:01:09 -0400
Subject: [Buildroot] Help Building Buildroot
In-Reply-To: <20070622210730.GC4096@aon.at>
References: <20070622084710.5B20648010@busybox.net>
	<f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
	<1182533072.3733.7.camel@max.vermark.net>
	<20070622182054.GC2799@aon.at> <20070622190236.GA3480@aon.at>
	<1182539747.3733.9.camel@max.vermark.net>
	<1182545730.3733.20.camel@max.vermark.net>
	<20070622210730.GC4096@aon.at>
Message-ID: <1182553269.21432.2.camel@max.vermark.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update:

I grab a fresh buildroot and start from scratch. I was able to run make
successfully if I use the default configuration. But I ran into similar
problem with I tried select some options/packages. Here is part of the
error message I got:



                                touch /home/amark/development/1.0/buildroot/build_i586/ccache-2.4/.unpacked
                                touch /home/amark/development/1.0/buildroot/build_i586/ccache-2.4/.patched
                                mkdir
                                -p /home/amark/development/1.0/buildroot/build_i586/ccache-2.4
                                (cd /home/amark/development/1.0/buildroot/build_i586/ccache-2.4; rm -rf config.cache; \
                                
                                PATH="/home/amark/development/1.0/buildroot/toolchain_build_i586/bin:/home/amark/development/1.0/buildroot/build_i586/staging_dir/bin:/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin:/usr/lib/qt-3.3/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/home/amark/bin" AR=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar AS=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as LD=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld NM=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm CC=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc GCC=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc CXX=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++ CPP=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-cpp RANLIB=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib STRIP=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-strip OBJCOPY=/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-objcopy CFLAGS="-Os -pipe  -I/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/include --sysroot=/home/amark/development/1.0/buildroot/build_i586/staging_dir/ -isysroot /home/amark/development/1.0/buildroot/build_i586/staging_dir" LDFLAGS="-L/home/amark/development/1.0/buildroot/build_i586/staging_dir/lib -L/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/lib" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" LDFLAGS_FOR_BUILD="" PKG_CONFIG_SYSROOT="/home/amark/development/1.0/buildroot/build_i586/staging_dir" PKG_CONFIG="/home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/pkg-config" CXX="" \
                                                /home/amark/development/1.0/buildroot/build_i586/ccache-2.4/configure \
                                                --target=i586-linux \
                                                --host=i586-linux \
                                
                                --build=i386-pc-linux-gnu \
                                                --prefix=/usr \
                                                --exec-prefix=/usr \
                                                --bindir=/usr/bin \
                                                --sbindir=/usr/sbin \
                                                --libexecdir=/usr/lib \
                                                --sysconfdir=/etc \
                                                --datadir=/usr/share \
                                                --localstatedir=/var \
                                                --mandir=/usr/man \
                                                --infodir=/usr/info \
                                                --disable-nls \
                                        );
                                configure: Configuring ccache
                                checking for
                                i586-linux-gcc... /home/amark/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
                                checking for C compiler default output
                                file name... configure: error: C
                                compiler cannot create executables
                                See `config.log' for more details.
                                make: ***
                                [/home/amark/development/1.0/buildroot/build_i586/ccache-2.4/.configured] Error 77
                                

I tried a different approach by going directly to the ccache directory
and setting the PATH to:

export PATH=
$PATH:~/development/1.0/buildroot/build_i586/staging_dir/usr/bin/

and 

CC=~/development/1.0/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc

I ran ./configure with the above options and got this:

        configure: Configuring ccache
        checking for i586-linux-gcc... i586-linux-gcc
        checking for C compiler default output file name... configure:
        error: C compiler cannot create executables
        See `config.log' for more details.

It seems like something is wrong with my compiler.

Has anyone come across this?


Thanks again.

A M




On Fri, 2007-06-22 at 23:07 +0200, Bernhard Fischer wrote: 
> On Fri, Jun 22, 2007 at 04:55:30PM -0400, A M wrote:
> >Update:
> >
> >Now I have a different error which is still related to ccache.
> 
> Works fine here. rm -rf toolchain_* build_* and retry. Sounds like the
> non-working ccache from before did damage your compiler.
> 
> >I have attached config.log from  buildroot/build_i586/ccache-2.4
> >directory.
> >
> >I have also noticed that under buildroot/build_i586/staging_dir/usr/bin
> >there is a broken link for cc -> gcc. cc is link to gcc which is not
> >there.
> 
> I saw that too, but IIRC this is there since ages, you can safely ignore
> it (does anybody know why it is there?).
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 4972 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070622/7bcc0a5a/attachment-0001.bin 

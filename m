From: Ignacio Lorenzo =?ISO-8859-1?Q?Subir=E1?= Otal <nachootal@salle.url.edu>
Date: Thu, 27 Sep 2007 13:55:50 +0200
Subject: [Buildroot] C Compiler cannot create executables
In-Reply-To: <46FB92AA.1020201@Kriegisch.name>
References: <1190888809.6244.7.camel@PcNacho> <46FB92AA.1020201@Kriegisch.name>
Message-ID: <1190894150.6244.12.camel@PcNacho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi changed some configuration in order to get a target for a geode and
the log of the error is:
EM_LIBS=1
STAGING_DIR="/home/nacho/investigacionETX/buildroot/build_/staging_dir"
CXX="" \
                /home/nacho/investigacionETX/buildroot/toolchain_build_/binutils-2.18/configure \
                --prefix=/usr \
                --exec-prefix=/usr \
                --build=i386-pc-linux-gnu \
                --host=-linux-uclibc \
                --target=-linux-uclibc \
                --disable-nls \
                --disable-multilib \

--with-gmp="/home/nacho/investigacionETX/buildroot/build_/gmp-4.2.2"
--with-mpfr="/home/nacho/investigacionETX/buildroot/build_/mpfr-2.3.0" \
                --disable-werror \
                 \
        )
checking build system type... i386-pc-linux-gnu
checking host system type... configure:
error: /bin/bash /home/nacho/investigacionETX/buildroot/toolchain_build_/binutils-2.18/config.sub -linux-uclibc failed
make: ***
[/home/nacho/investigacionETX/buildroot/build_/binutils-2.18-target/.configured] Error 1


Thanks for your help, 

Nacho
El jue, 27-09-2007 a las 13:23 +0200, Alexander Kriegisch escribi?:
> Posting a bit of log output would be helpful, so here is just an
> educated guess: I sometimes get errors like this if there is something
> wrong with my build prerequisites or with ccache. Usually it helps to
> issue a manual recompile of your build prerequisites (e.g. libs your
> package depends on) in order for the "compiler cannot create
> executables" thing to disappear.
> 
> Regards
> --
> Alexander Kriegisch
> 
> 
> Ignacio Lorenzo Subir? Otal:
> > Hi!, I'm having this error while making a make in buildroot and I don't
> > know why because I have been using gcc to compile several other programs
> > and works fine for me.
> > What can I do to avoid this error?.
> 
> 

From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Nov 2017 13:58:58 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171114234409.114f002f@gmx.net>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
Message-ID: <20171115125857.dcy6j7qvjt32ww43@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

...
> > > $ wget -c http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/config -O .config.old

> Your should store the downloaded config file definitely as '.config' instead of '.config.old' (there is only
> the way .config --> .config.old and not the other way round in buildroot)...
Thanks for clarification. I actually realised this as well. This is not an issue, as I
tested it as being .config.

> > > $ make olddefconfig
> > > $ make
> > > make: *** No rule to make target 'toolchain-external-custom', needed by '/home/foo/install/src/buildroot.git/output/build/toolchain-external/.stamp_configured'.  Stop.  

> > > What can be wrong? I've done it this way in the past (with other autobuild items, which
> > > had different toolchains).  

> Same here with a fresh installed openSUSE Tumbleweed x86_64 without 32-bit support packages installed.

> Until commit ec54092c916440501006bfa51a820eb953100510 ('toolchain-external-custom: new package'), or with
> 2016.11.3 the same config gives the following error instead:

> [...]
> Cannot execute cross-compiler '.../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc'
> make[1]: *** [package/pkg-generic.mk:209: .../build/toolchain-external/.stamp_configured] Error 1
> make: *** [Makefile:16: _all] Error 2

> Maybe the toolchain definition should select BR2_HOSTARCH_NEEDS_IA32_LIBS?
It must be some system library dependency as I was able to run the build on Debian unstable.
Failing build is on openSUSE Tumbleweed x86_64 (the same as you), but I have glibc-32bit
and many other 32 bit packages installed (as well on Debian machine).
I tried to play with BR2_HOSTARCH_NEEDS_IA32_LIBS, but didn't found the solution.
Thomas, any idea what can be wrong?


Kind regards,
Petr

From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 16 Nov 2017 08:14:16 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
Message-ID: <20171116071415.a7eei4avbfy4mg4p@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> On 15-11-17 13:58, Petr Vorel wrote:
> >> Cannot execute cross-compiler '.../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc'
> >> make[1]: *** [package/pkg-generic.mk:209: .../build/toolchain-external/.stamp_configured] Error 1
> >> make: *** [Makefile:16: _all] Error 2
> >> Maybe the toolchain definition should select BR2_HOSTARCH_NEEDS_IA32_LIBS?
> > It must be some system library dependency as I was able to run the build on Debian unstable.
> > Failing build is on openSUSE Tumbleweed x86_64 (the same as you), but I have glibc-32bit
> > and many other 32 bit packages installed (as well on Debian machine).
> > I tried to play with BR2_HOSTARCH_NEEDS_IA32_LIBS, but didn't found the solution.
> > Thomas, any idea what can be wrong?


>  What does .../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc -v
> report? When you run ldd on it? When you run it under strace? What about the
> other binaries bundled in that tarball? What about other external toolchains
> (e.g. sourcery)?
NOTE: This is actually for Peter Seiderer. Mine error was:
make: *** No rule to make target 'toolchain-external-custom', needed by '/home/foo/install/src/buildroot.git/output/build/toolchain-external/.stamp_configured'.  Stop.

>  Regards,
>  Arnout


Kind regards,
Petr

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Apr 2008 15:37:40 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
In-Reply-To: <0f4a01c8964f$bbc064b0$f52f9e86@LPSC0173W> (Guillaume Dargaud's
	message of "Fri\, 4 Apr 2008 14\:30\:52 +0200")
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W>
	<8763v071sq.fsf@macbook.be.48ers.dk> <20080402164154.GE9436@mx.loc>
	<0ddc01c89583$84ecb960$f52f9e86@LPSC0173W>
	<87ej9n2kj4.fsf@macbook.be.48ers.dk>
	<0e8d01c89595$e3482140$f52f9e86@LPSC0173W>
	<87bq4r0ybx.fsf@macbook.be.48ers.dk>
	<0e9b01c895a0$47d11590$f52f9e86@LPSC0173W>
	<87ej9mvygr.fsf@macbook.be.48ers.dk>
	<0efa01c89632$9b7d9910$f52f9e86@LPSC0173W>
	<8763uyufji.fsf@macbook.be.48ers.dk>
	<0f2901c8963e$92fc82e0$f52f9e86@LPSC0173W>
	<87ve2xubdp.fsf@macbook.be.48ers.dk>
	<0f4a01c8964f$bbc064b0$f52f9e86@LPSC0173W>
Message-ID: <874pahspuj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume Dargaud <dargaud@lpsc.in2p3.fr> writes:

 >> Ok. I don't have such an old GCC on my system so I cannot test. Maybe
 >> you will have more luck if you select GCC 3.4.6 in buildroot instead?

 Guillaume> Trying this right now...

 Guillaume> $ make
 Guillaume> [...]
 Guillaume> strip --strip-all -R .note -R .comment 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-addr2line 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ar 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-as 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-c++filt 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-cpp 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc-3.4.6 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcov 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gprof 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ld 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldconfig 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldd 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-nm 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objcopy 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objdump 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ranlib 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-readelf 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-size 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strings 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strip
 Guillaume> strip: 
 Guillaume> /home/guinevere/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu: 
 Guillaume> File format not recognized

So your strip doesn't seem to like to strip the
powerpc-linux-uclibc-embedspu shellscript (cannot blame it) - Could
you try setting GCC_STRIP_HOST_BINARIES to something else than true in
toolchain/gcc/gcc-uclibc-3.x.mk or alternative add %-embedspu to the
filter-out in line 289?

-- 
Bye, Peter Korsgaard

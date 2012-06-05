From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 05 Jun 2012 12:44:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-04
In-Reply-To: <20120605063154.64FC752CF4D@lolut.humanoidz.org>
References: <20120605063154.64FC752CF4D@lolut.humanoidz.org>
Message-ID: <4FCDE2F4.4080502@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are a few similar failures on mediastreamer recently.

> Build 7fca436524e5f7ba300d27c615061b0838adb1e2
> ==============================================
>
> Status         : NOK
> Failure reason : mediastreamer-2.8.2
> Architecture   : i686
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-06-04 09:55:24
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=1a3045f209d651ebbe1e5e87ccb7686e8ea595a5
> End of log     : http://autobuild.buildroot.net/results/7fca436524e5f7ba300d27c615061b0838adb1e2/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/7fca436524e5f7ba300d27c615061b0838adb1e2/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/7fca436524e5f7ba300d27c615061b0838adb1e2/config
> Defconfig      : http://autobuild.buildroot.net/results/7fca436524e5f7ba300d27c615061b0838adb1e2/defconfig

This one ends with these lines:
...

   OBJCLD mediastream
libtool: link: defaulting to `CC'
libtool: link: if this is not correct, specify a tag with `--tag'
libtool: link: warning: library `/home/test/toolchains/ctng-i386-pentium4-uclibc/bin/../lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/lib/libstdc++.la' was moved.
libtool: link: warning: library `/home/test/toolchains/ctng-i386-pentium4-uclibc/bin/../lib/gcc/i686-unknown-linux-uclibc/4.6.3/../../../../i686-unknown-linux-uclibc/lib/libstdc++.la' was moved.
../src/.libs/libmediastreamer.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[3]: *** [mediastream] Error 1
make[3]: Leaving directory `/home/test/test/output/build/mediastreamer-2.8.2/tests'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/test/test/output/build/mediastreamer-2.8.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/test/test/output/build/mediastreamer-2.8.2'
make: *** [/home/test/test/output/build/mediastreamer-2.8.2/.stamp_built] Error 2


> Build bd9027ce94348025f1ca02a77eb81b9200124d9a
> ==============================================
>
> Status         : NOK
> Failure reason : mediastreamer-2.8.2
> Architecture   : powerpc
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-06-04 12:01:51
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=1a3045f209d651ebbe1e5e87ccb7686e8ea595a5
> End of log     : http://autobuild.buildroot.net/results/bd9027ce94348025f1ca02a77eb81b9200124d9a/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/bd9027ce94348025f1ca02a77eb81b9200124d9a/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/bd9027ce94348025f1ca02a77eb81b9200124d9a/config
> Defconfig      : http://autobuild.buildroot.net/results/bd9027ce94348025f1ca02a77eb81b9200124d9a/defconfig

...

> Build 4d9f554fc29901be1a577ca0c39369befee269b5
> ==============================================
>
> Status         : NOK
> Failure reason : mediastreamer-2.8.2
> Architecture   : powerpc
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-06-04 23:15:14
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=3bc0d5be844f41cf58120ffc3d306eeae8868cc9
> End of log     : http://autobuild.buildroot.net/results/4d9f554fc29901be1a577ca0c39369befee269b5/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/4d9f554fc29901be1a577ca0c39369befee269b5/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/4d9f554fc29901be1a577ca0c39369befee269b5/config
> Defconfig      : http://autobuild.buildroot.net/results/4d9f554fc29901be1a577ca0c39369befee269b5/defconfig

And these two end with:

...

   OBJCLD mediastream
libtool: link: defaulting to `CC'
libtool: link: if this is not correct, specify a tag with `--tag'
/usr/bin/ld: mediastream.o: Relocations in generic ELF (EM: 20)
/usr/bin/ld: mediastream.o: Relocations in generic ELF (EM: 20)
mediastream.o: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[3]: *** [mediastream] Error 1
make[3]: Leaving directory `/home/test/test/output/build/mediastreamer-2.8.2/tests'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/test/test/output/build/mediastreamer-2.8.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/test/test/output/build/mediastreamer-2.8.2'
make: *** [/home/test/test/output/build/mediastreamer-2.8.2/.stamp_built] Error 2


I don't have the toolchains to reproduce these exactly, but "OBJCLD" 
seems a good hint.

However, I bet simply adding --disable-tests is a much simpler solution. 
I'm sending a
patch to do this. Thomas, would you please test with the same config?

As for me, I checked with the default BR toolchain and no "OBJCLD" is 
output anymore while
building mediastreamer.

Luca

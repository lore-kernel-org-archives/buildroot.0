From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 16 Sep 2007 23:25:34 +0200
Subject: [Buildroot] sparc64 v9 VIS toolchain bug with fzeros?
In-Reply-To: <20070915222726.GN20058@aon.at>
References: <20070915075059.68EC4A6056@busybox.net>
	<20070915121916.GK20058@aon.at>
	<f43fc5580709150607t4e51b73by878a54e35da00750@mail.gmail.com>
	<20070915192154.GL20058@aon.at>
	<f43fc5580709151241g578c4ce8i85d956039a747958@mail.gmail.com>
	<20070915222726.GN20058@aon.at>
Message-ID: <20070916212533.GO20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Blue Swirl,

Configuring gcc with --with-tune=v9 and -mvis in cflags, how can there
be a call to fzeros (a v9a instruction, from the looks)?

Specifically, i see:
/tmp/buildroot_trunk/build_sparc64/staging_dir/usr/bin/sparc64-linux-uclibc-gcc 
-Os -I/tmp/buildroot_trunk/build_sparc64/staging_dir/usr/include
-I/tmp/buildroot_trunk/build_sparc64/staging_dir/include
--sysroot=/tmp/buildroot_trunk/build_sparc64/staging_dir/ -isysroot
/tmp/buildroot_trunk/build_sparc64/staging_dir -mtune=v9 -mvis
-DHAVE_CONFIG_H -I../ncurses -I. -I. -I../include  -D_GNU_SOURCE
-DNDEBUG -O2 -fPIC -c ../ncurses/./tty/lib_mvcur.c -o
../obj_s/lib_mvcur.o
{standard input}: Assembler messages:
{standard input}:12791: Error: Architecture mismatch on "fzeros".
{standard input}:12791:  (Requires v9a|v9b; requested architecture is v9.)
make[2]: *** [../obj_s/lib_mvcur.o] Error 1
make[2]: Leaving directory `/tmp/buildroot_trunk/build_sparc64/ncurses-5.6/ncurses'

Is this a bug in binutils-2.17.50.0.17/gcc-4.2.1 or is my configuration wrong?

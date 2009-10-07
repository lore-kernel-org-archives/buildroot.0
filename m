From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 09:51:15 +0200
Subject: [Buildroot] [PATCH 5/6] mark odd strip invocations
In-Reply-To: <20091006220135.65f111f4@coruscant.lan> (Olaf Rempel's message of
	"Tue\, 6 Oct 2009 22\:01\:35 +0200")
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
	<87eipg2wxc.fsf@macbook.be.48ers.dk> <20091006184241.GB10261@mx.loc>
	<87skdw1hlr.fsf@macbook.be.48ers.dk>
	<20091006220135.65f111f4@coruscant.lan>
Message-ID: <87pr8zmyks.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

 Olaf> Yep, it works 100%.
 Olaf> Target is a i586 automated partition-imaging tool build with gcc 4.3.3, 
 Olaf> binutils 2.19.1, uclibc 0.9.31.1 and using BR2_STRIP_sstrip (if that matters).

OK, on a related note why do we need all this special install handling?
The ntfs-3g buildsystem seems to do the right thing on make install*,
E.G. with all those lines removed I have:

find -name \*ntfs\*|xargs file                         /tmp/br/target
./sbin/mount.ntfs-3g:           broken symbolic link to `/usr/bin/ntfs-3g'
./usr/lib/libntfs-3g.so:        symbolic link to `libntfs-3g.so.52.0.0'
./usr/lib/libntfs-3g.so.52:     symbolic link to `libntfs-3g.so.52.0.0'
./usr/lib/libntfs-3g.so.52.0.0: ELF 32-bit MSB shared object, PowerPC or cisco 4500, version 1 (SYSV), dynamically linked, with unknown capability 0x41000000 = 0x11676e75, with unknown capability 0x10000 = 0x90401, stripped
./usr/bin/ntfs-3g.probe:        ELF 32-bit MSB executable, PowerPC or cisco 4500, version 1 (SYSV), dynamically linked (uses shared libs), with unknown capability 0x41000000 = 0x11676e75, with unknown capability 0x10000 = 0x90401, stripped
./usr/bin/ntfs-3g:              ELF 32-bit MSB executable, PowerPC or cisco 4500, version 1 (SYSV), dynamically linked (uses shared libs), with unknown capability 0x41000000 = 0x11676e75, with unknown capability 0x10000 = 0x90401, stripped

-- 
Bye, Peter Korsgaard

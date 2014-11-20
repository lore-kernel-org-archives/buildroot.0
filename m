From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 10:36:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-19
In-Reply-To: <20141120094407.4b487379@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 20 Nov 2014 09:44:07 +0100")
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
Message-ID: <87y4r6fc2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/38b4030b17a8ba1319afcfbc326489ecd030b0be/

 > The uClibc bug about setreuid().

 > What do we do about this one? It still isn't fixed upstream. Should we
 > simply disable uClibc for static builds? (But then we would only have
 > musl left as a C library compatible with static builds). Or do we
 > simply blacklist for now the packages that are known to use the symbols
 > causing problems?

 > Peter?

uClibc with static linking is useful for quite some setups, so I would
find it a pity to globally disable it. Let's just disable the affected
packages with a comment.


 >> powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dc0dd9e878edd2b359900d02e1d53d294321c00b/
 >> arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0b8411482def8fdfba0aaaa19be01a477707d874/

 > configure: error: No curses/termcap library found

 > Why don't we simply add host-ncurses to the host-mysql dependencies?
 > Nathaniel, can you reproduce this issue on your autobuilder, and see if
 > adding host-ncurses to the dependencies of host mysql fixes the problem?

I did that yesterday:

http://git.buildroot.net/buildroot/commit/?id=d81d202e97258e440d1fc271ba5cdb7c01f7257f


 >> bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/c60d880b620c47f4aa03cdf2e1bb85a526242d54/

 > Proposal of fix by Baruch at http://patchwork.ozlabs.org/patch/412575/.

I will take a look later today.


 >> sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/119adf6a31266e71e45fb1951d7e8ebbd1ff41fe/

 > Bug in the CodeSourcery SH4 toolchain. I don't think we have any other
 > solution than blacklisting configurations that contain Qt4 Webkit and
 > that use this toolchain. Opinions?

Yes, I also think we should just blacklist it.


 >> bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/cf2723cf650486586ff18b6ef57c91a74a97bbc9/

 > bfin-linux-uclibc-g++:
 > /home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so:
 > No such file or directory

 > Don't know what's going on. Someone to have a look?

I also looked at the log, and it doesn't make sense to me. I haven't
investigated further though.


All in all, it looks pretty good!

-- 
Venlig hilsen,
Peter Korsgaard 

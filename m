From: Claas Hilbrecht <claas+maillinglists.buildroot@jucs-kramkiste.de>
Date: Fri, 27 Jul 2007 18:08:41 +0200
Subject: [Buildroot] SVN Rev 19269 won't build
In-Reply-To: <20070727140855.GA24629@aon.at>
References: <5041A110D5D200EDF64E7756@[192.168.83.121]>
	<20070727103757.GC22789@aon.at>
	<09E61CA94D6C4DE241DF8A46@[192.168.83.121]>
	<20070727123058.GA23901@aon.at>
	<2BF4F42AD2EC4CBFF0CF3925@[192.168.83.121]>
	<20070727140855.GA24629@aon.at>
Message-ID: <1D637BC976FEB2D52024B231@[192.168.83.121]>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--Am Freitag, 27. Juli 2007 16:08 +0200 Bernhard Fischer 
<rep.dot.nop@gmail.com> schrieb:

> Alright. Last minute change after testing it.
> r19278 Works For Me (tm)

Somewhat better, but not quite right I assume. After entering the 
menuconfig dialog and exit it without changing anything I just type make. 
After I while I get these errors:

mv tmp-specs specs
echo | 
/home/babel/buildroot/0.9.29/buildroot_org/buildroot/toolchain_build_i386/gcc-4.2.0-initial/./gcc/xgcc 
-B/home/babel/buildroot/0.9.29/buildroot_org/buildroot/toolchain_build_i386/gcc-4.2.0-initial/./gcc/ 
-B/home/babel/buildroot/0.9.29/buildroot_org/buildroot/build_i386/staging_dir/usr/i386-linux-uclibc/bin/ 
-B/home/babel/buildroot/0.9.29/buildroot_org/buildroot/build_i386/staging_dir/usr/i386-linux-uclibc/lib/ 
-isystem 
/home/babel/buildroot/0.9.29/buildroot_org/buildroot/build_i386/staging_dir/usr/i386-linux-uclibc/include 
-isystem 
/home/babel/buildroot/0.9.29/buildroot_org/buildroot/build_i386/staging_dir/usr/i386-linux-uclibc/sys-include 
-E -dM - | \
          sed -n -e 's/^#define \([^_][a-zA-Z0-9_]*\).*/\1/p' \
                 -e 's/^#define \(_[^_A-Z][a-zA-Z0-9_]*\).*/\1/p' | \
          sort -u > tmp-macro_list
/bin/sh 
/home/babel/buildroot/0.9.29/buildroot_org/buildroot/toolchain_build_i386/gcc-4.2.0/gcc/../move-if-change 
tmp-macro_list macro_list
echo timestamp > s-macro_list
The directory that should contain system headers does not exist:
 
/home/babel/buildroot/0.9.29/buildroot_org/buildroot/toolchain_build_i386/uClibc_dev//usr/include
make[2]: *** [stmp-fixinc] Error 1
make[2]: Leaving directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/toolchain_build_i386/gcc-4.2.0-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory 
`/home/babel/buildroot/0.9.29/buildroot_org/buildroot/toolchain_build_i386/gcc-4.2.0-initial'
make: *** 
[/home/babel/buildroot/0.9.29/buildroot_org/buildroot/toolchain_build_i386/gcc-4.2.0-initial/.compiled] 
Error 2

I think if make menuconfig required some user changes I should at least get 
a warning that I'm trying to shot myself.

PS: Sorry to bother you with these error, but I tried to get a clean build 
to setup another build system. Getting a svn rev working out of the box is 
my first goal.

-- 
 Claas Hilbrecht
 http://www.jucs-kramkiste.de

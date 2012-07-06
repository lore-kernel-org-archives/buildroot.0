From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Fri, 6 Jul 2012 13:49:00 +0100
Subject: [Buildroot] microperl-5.12.4 fails with parallel make
Message-ID: <4FF6DEBC.1060301@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

host-microperl-5.12.4 fails to build when parallel make is used (-j32)
on a 16-core processor. BR2_JLEVEL is set to 32. The build log is along
these lines:

make[2]: Entering directory
`/home/testuser/buildroot/output/build/host-microperl-5.12.4/cpan/IPC-SysV'
make[2]: Entering directory
`/home/testuser/buildroot/output/build/host-microperl-5.12.4/ext/Hash-Util-FieldHash'
Writing Makefile for I18N::Langinfo
Can't locate Cwd.pm in @INC (@INC contains: ../../lib) at
../../lib/File/Path.pm line 6.
BEGIN failed--compilation aborted at ../../lib/File/Path.pm line 6.
Compilation failed in require at ../../lib/ExtUtils/MakeMaker.pm line 11.
BEGIN failed--compilation aborted at ../../lib/ExtUtils/MakeMaker.pm
line 11.
Compilation failed in require at Makefile.PL line 5.
BEGIN failed--compilation aborted at Makefile.PL line 5.
512 from ext/POSIX's Makefile.PL at make_ext.pl line 390.
Warning: No Makefile!

It builds fine with -j1.

-- 
markos

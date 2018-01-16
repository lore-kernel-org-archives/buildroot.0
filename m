From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 15 Jan 2018 16:44:45 -0800
Subject: [Buildroot] glibc-testsuite: running g++ tests in cross-compile
 setup
Message-ID: <22b488c2-6f3f-ec35-48b4-401e07b7c1d5@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a buildroot based ARC cross toolchain (2017.11-rc1 base d+ some hacks of my 
own). I'm trying to test the glibc testsuite with it with c++ enabled to get 
additional coverage. All of this was fine initially...

	PASS: argp/argp-test
	PASS: argp/bug-argp1
	PASS: argp/bug-argp2
	PASS: argp/check-installed-headers-c
	PASS: argp/check-installed-headers-cxx    <-----
..

However@some point in December, not sure if this was a buildroot rebase or 
glibc, c++ tests stopped getting built.

    make test-wrapper='<path>/<to>/scripts/cross-test-ssh.sh root at x.x.x.x' xcheck

I'm not sure if this is a glibc or buildroot issue..

gcc-initial : config.log has --enable-languages=c
gcc-final   : config.log has --enable-languages=c,c++
glibc       : config.log has --enable-languages=c

I guess issue is #3, but does anyone know why ?

Thx,
-Vineet

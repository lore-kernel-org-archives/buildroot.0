From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 18 Mar 2009 14:25:30 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090318131349.GD27893@whatever.nu>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu>
	<20090318123004.GE18723@buzzloop.caiaq.de>
	<20090318131349.GD27893@whatever.nu>
Message-ID: <20090318132530.GF18723@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2009 at 02:13:49PM +0100, Per-Henrik Lundblom wrote:
> configure:3630: /usr/bin/gcc -I/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/host_dir/include -I/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/host_dir/usr/include -c -g -O2  conftest.c >&5
> conftest.c:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'me'
> configure:3636: $? = 1
> configure: failed program was:
> | #ifndef __cplusplus
> |   choke me
> | #endif

That's your problem - C++ support is not enabled. Could you try your
build with 'BR2_INSTALL_LIBSTDCPP=y'? And as Sven suggested, clean your
tree probably :)

Daniel

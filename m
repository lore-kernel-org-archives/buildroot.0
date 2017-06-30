From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 30 Jun 2017 09:30:38 +0000
Subject: [Buildroot] [arc-buildroot] Re: [FYI 1/2] WIP:pcre2: new package
In-Reply-To: <5cba5356-ff94-7e8b-8158-44937264dd9d@mind.be>
References: <104a0453-7ac4-f6d9-3e66-2671b313d757@melcoinc.co.jp>
 <b8596705-462f-3228-1b53-e65eb0bc2565@melcoinc.co.jp>
 <20170629221749.68b106c8@gmx.net>
 <5cba5356-ff94-7e8b-8158-44937264dd9d@mind.be>
Message-ID: <1498815037.8837.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, 2017-06-30 at 11:25 +0200, Arnout Vandecappelle wrote:
> 
> On 29-06-17 22:17, Peter Seiderer wrote:
> [snip]
> > 
> > Did try the (relative new) support/scripts/test-pkg script with your patch/packet, two
> > failures until now:
> > 
> > - br-arcle-hs38 [ 4/47]: FAILED
> > 
> > ? checking for arc-buildroot-linux-uclibc-ar... .../test_pcre2_001/br-arcle-hs38/host/usr/bin/arc-linux-ar
> > ? checking the archiver (.../test_pcre2_001/br-arcle-hs38/host/usr/bin/arc-linux-ar) interface... unknown
> > ? configure: error: could not determine .../test_pcre2_001/br-arcle-hs38/host/usr/bin/arc-linux-ar interface
> > ? package/pkg-generic.mk:217: recipe for target '.../test_pcre2_001/br-arcle-hs38/build/pcre2-10.23/.stamp_configured' failed
> > 
> > And from 'build/pcre2-10.23/config.log':
> > 
> > ? configure:4792: .../test_pcre2_001/br-arcle-hs38/host/usr/bin/arc-linux-ar cru libconftest.a conftest.o >&5
> > ? .../test_pcre2_001/br-arcle-hs38/host/usr/bin/arc-linux-ar: error while loading shared libraries: libfl.so.2: cannot open shared object file: No
> > such file or directory
> > ? configure:4795: $? = 127
> > 
> > 	$ ./host/usr/bin/arc-linux-ar -V
> > ? ./host/usr/bin/arc-linux-ar: error while loading shared libraries: libfl.so.2: cannot open shared object file: No such file or directory
> > 
> > 	$??LD_LIBRARY_PATH=host/opt/ext-toolchain/lib ./host/usr/bin/arc-linux-ar -V
> > ? GNU ar (GNU Binutils) 2.28.51.20170313
> > ? Copyright (C) 2017 Free Software Foundation, Inc.
> > ? This program is free software; you may redistribute it under the terms of
> > ? the GNU General Public License version 3 or (at your option) any later version.
> > ? This program has absolutely no warranty.
> > 
> > Looks more like a toolchain support problem...I think nothing pcre2 specific...

Yeah this is an issue with Tomas' prebuilt toolchain where libfl is not in RPATH.
We discussed that with Thomas recently and the plan was for him to check
how that toolchain gets built.

Note with Buildroot-built toolchain such a problem doesn't exist.

Let's see what Thomas says.

-Alexey

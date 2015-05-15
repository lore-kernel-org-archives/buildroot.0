From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 15 May 2015 16:06:33 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150514231309.4e8158df@free-electrons.com>
References: <20150514063016.DE5B7100C9A@stock.ovh.net>
 <20150514231309.4e8158df@free-electrons.com>
Message-ID: <20150515140633.GJ16123@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> >      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9faeba9f811bb3507861003d78eec245f8a93db9/
> >        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/46f9d84e6db10ce7cbe48653f6da4450aceceb4c/
> >      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7852f40e6bae93f953a588bbd6902c2b1cee8a42/
> >      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/13b43105caf4d3952de70030b51f8d96cf6604ee/
> >        nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e119b1ef55c546e0d0598b85c46ceefa5c43d5a6/
> 
> The nios2 problems are due to a toolchain issue. We should simply
> disable boost with this toolchain.
> 
> The PowerPC problems are due to a uClibc bug. I've done some tests, and
> boost-1.57.0 builds fine on PowerPC/glibc, ARM/uClibc, but fails on
> PowerPC/uClibc. It's the boost-log module that causes the problem.

Where do you see a uClibc problem?
Any short error message?

I tried boost 1.57 with PPC and getting GCC ICE when using 4.9.2
while compiling test. With GCC 5.1 the compile works fine.
Both tested with uClibc-ng (ppc soft-float target)

best regards
 Waldemar

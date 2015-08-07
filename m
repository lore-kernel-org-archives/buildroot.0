From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 7 Aug 2015 06:07:27 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150806113014.163c6592@free-electrons.com>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
Message-ID: <20150807040727.GM8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello all,
> 
> Brendan, Alexey, Vicente, J?r?me, Bernd, Max, Julien, Clayton, Gustavo, Yann, please have a look below.
> 
> >          arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/549492270f3f43747a96a8326aef1d7ae1d3b213/
> 
> Not sure what's going on:
> 
> cannot find Scrt1.o: No such file or directory
> 
> Waldemar, it seems to be a uClibc issue. Do you have some idea?

The reason for the failure is an unsupported combination of
PIE and static.

I found a thread about it here:
https://sourceware.org/ml/binutils/2012-02/msg00260.html

With Linux it seems you need dynamic linking of a PIE executable.

PIE is hardcoded in audit Makefile.am, so we would either need to
make it conditional for static builds or disable the package for
static builds.

best regards 
 Waldemar

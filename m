From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 13 Sep 2007 11:26:15 +0200
Subject: [Buildroot] pciutils-2.2.6 fails to build for powerpc  405
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE1093F1374@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE1093F1374@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <20070913092615.GA15641@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 12, 2007 at 10:53:17AM -0700, Darcy Watkins wrote:
>Hello,
>
>I tried to build the pciutils package for my powerpc 405 system, but it
>broke.
>
>i386-ports.c includes i386-io-linux.h which includes sys/io.h
>
>The error is: sys/io.h: No such file or directory.
>
>But the whole thing appears suspicious because I am building for powerpc
>405 not for i386 so I think that the package must really be broken in
>the make scripts since it shouldn't be building 1386 dependent files
>when cross compiling for powerpc.
>
>The problem appears to be line #23 of the pciutils-2.2.6/lib/configure
>script in the pciutils source.  Line #15 was patched to not have the
>"sys" variable be derived from the build host, but line #23 has:
>
>   cpu=`uname -m | sed ' ... black magic stuff ...'`
>
>The result is that pciutils is configured for i386 (my build host cpu
>type) and then it attempts to cross compile it for powerpc.
>
>I think that the short solution is to patch line #23 so that it derives
>cpu from architecture variables instead of the output of uname.

Sounds ok. Is this already fixed updstream? If not it would be nice if
you could make sure that we can inherit a working version from
upstream..

From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 29 May 2009 10:53:35 +0200
Subject: [Buildroot] Building only toolchain
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB699D04B5@MAIL-UA.ccs.local>
Message-ID: <20090529085335.GB9858@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 29, 2009 at 07:25:19AM +0200, Teemu Keskinarkaus wrote:
>Hi,
>
> 
>
>Is it possible to build only toolchain in buildroot? I tried to search

yes. IIRC 'make cross_compiler'

>the makefiles, but I couldn't find a target that would do it.  It seems
>that there are some absolute paths stored in buildroot toolchain

You should always use SYSROOT-enabled compilers thus building a compiler
that you can trivially relocate.

>binaries(at least ccache has) so I can't just copy them to another
>system. Or can the toolchain be built somehow that it doesn't store any
>local information there?

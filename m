From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 16:54:55 +0200
Subject: [Buildroot] [PATCH] postgresql: fix sparc compile issue
In-Reply-To: <20150809094150.GA8066@waldemar-brodkorb.de>
References: <20150809094150.GA8066@waldemar-brodkorb.de>
Message-ID: <20150809165455.23206e83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sun, 9 Aug 2015 11:41:51 +0200, Waldemar Brodkorb wrote:
> Fixes autobuilder compile error:
> http://autobuild.buildroot.net/results/f374d3535cf91f139ce80703cd2d0a2be5d3b2b1/
> 
> The predefines are wrong:
> ./output/host/usr/bin/sparc-buildroot-linux-uclibc-gcc -dM -E - </dev/null|grep sparc
> #define sparc 1
> #define __sparc__ 1
> #define __sparc 1
> #define __sparc_v8__ 1

As discussed on IRC, can you respin after using #if defined(__sparcv8)
|| defined(__sparc_v8__), so that it continue to works on Solaris (for
which __sparcv8 is defined). This way you can submit the patch upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

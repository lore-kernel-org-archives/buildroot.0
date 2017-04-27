From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Apr 2017 10:26:45 +0200
Subject: [Buildroot] [PATCH] libmpeg2: fix sparc32 build
In-Reply-To: <20170427053609.GA20301@waldemar-brodkorb.de>
References: <20170427053609.GA20301@waldemar-brodkorb.de>
Message-ID: <20170427102645.523f96c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Apr 2017 07:36:09 +0200, Waldemar Brodkorb wrote:

> +-    sparc-* | sparc64-*)
> ++    sparc64-*)
> + 	AC_DEFINE([ARCH_SPARC],,[sparc architecture])
> + 	TRY_CFLAGS="$OPT_CFLAGS -mcpu=ultrasparc -mvis"
> + 	AC_TRY_CFLAGS([$TRY_CFLAGS $CFLAGS],[OPT_CFLAGS="$TRY_CFLAGS"]);;

I am not sure this is the completely correct solution, and Arnout
proposed another solution, see:

  https://patchwork.ozlabs.org/patch/749138/
  https://patchwork.ozlabs.org/patch/749137/

The second patch has the explanation why Waldemar patch is not really
correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

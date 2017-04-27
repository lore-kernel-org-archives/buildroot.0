From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 11:15:34 +0200
Subject: [Buildroot] [PATCH] libmpeg2: fix sparc32 build
In-Reply-To: <20170427102645.523f96c1@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 27 Apr 2017 10:26:45 +0200")
References: <20170427053609.GA20301@waldemar-brodkorb.de>
 <20170427102645.523f96c1@free-electrons.com>
Message-ID: <87o9viky89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "\Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 27 Apr 2017 07:36:09 +0200, Waldemar Brodkorb wrote:

 >> +-    sparc-* | sparc64-*)
 >> ++    sparc64-*)
 >> + 	AC_DEFINE([ARCH_SPARC],,[sparc architecture])
 >> + 	TRY_CFLAGS="$OPT_CFLAGS -mcpu=ultrasparc -mvis"
 >> + 	AC_TRY_CFLAGS([$TRY_CFLAGS $CFLAGS],[OPT_CFLAGS="$TRY_CFLAGS"]);;

 > I am not sure this is the completely correct solution, and Arnout
 > proposed another solution, see:

 >   https://patchwork.ozlabs.org/patch/749138/
 >   https://patchwork.ozlabs.org/patch/749137/

 > The second patch has the explanation why Waldemar patch is not really
 > correct.

Ok. Can I take this as an acked-by for the check-bin-arch / pkg-generic
changes then? ;)

-- 
Bye, Peter Korsgaard

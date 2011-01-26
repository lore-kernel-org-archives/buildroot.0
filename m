From: David Fisher <dfisher769@gmail.com>
Date: Tue, 25 Jan 2011 20:02:45 -0800
Subject: [Buildroot] buildroot's support of ltp-testsuite
In-Reply-To: <20110124153151.172e43a1@surf>
References: <AANLkTin=kO3yG0t4MhDhBDP_Y4Y46Jt98Um7a7epVBy3@mail.gmail.com>
	<20110114085320.29dfe769@surf>
	<AANLkTik1WhgfrQtEjh6_TH2zn5sQMbs_7ixFPPOpghVR@mail.gmail.com>
	<20110124153151.172e43a1@surf>
Message-ID: <AANLkTimyy2Fcvk=UtKGdt6ynW1GSZiiAKMo+6KHeOmvN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thak you very much for the referal.  Although it is much better than I had
until now (at least I can select ltp on menuconfig, without modifying
original files), but still has some problems.  In many directories the LTP
sets by default the _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built
without large file support enabled.

I wounder which utilities people use to test the embedded Linux builds using
the buildroot.  It appears that the LTP perfectly works for non embedded
systems, while compiled using glibc.

If you know some other test utilities besides LTP test suite (and
Crackerjack, which does not fit either), that are commonly used for testing
this enviroment I would very appreciate this information.

Thank you in advance

David.

On Mon, Jan 24, 2011 at 6:31 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello David,
>
> Please keep the Buildroot list in Cc for all Buildroot-related topics.
>
> On Thu, 20 Jan 2011 20:27:47 -0800
> David Fisher <dfisher769@gmail.com> wrote:
>
> > Thank you very much for answer.
> > I am trying to evaluate the possibility of using the LTP test suite for
> > embedded software, basing on Linux kernel, which was built with the Build
> > Root tool, using uClibc.
> >
> > I found in your posting at Free Electronics "On the road to Buildroot
> > 2009.08", from August 3, 2009, that ltp-testsuite is on the list of
> upgraded
> > packages.  Also there is ltp-testsuite directory (under
> buildroot/package),
> > so it was my understanding that it could be compiled under uClibc,
> exactly
> > as it could be compiled under non embedded Fedora, which uses glibc.
> > (By the way the version of August 30, 2009, -- 20090830, which is used
> there
> > would not compile even under Fedora, because of bug.  The "tst_exit"
> > function, used in the "inh_capped.c" with an argument, while the
> prototype
> > of this function, defined in the "test.h" defines it as
> > "void tst_exit(void) LTP_ATTRIBUTE_NORETURN*;*", however in the newer
> > versions of the ltp this bug is fixed.  I modified the version's date in
> all
> > the related files of the ltp-testsuite and tried to compile, however
> without
> > success.  The file "ballistaRPC.h, which is generated automatically using
> > rpcgen, and therefore should not be edited, has a line *#include
> <rpc/rpc.h>
> > *, while the rpc.h file does not exist.)
> >
> > *My major two questions are:*
> > *1. Is there any possibility to build (at least a portion of) LTP test
> suite
> > above uClibc and test with it the kernel?  If yes, how to do it?*
>
> It is probably possible, but not with the default uClibc configuration
> used in Buildroot. The LTP test-suite uses some functions that are
> considered legacy: those functions are present in glibc, but not in
> traditional configurations of uClibc. With enough effort, you can
> probably find all the uClibc options needed to generate an uClibc that
> has all the required features to run ltp-testsuite. I have however
> never tried this, so I can't say for sure if it's feasible or not.
>
> > *2. If not, could you please provide with more details how to use the
> ltp,
> > built on external toolchain that relies on glibc, which you mention in
> your
> > email to me?*
>
> If you're using Buildroot 2010.11 (the latest stable version at this
> time), then you have to first download and install a glibc toolchain
> separatly. If you're working on ARM, my recommandation would be the
> CodeSourcery toolchains. If you're working on another architecture, you
> may want to try Crosstool-NG to generate a toolchain. Once you have the
> toolchain, just configure Buildroot to use it as an external toolchain.
>
> If you're using Buildroot Git (which will become the next stable
> version, at the end of February), then Buildroot can automatically
> download and install an external toolchain for you, at least for the
> CodeSourcery toolchains on ARM, MIPS, PowerPC and SH.
>
> Note that the ltp-testsuite package has been upgraded recently in
> Buildroot:
>
> http://git.buildroot.net/buildroot/commit/?id=a72a670489547a3ca645ff7c3a0d9c3fb66eab51
> .
> The version used is newer than the one you would use if you work with
> Buildroot 2010.11.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110125/81c17ae3/attachment.html>

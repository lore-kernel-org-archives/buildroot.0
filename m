From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 8 Jul 2007 14:59:52 +0200
Subject: [Buildroot] improved deps [was Re: svn commit: trunk/buildroot:
	package/config]
In-Reply-To: <20070708001049.GC4096@aon.at>
References: <20070708000018.9AFEEA686B@busybox.net>
	<20070708001049.GC4096@aon.at>
Message-ID: <20070708125948.GK4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 08, 2007 at 02:10:49AM +0200, Bernhard Fischer wrote:
>On Sat, Jul 07, 2007 at 05:00:18PM -0700, aldot at uclibc.org wrote:
>>Author: aldot
>>Date: 2007-07-07 17:00:17 -0700 (Sat, 07 Jul 2007)
>>New Revision: 19025
>>
>>Log:
>>- silence a cosmetic warning (closes several issues in mantis).
>>  This also provides a nice up-to-date filestamp if something got reconfigured (e.g. c++ support got toggled) that can be used in the future to depend accordingly.
>
>e.g.:

I have applied this as an example for gcc as r19034.
A more generic way would be in order, e.g. emit a file that can be
pulled in that looks like (pseudo pathes):

/obj/buildroot/toolchain_build_i386/gcc-4.2.0-final/.configured: \
	/obj/buildroot/build_i386/include/config/br2/install/fortran.h

/obj/buildroot/toolchain_build_i386/uClibc/.configured: \
	/obj/buildroot/build_i386/include/config/br2/uclibc/feature1.h \
	/obj/buildroot/build_i386/include/config/br2/uclibc/feature2.h \
	/obj/buildroot/build_i386/include/config/br2/uclibc/feature3.h

I leave the impl of the above to the curious reader :P

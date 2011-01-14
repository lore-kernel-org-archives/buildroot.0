From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 08:53:20 +0100
Subject: [Buildroot] buildroot's support of ltp-testsuite
In-Reply-To: <AANLkTin=kO3yG0t4MhDhBDP_Y4Y46Jt98Um7a7epVBy3@mail.gmail.com>
References: <AANLkTin=kO3yG0t4MhDhBDP_Y4Y46Jt98Um7a7epVBy3@mail.gmail.com>
Message-ID: <20110114085320.29dfe769@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Jan 2011 18:34:48 -0800
David Fisher <dfisher769@gmail.com> wrote:

> The latest version of buildroot has a directory of
> .../buildroot/package/ltp-testsuite, which includes Config.in,
> ltp-testsuite.mk and five patch files.
> The third line of Config.in is "depends on BROKEN".  As a result the
> ltp-testsuite could not be compiled under buildroot.
> 
> Any plan to fix this problem, so the ltp-testsuite could be built?

This has been improved a bit in the current Git version, through the
following commit:

 a72a670489547a3ca645ff7c3a0d9c3fb66eab51

However, beware that ltp-testsuite cannot be built with the default
Buildroot configuration for uClibc, as ltp-testsuite uses some legacy
functions that we don't enable in our default build of uClibc.

ltp-testsuite however builds fine with an external toolchain that
relies on glibc, and it even runs on ARM (some tests have issues, but
most of the tests were working correctly).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

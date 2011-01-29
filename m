From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jan 2011 10:11:04 +0100
Subject: [Buildroot] buildroot's support of ltp-testsuite
In-Reply-To: <AANLkTimyy2Fcvk=UtKGdt6ynW1GSZiiAKMo+6KHeOmvN@mail.gmail.com>
References: <AANLkTin=kO3yG0t4MhDhBDP_Y4Y46Jt98Um7a7epVBy3@mail.gmail.com>
	<20110114085320.29dfe769@surf>
	<AANLkTik1WhgfrQtEjh6_TH2zn5sQMbs_7ixFPPOpghVR@mail.gmail.com>
	<20110124153151.172e43a1@surf>
	<AANLkTimyy2Fcvk=UtKGdt6ynW1GSZiiAKMo+6KHeOmvN@mail.gmail.com>
Message-ID: <20110129101104.3077ce4c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Tue, 25 Jan 2011 20:02:45 -0800
David Fisher <dfisher769@gmail.com> wrote:

> Thak you very much for the referal.  Although it is much better than I had
> until now (at least I can select ltp on menuconfig, without modifying
> original files), but still has some problems.  In many directories the LTP
> sets by default the _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built
> without large file support enabled.
> 
> I wounder which utilities people use to test the embedded Linux builds using
> the buildroot.  It appears that the LTP perfectly works for non embedded
> systems, while compiled using glibc.

Yes, in its current state, LTP seems to work only with glibc. It would
be great if there was an effort to adapt LTP to embedded systems: make
it work with uClibc, and tune some constants to make the tests actually
possible on typical ARM/PowerPC platforms (some tests have constants
that have been defined for 2+Ghz machines with multiple GB of RAMs, and
they spawn so many processes that the poor ARM platform just can't
handle the load).

> If you know some other test utilities besides LTP test suite (and
> Crackerjack, which does not fit either), that are commonly used for testing
> this enviroment I would very appreciate this information.

I am personally aware of other similar tools, but I have never
investigated this area seriously.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

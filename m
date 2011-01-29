From: Will Newton <will.newton@gmail.com>
Date: Sat, 29 Jan 2011 10:58:27 +0000
Subject: [Buildroot] buildroot's support of ltp-testsuite
In-Reply-To: <20110129101104.3077ce4c@surf>
References: <AANLkTin=kO3yG0t4MhDhBDP_Y4Y46Jt98Um7a7epVBy3@mail.gmail.com>
	<20110114085320.29dfe769@surf>
	<AANLkTik1WhgfrQtEjh6_TH2zn5sQMbs_7ixFPPOpghVR@mail.gmail.com>
	<20110124153151.172e43a1@surf>
	<AANLkTimyy2Fcvk=UtKGdt6ynW1GSZiiAKMo+6KHeOmvN@mail.gmail.com>
	<20110129101104.3077ce4c@surf>
Message-ID: <AANLkTin79GkYAM_e52AhNFT0ot8=d6+9rMVZKoyCdTP3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 29, 2011 at 9:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>> I wounder which utilities people use to test the embedded Linux builds using
>> the buildroot. ?It appears that the LTP perfectly works for non embedded
>> systems, while compiled using glibc.
>
> Yes, in its current state, LTP seems to work only with glibc. It would
> be great if there was an effort to adapt LTP to embedded systems: make
> it work with uClibc, and tune some constants to make the tests actually
> possible on typical ARM/PowerPC platforms (some tests have constants
> that have been defined for 2+Ghz machines with multiple GB of RAMs, and
> they spawn so many processes that the poor ARM platform just can't
> handle the load).

I have spent quite a lot of time over the years trying to get LTP
working on our embedded systems (uClibc, maybe 32MB of RAM) and it is
possible. We added a few command line options to reduce the memory
usage of tests, although it does involve writing your own test script
with those parameters tweaked.

However it does seem like the project is mostly funded and driven by
enterprise Linux companies so it's a constant battle keeping up to
date. I think we are stuck on a 2 year old version or something like
that and haven't managed to allocate enough resources to get the
recent versions running well.

It probably is something I will pick up again at some point in the
future though. Maybe it's worth suggesting as a CELF project...

From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 22 Feb 2014 22:54:35 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140221100842.2d988a70@skate>
References: <20140221073009.2E62F10136B@stock.ovh.net>
 <20140221100842.2d988a70@skate>
Message-ID: <CALq67GAwyaeTrXofN71m+g7uNW1Lx8bTALgvT+skqgB7uXr45w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas and Vicente,

On Fri, Feb 21, 2014 at 10:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>>     mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/c76e6f8b2d7fc29abc2f4dcae962b60cf91a8e0c/
>
> Usual rt-tests failure on mipsel, fixed by a bump of rt-tests, but
> which was committed to next.

rt-tests was not bumped on next but rather ltp-testsuite was to fix an
issue. However, Vicente submitted a patch to uclibc that will add for
_tid specifically targeted for this package. Is this something that
could be backported to our uclibc version?

Specifically the commit is as follows:

http://git.uclibc.org/uClibc/commit/?id=b4e6e61e2f7c6fb4bf59f66efaa74591a2112912

Another option to fix the rt-tests-0.83 failures is to disable
rt-tests when uclibc for mipsel is used.

This is what I found when I was investigating a recent rt-tests-0.83
autobuilder failure. I will not have time backport Vicente's patch but
I may have time to submit a patch to disable this package in the way
that is described above.

Thanks,
-Ryan

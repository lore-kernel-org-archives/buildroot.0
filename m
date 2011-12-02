From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Dec 2011 08:56:12 +0100
Subject: [Buildroot] RFC dependencies: checking minimum make version
In-Reply-To: <87fwh4glfy.fsf@macbook.be.48ers.dk>
References: <CAAXf6LW__qfNLx-9jPsx+B_t9MMw4Uinti6+PrP7GzY+1X5mVg@mail.gmail.com>
 <87fwh4glfy.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LWNeZpVSoecXzGss8S9rZQmp-cD6DzJGqUdyaqD2Gm3Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 1, 2011 at 8:07 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
> Hi,
>
> ?Thomas> 2. Check for the make version in make instead of in shell, e.g. with
> ?Thomas> the following pattern: (adopted from
> ?Thomas> http://www.jgc.org/blog/cookbook-sample.pdf)
> ?Thomas> need := 3.81
> ?Thomas> ok := $(filter $(need),$(firstword $(sort $(MAKE_VERSION) $(need))))
> ?Thomas> ifeq (,$(ok))
> ?Thomas> $(error make too old!)
> ?Thomas> endif
>
> ?Thomas> This will not work when make 10.x comes out because of the sort trick,
> ?Thomas> but otherwise should work fine. This code should be included as early
> ?Thomas> as possible in the Makefile.
>
> ?Thomas> What do you think?
>
> The likelyhood of people using <3.81 is probably getting fairly small,
> but I'm OK with such a test (with a better error message and variables
> though) at the top of the main Makefile.
>
> Out of interest, on what system did you hit this?

This problem was seen on a workstation in Shanghai, with an old RedHat
distribution (not sure which exactly, but the kernel was 2.6.9, so
pretty old).

I'll try to submit a patch one of these days.

Thanks,
Thomas

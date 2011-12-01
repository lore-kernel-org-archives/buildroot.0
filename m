From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 Dec 2011 20:07:29 +0100
Subject: [Buildroot] RFC dependencies: checking minimum make version
In-Reply-To: <CAAXf6LW__qfNLx-9jPsx+B_t9MMw4Uinti6+PrP7GzY+1X5mVg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 1 Dec 2011 12:49:14
 +0100")
References: <CAAXf6LW__qfNLx-9jPsx+B_t9MMw4Uinti6+PrP7GzY+1X5mVg@mail.gmail.com>
Message-ID: <87fwh4glfy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> 2. Check for the make version in make instead of in shell, e.g. with
 Thomas> the following pattern: (adopted from
 Thomas> http://www.jgc.org/blog/cookbook-sample.pdf)
 Thomas> need := 3.81
 Thomas> ok := $(filter $(need),$(firstword $(sort $(MAKE_VERSION) $(need))))
 Thomas> ifeq (,$(ok))
 Thomas> $(error make too old!)
 Thomas> endif

 Thomas> This will not work when make 10.x comes out because of the sort trick,
 Thomas> but otherwise should work fine. This code should be included as early
 Thomas> as possible in the Makefile.

 Thomas> What do you think?

The likelyhood of people using <3.81 is probably getting fairly small,
but I'm OK with such a test (with a better error message and variables
though)@the top of the main Makefile.

Out of interest, on what system did you hit this?

-- 
Bye, Peter Korsgaard

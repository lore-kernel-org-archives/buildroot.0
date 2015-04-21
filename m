From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 22:47:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/zeromq: enable kernel-based
 feature flags
In-Reply-To: <5509FBEB.8040505@mind.be>
References: <1423214752-29779-1-git-send-email-lionel.orry@gmail.com>
 <20150315232850.21412e3a@free-electrons.com>
 <CAKAx1cjF8Q9ZTJXg4yxHkqQFFkzAEEKzU5V852XZtQMw=59LPw@mail.gmail.com>
 <5509FBEB.8040505@mind.be>
Message-ID: <20150421224751.1eebfde3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 18 Mar 2015 23:27:55 +0100, Arnout Vandecappelle wrote:

>  It's been a while ago, of course, but I think one problem was that the symbols
> are also defined by the toolchain, so they exist even if the kernel doesn't
> support them.

If the flags exist in the toolchain, then it means that the toolchain
is using a certain version of the kernel headers. Running with a kernel
older than that will anyway not work.

I mean, there are zillions of configure script that tests if the
toolchain has syscall foo() or bar() by simply doing a compile time
test. They don't actually check if the user is stupid enough to run on
a system that has a kernel older than the kernel headers + C library
combination used in the toolchain.

Or am I missing something specific to those flags?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

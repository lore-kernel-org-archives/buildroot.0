From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Nov 2017 15:47:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-27
In-Reply-To: <CANQCQpZZzurPy3cJCYpg5z67+hogAnN=syKtGui4fEr4B6GyFw@mail.gmail.com>
References: <20171128070012.4EDDD20746@mail.free-electrons.com>
 <CANQCQpZZzurPy3cJCYpg5z67+hogAnN=syKtGui4fEr4B6GyFw@mail.gmail.com>
Message-ID: <20171128154711.3836b5e5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 08:25:21 -0600, Matthew Weber wrote:

> On Tue, Nov 28, 2017 at 1:00 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >  
> [snip]
> >  powerpc64le | make[1]: *** [qfsfileengine... | TIM | http://autobuild.buildroot.net/results/fde2ab8aeb2f5f3b91d80c47d7177adfb778f883 |  
> 
> I've noticed the size of the builds are getting much larger as the
> number of failures is going down.  Has there been any previous
> discussion about having the timeout conditional on if the build is
> still progressing vs just a blink duration?  I was thinking we could
> do a check for file modifications or something periodically vs a hard
> timeout.

There's been some discussion a long time ago about this. Back then, we
didn't had much detail on what was going on with the build. However,
now, we could more easily check the build-time.log file and see if the
last line has been appended sufficiently recently to consider the build
to still be "alive".

However, from an implementation point of view, we currently use
"timeout XYZ make", so the autobuild-run script doesn't have to bother
with the timeout problem. If we want to check build-time.log, we have
to have a thread or timer in the autobuild-run script that periodically
checks the last line and decides if we've reached the timeout condition
or not.

Interested ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

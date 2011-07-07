From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 13:42:10 +0200
Subject: [Buildroot] asking for advice on improving our buildroot setup
In-Reply-To: <1310033360.2076.18.camel@sven> (Sven Neumann's message of "Thu, 
 07 Jul 2011 12:09:20 +0200")
References: <1310033360.2076.18.camel@sven>
Message-ID: <87aacqs4fh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> As you can imagine this build consumes a lot of time and disk space.
 Sven> Currently I can think of two ways to improve this:

 Sven> (1) Add an initial step that builds a toolchain and then use that
 Sven>     toolchain from the following steps. This would save the time
 Sven>     to rebuild the toolchain for each of the steps.

I think that is the best/easiest option.

 Sven> (2) Combine all steps and build different rootfs from within the
 Sven>     same buildroot tree. I read that this would be supported. But
 Sven>     I would like to get advice from you first. Is there a chance
 Sven>     that this will work for the described setup?

Unfortunately not, buildroot only knows of a single rootfs - So you'll
need to build the 2 rootfs'es seperately.

The only other option I could think of is perhaps to combine the two
rootfs'es and include the factory test sw in the device rootfs if that's
an option?

-- 
Bye, Peter Korsgaard

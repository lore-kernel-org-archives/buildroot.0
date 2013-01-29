From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jan 2013 20:39:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-01-28
In-Reply-To: <CAKcgs2zUHb7CHnuBbPBeXNZ5jTiFJ7vZG0mu6TK50F57vSLw3Q@mail.gmail.com>
References: <20130129073424.4F9F552C08C@lolut.humanoidz.org>
 <CAKcgs2zUHb7CHnuBbPBeXNZ5jTiFJ7vZG0mu6TK50F57vSLw3Q@mail.gmail.com>
Message-ID: <20130129203915.14e6a5fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles Talis,

On Tue, 29 Jan 2013 11:30:45 -0800, Gilles Talis wrote:

> I could not find in buildroot documentation how these build failures
> were tracked and what the process was to triage and fix them.
> These issues do not appear in the bug tracking system.
> I assume this question has been asked many times, but I could not
> find the answer to it.
> Can you briefly describe how build failures are handled?

Sure.

We have autobuilders machines that are continuously building random
package configurations, from a set of predefined toolchain
configurations. Those run 24/7, and all the autobuilder machines report
the results of their build on http://autobuild.buildroot.org.

And then, once a day, an automatic e-mail is sent to the Buildroot
mailing list, with the list of build that failed.

There is for now no connection to the bug tracker. It is up to the
Buildroot community to have a look at the daily e-mail, pick some build
failure to work on, and submit patches to fix it. When a build failure
takes a long time to fix, we often send an e-mail to the list to say
we're working on it, or we discuss it on the Buildroot IRC channel.
There is no formal process for taking care of a build failure, except
by sending one or several patches to fix.

At the moment, we cannot easily integrate this with the bug tracker,
because a lot of build failures are duplicate. If we submitted one bug
for each build failure, we would have gazillions of duplicate bugs in
the bug tracker. It is not easy to automatically detect when two build
failures are the same, of when two build failures are different. So we
leave this analysis to Buildroot developers/contributors.

Do these explanations answer your questions? If you need more details,
do not hesitate to ask.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 20 Feb 2012 11:37:00 +0100
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <20110930223526.6aa05012@skate>
References: <1317110841.20688.12.camel@sven> <20110927233506.55cb52a2@skate>
 <1317221262.8481.4.camel@sven> <1317373796.20520.3.camel@sven>
 <20110930215915.3d7fad80@skate> <20110930223526.6aa05012@skate>
Message-ID: <1329734220.13226.35.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am picking up this old thread to let you know that we've finally found
a solution to this. As a reminder, the problem I reported was that
processes started to segfault on startup after an update of gcc from
version 4.3 to newer versions.

On Fri, 2011-09-30 at 22:35 +0200, Thomas Petazzoni wrote:

> Therefore, I guess that the problem might be iwmmxt related. Can you
> try with "lower" optimization options ?

It turned out that Thomas guessed right. It seems that the iwmmxt
optimizations are broken in gcc newer than 4.3. Changing the target to
xscale fixed the problem. And the tests I have done so far seem to imply
that the performance of code compiled with gcc 4.6 optimized for xscale
is slightly better than the same code compiled with gcc 4.3 optimized
for iwmmxt.

Not sure if this should somehow be handled in buildroot. But I thought
I'd at least let you know on the mailing-list so that others can avoid
running into the same problem.


Greetings,
Sven

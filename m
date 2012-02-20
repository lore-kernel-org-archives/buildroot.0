From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2012 08:55:35 -0800
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <1329734220.13226.35.camel@bender>
References: <1317110841.20688.12.camel@sven> <20110927233506.55cb52a2@skate>
 <1317221262.8481.4.camel@sven> <1317373796.20520.3.camel@sven>
 <20110930215915.3d7fad80@skate> <20110930223526.6aa05012@skate>
 <1329734220.13226.35.camel@bender>
Message-ID: <20120220085535.2246a727@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 20 Feb 2012 11:37:00 +0100,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> It turned out that Thomas guessed right. It seems that the iwmmxt
> optimizations are broken in gcc newer than 4.3. Changing the target to
> xscale fixed the problem. And the tests I have done so far seem to
> imply that the performance of code compiled with gcc 4.6 optimized
> for xscale is slightly better than the same code compiled with gcc
> 4.3 optimized for iwmmxt.

Ok.

> Not sure if this should somehow be handled in buildroot. But I thought
> I'd at least let you know on the mailing-list so that others can avoid
> running into the same problem.

If the problem is still there in the latest versions of gcc, it should
be reported as a bug to the gcc project.

Thanks for the investigation!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

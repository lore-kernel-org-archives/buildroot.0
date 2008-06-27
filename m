From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 27 Jun 2008 05:49:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
In-Reply-To: <20080627120011.GD32468@mx.loc>
References: <20080626065112.3F4CB3C289@busybox.net>
	<877iccn0ml.fsf@macbook.be.48ers.dk>
	<18151015.post@talk.nabble.com>
	<87y74ri68u.fsf@macbook.be.48ers.dk>
	<20080627120011.GD32468@mx.loc>
Message-ID: <18154265.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The main reason I do this is that I use ELDK-4.0 for part of the system.
Changing the compiler for that part of the system is not possible(easy) due
to prebuilt binaries.
However ELDK-4.0 creates a problem with busybox 1.9.X (I will try again with
1.10.X and 1.11.X).  It incorrectly strips some symbol (xstroll if I
remember) The end result being that busybox will not start as there is an
undefined symbol. (init fails)
The problem does not exist in 1.2.2.1 and does not exist if I use GCC4.2.1
based compilers.  However I cannot easily replace compiler so for now have
stuck with 1.2.2.1.  
I did not raise the issue on mailing lists as I am trying to move compilers
and thus make the problem go away.  However that takes time and I would
rather that buildroot marked things as deprecated for now instead of
removing support.

Cheers
Dan
-- 
View this message in context: http://www.nabble.com/svn-commit%3A-trunk-buildroot-package-busybox-tp18127574p18154265.html
Sent from the BuildRoot mailing list archive at Nabble.com.

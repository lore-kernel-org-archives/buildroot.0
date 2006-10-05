From: Rob Landley <rob@landley.net>
Date: Thu, 5 Oct 2006 13:40:06 -0400
Subject: [Buildroot] LZMA in Buldroot.
In-Reply-To: <20061004192606.GO17455@aon.at>
References: <20061003173002.GA19937@zelow.no> <20061004163742.GA2306@zelow.no>
	<20061004192606.GO17455@aon.at>
Message-ID: <200610051340.06276.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 04 October 2006 3:26 pm, Bernhard Fischer wrote:
> Yes, i left it commented out. I had (and still have) trouble with c++
> due to an alleged bug with libtool on my ubuntu devel host. Probably i'll
> ditch that install and go back to what i usually run as a sensible base
> to work on.

<rant>

It took me a while to figure out what libtool was for, but one of my coworkers 
explained that the purpose of the thing is to make sure that shared libraries 
work as well on Sun and AIX and Hurd and such as they do on Linux.

You'd think that they'd do this by improving library support on other 
platforms rather than breaking Linux's shared library support (at least if 
you use libtool) until the other platforms don't look so bad in comparison.  
But that's not the FSF way.  In the land of the blind, the one-eyed must have 
that eye poked out in the name of fairness and equality.

There is absolutely no reason to use libtool on Linux, and it regularly breaks 
when you're cross-compiling from Linux to Linux on different processors.

</rant>

Rob
-- 
Never bet against the cheap plastic solution.

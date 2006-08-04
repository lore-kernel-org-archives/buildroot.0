From: Rob Landley <rob@landley.net>
Date: Fri, 4 Aug 2006 14:18:16 -0400
Subject: [Buildroot] make troubles
In-Reply-To: <94AB2BC3-0641-400D-9544-89338AD41BE9@cs.auckland.ac.nz>
References: <1154584855.22773.13.camel@turing>
	<200608031639.17238.rob@landley.net>
	<94AB2BC3-0641-400D-9544-89338AD41BE9@cs.auckland.ac.nz>
Message-ID: <200608041418.16879.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 03 August 2006 8:36 pm, Robert Carter wrote:
> I did a svn update to 15773 and ran the build once again with the  
> same result.
> 
> The good news is that when
> 
> BR_PACKAGE_BUSYBOX_SNAPSHOT
> 
> is not set and busybox-1.2.1 is used the build succeeds. So perhaps  
> the problem is with some of the recent 'testing' busybox commits.

I switched on -Werror to break on warnings during the devel cycle, but 
different versions of gcc produce different warnings and most of them are 
entirely spurious.  (The gcc developers have this nasty habit of thinking 
that their compiler is more important that the software it's compiling.  If 
the Linux kernel guys felt that way, we'd need to rebuild the whole of 
userspace with every dot-release...)

I switched them off for 4.1 because lots of the warnings that produces are 
confirmed non-problems that would cost us size to work around.  (If the code 
does "if(a) x=1; else x=thingy();" then x is _not_ uninitialized after that.  
Trust me on this one!)  As far as warnings go it's a deeply broken compiler 
and -Werror just isn't feasible.

With 4.0 it's mostly warning about things which are at least conceivably real 
under certain lighting conditions.

Rob
-- 
Never bet against the cheap plastic solution.

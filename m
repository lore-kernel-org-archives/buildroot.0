From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 28 Feb 2017 13:28:38 +1100
Subject: [Buildroot] Analysis of build results for 2017-02-25
In-Reply-To: <20170227092143.67dc37b6@free-electrons.com>
References: <20170226072845.0954E20755@mail.free-electrons.com>
 <20170226223353.39284983@free-electrons.com>
 <20170227022344.GA6762@tungsten.ozlabs.ibm.com>
 <20170227092143.67dc37b6@free-electrons.com>
Message-ID: <20170228022838.GB10490@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 27, 2017 at 09:21:43AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 27 Feb 2017 13:23:44 +1100, Sam Bobroff wrote:
> 
> > > unresolvable R_PPC64_ADDR64 against `rand@@GLIBC_2.17'
> > > 
> > > Sam, could you have a look ?  
> > 
> > Yes. No idea yet what this problem is but trying to reproduce it now.
> 
> Apparently, the patch https://patchwork.ozlabs.org/patch/727430/ is
> meant to solve this issue.

Ah thanks, so it's a PPC toolchain bug :-( That patch (adding -O0) works
for the test case that's shown in the SUSE bug so it should work, but
from what I understand, -O0 is pretty bad. I did some experimenting
and it looks like -O3 also works around the problem at least for the
test case. What about a patch like the one above but with -O3?

> > > Would be fixed by https://patchwork.ozlabs.org/patch/724932/, but a
> > > better patch was suggested, but never submitted.  
> > 
> > It looks like there is an active upstream and all we need to do is jump
> > through enough hoops, so I'll try pushing Samuel Martin's patch or one
> > like it when I have a bit of time.
> 
> I've proposed an alternative solution here:
> 
>   https://patchwork.ozlabs.org/patch/732614/
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

From: Cyril Bur <cyrilbur@gmail.com>
Date: Mon, 29 Feb 2016 09:22:37 +1100
Subject: [Buildroot] [PATCH] gcc: Add GCC 5.2.x option
In-Reply-To: <20160226093720.7fcd4e10@free-electrons.com>
References: <1456456548-11898-1-git-send-email-cyrilbur@gmail.com>
 <20160226093720.7fcd4e10@free-electrons.com>
Message-ID: <20160229092237.33dabe93@camb691>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Feb 2016 09:37:20 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Cyril,
> 
> On Fri, 26 Feb 2016 14:15:48 +1100, Cyril Bur wrote:
> > GCC 5.3.x introduces a regression with PowerPC Altivec/VSX code generation.
> > 
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69969
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> > I'm not sure if this patch is worth the trouble. By the looks of it the GCC
> > guys are aiming to have a fix in 5.4 and it is unlikely most users are
> > doing things that would result in them hitting the bug.  
> 
> Like we did for previous gcc versions, we only want to support one
> minor version at a time for a given major branch.
> 
> So at the gcc 4 era, it meant we would only package one gcc 4.8, one
> gcc 4.9, etc.
> 
> At the gcc >= 5 era, it means we want to package only one 5.x version,
> one 6.x version, etc.
> 
> If you want to fix the problem without waiting for gcc 5.4, what I can
> suggest is to backport the fixes for the regression you are
> experiencing.

No fix exists yet but yeah upstreaming this patch is definitely more headache
in the long run, I just thought I'd put it out here - it's probably the easiest
fix to this problem (for now) so in the unlikely event that anyone else hits
it, hopefully they'll find this.


Thanks for the response,

Cyril

> 
> Thomas

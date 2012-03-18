From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 16:29:53 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB67031019E4@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB67031019E4@WETMEX10.loepfe.com>
Message-ID: <201203181629.53542.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 16 March 2012 11:36:27 Vellemans, Noel wrote:
> 
> Hi all, 
>  
> I'm struggling some day's now to get Webkit 1.6.3 (and even some later
> versions 1.7.xx.xx ) running on Arm Cortex-A8 (build with GCC 4.5.x, and
> uclibc0.9.33 )
> 
> Compiling is not a problem, this works (with some patches, depending on
> the version of weskit I build I build.)
> 
> 
> BUT: I'm having random crashes (when run the GtkLauncher on the target),
> that I can not explain, or find where it goes wrong.
> 
> It must be in one of the libraries, but because I do not have any
> 'repetitive' core-dumps, it is hard to figure out what is going on, when
> looking at these core dumps. 
> 
> I guess some basic-stuff (like fore example, locking.. or whatever...
> malloc/free... troubles) that is not working, it is to strange what
> happens, in  these core-dumps i never see somthing that is pointing to
> the same crash-reason.
>  
> 
> NOTE: When I do compile Weskit-1.2.7 (that was working before) with the
> same set of libraries/uclibc.... (as I use to build 1.6.3 now), I do get
> 'RANDOM'-crashes as well.

 This probably means that Webkit isn't the problem, but one of the many
libraries it depends upon is.

 Ideally, you should revert everything to the working situation, and then
upgrade the libraries one by one to find the one that is causing the
problem.  Looking at the backtraces, if must be one of gdk, glib, or
uClibc.


> I've included some core-dumps trace-back's (hope this is not to big for
> the mailing-list) maybe someone gets a idea where I can take a look at.

 A segmentation fault in free() generally indicates either a double free
or freeing unallocated memory (e.g. a stack variable).  valgrind may help
to pinpoint the problem.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

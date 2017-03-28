From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 21:37:51 +0200
Subject: [Buildroot] [Bug 9781] New: ti-sgk-km build on kernel >4.1
In-Reply-To: <bug-9781-163@https.bugs.busybox.net/>
References: <bug-9781-163@https.bugs.busybox.net/>
Message-ID: <20170328213751.5098434e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lothar,

Since you initially submitted the ti-sgx-km package, could you have a
look at the below bug report, and see if you could provide a patch?

Thanks a lot!

Thomas

On Mon, 27 Mar 2017 13:31:28 +0000, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=9781
> 
>             Bug ID: 9781
>            Summary: ti-sgk-km build on kernel >4.1
>            Product: buildroot
>            Version: unspecified
>           Hardware: Other
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P5
>          Component: Other
>           Assignee: unassigned at buildroot.uclibc.org
>           Reporter: sbenoit at brioconcept.com
>                 CC: buildroot at uclibc.org
>   Target Milestone: ---
> 
> The ti-gfx-km will not find the dmac function when building.
> Since the prototype has changed file/folder since version higher than 4.1. We
> need to patch the ocfunc.c file and add
> 
> 
> 54a55,57
> > #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4,1,0))
> > #include <../mm/dma.h>
> > #endif  
> 



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

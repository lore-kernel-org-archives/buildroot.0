From: Nathan Lynch <ntl@pobox.com>
Date: Fri, 10 May 2013 09:12:53 -0500
Subject: [Buildroot] [PATCH v2] package-infra: limit the number of //
	jobs
In-Reply-To: <1368194161-27851-1-git-send-email-yann.morin.1998@free.fr>
References: <1368194161-27851-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1368195173.17778.21.camel@orca.stoopid.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2013-05-10 at 15:56 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The current code spawns as many jobs as up to twice the number of CPUs.
> 
> On small-class machines like laptops, with a limitted amount of memory,
> but still a few CPUs (real or hyperthreads), the HDD becomes a bottleneck,
> and it becomes almost impossible to do anythiong else while there is a
> build in progress.
> 
> Limit the number of jobs to the number of CPUs plus one.
> 
> Even on fast machines with fast HDDs, this settings keeps the machine
> fully busy (for those packages that can build in parallel, of course).
> 
> For example, building qemu or the linux kernel kept my hyperthreaded
> hexa Core i7 with 18GiB of RAM, busy at 99% (I never ever managed to
> get 100% even with more jobs, not even 200); while on my hyperthreaded
> dual Core i5 with only 4GiB and a slow HDD, I still topped at 100% CPU,
> while still able to do some work involving the HDD.
> 
> If the number of processors is not available, assume one.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Nathan Lynch <ntl@pobox.com>

Reviewed-by: Nathan Lynch <ntl@pobox.com>

Thanks Yann.

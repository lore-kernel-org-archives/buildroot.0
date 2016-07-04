From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 17:24:18 +0200
Subject: [Buildroot] [PATCH] package/dvblast: fix static linking
In-Reply-To: <1467645076-13092-1-git-send-email-yann.morin.1998@free.fr>
References: <1467645076-13092-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160704172418.2f2e11d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 17:11:16 +0200, Yann E. MORIN wrote:
> dvblast uconditionally believes that any Linux system will have support
> for clock nanosleep().
> 
> However, clock_nanosleep() is only availabe with NPTL.
> 
> Fixing dvblast is not really complicated, but not trivial either. So we
> jsut make it depend on NPTL.

jsut -> just

Also, the title was wrong: you're not fixing static linking, but build
on non-NPTL platforms. So I fixed that up and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

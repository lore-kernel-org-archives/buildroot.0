From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Feb 2017 12:08:53 +0100
Subject: [Buildroot] [PATCH] package/mpv: fix build on ppc64
In-Reply-To: <1487498952-30688-1-git-send-email-yann.morin.1998@free.fr>
References: <1487498952-30688-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170219120853.0210ac15@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 11:09:12 +0100, Yann E. MORIN wrote:
> Our current patch was done on a previous version of mpv. Since then, the
> include-path has changed, and stdbool is already included earlier. So,
> including it again will serve no purpose...
> 
> So, the bool type defined in the altivec case is back to bite, and it is
> not any happier than before.
> 
> We fix our patch to simply redefine bool to the correct type, but just
> in the altivec case.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/e91/e914bc0f955e4ba740614f93cbfa401b673b754b/
>     http://autobuild.buildroot.org/results/4c1/4c150fedc74530d09e8ecd678dcf5664251606e7/
>     and countless others...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

We have a different proposal from Sam:

  https://patchwork.ozlabs.org/patch/706869/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 15:53:09 +0200
Subject: [Buildroot] [PATCH v3 2/2] gcc: apply patches stored in global
 patches directories
In-Reply-To: <1460521232-28778-3-git-send-email-hchunhui@mail.ustc.edu.cn>
References: <1460521232-28778-1-git-send-email-hchunhui@mail.ustc.edu.cn>
 <1460521232-28778-3-git-send-email-hchunhui@mail.ustc.edu.cn>
Message-ID: <20160703155309.4012a0d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 04:20:32 +0000, Chunhui He wrote:
> When building host gcc, patches stored in global patches directories
> are skipped.
> This patch fixes the unexpected behavior.
> 
> Signed-off-by: Chunhui He <hchunhui@mail.ustc.edu.cn>
> ---
>  package/gcc/gcc.mk | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

We had some pretty lengthy discussion today with Peter and Yann about
this patch, arguing about the various possibilities to solve this
problem. In the end, even though your solution is a bit of a hack, it's
the one that is the easiest in terms of on-going maintenance, so I
applied your patch after doing some minor modifications:

    [Thomas:
     - rename the loop variable from 'D' to 'patchdir'
     - add some additional comments
     - remove final ; at end of loop when applying the patches, since it's
       not needed]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

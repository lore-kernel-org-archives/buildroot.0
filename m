From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 21:21:25 +0200
Subject: [Buildroot] [PATCH 2/2] logrotate: fix up build error with gcc 6
In-Reply-To: <1471539849-3766-2-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471539849-3766-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1471539849-3766-2-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160818212125.1cb8e7ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 22:34:09 +0530, Rahul Bedarkar wrote:
> With gcc version 6, we see following warning.
> 
>   config.c: In function 'strndup':
>   config.c:87:10: error: nonnull argument 's' compared to NULL [-Werror=nonnull-compare]
>           if(!s)
>             ^
>   cc1: all warnings being treated as errors
> 
> strndup is declared with nonnull attribute for first parameter. In such
> cases, gcc 6 warns when we check for nonnull explicitly. So drop the
> check for nonnull.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6dc/6dc2eb22104076920d77425b1e608ef9b9e01c94/
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Can this apply without the 3.10.0 bump?

Indeed PATCH 2/2 being a bug fix, it would be a candidate for the
"master" branch, while PATCH 1/2 being a version bump, we can only
commit it to the "next" branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

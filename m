From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:55:19 +0200
Subject: [Buildroot] [PATCH] squeezelite: needs NPTL
In-Reply-To: <20160818062704.GA28543@waldemar-brodkorb.de>
References: <20160818062704.GA28543@waldemar-brodkorb.de>
Message-ID: <20160818235519.56066f92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 08:27:04 +0200, Waldemar Brodkorb wrote:
> It uses PTHREAD_PRIO_INHERIT, which isn't available in Linuxthreads.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/455/455465c332d291929c1612d18a9e7448d9c76e73/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/squeezelite/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, after fixing the issue pointed by Baruch (the NPTL
dependency is not about alsa-lib).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 22:58:53 +0200
Subject: [Buildroot] [PATCH v2] package/libnss: fix build failure on
 arm32 arch not armv7
In-Reply-To: <20200403201021.44350-1-giulio.benetti@benettiengineering.com>
References: <03ce40bf-188e-80d9-e313-d33cd677f029@benettiengineering.com>
 <20200403201021.44350-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200404225853.23c43aaa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Apr 2020 22:10:21 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> NSS assumes that every neon arm32 build is an armv7, but this is
> not always true(i.e. build arm32 for armv8), so let's add a patch to
> remove -march=armv7 flag when building gcm-arm32-neon.c
> 
> Fixes:
> http://autobuild.buildroot.net/results/464/464044fda2850123339de6c8071374e380636ee0/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * update with upstreamed patch:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1624864
> * improve commit log
> ---
>  ...t-force-ARMv7-for-gcm-arm32-neon-r-j.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch

Applied to master with an updated reference to the upstream patch, as
suggested by Peter Seiderer.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

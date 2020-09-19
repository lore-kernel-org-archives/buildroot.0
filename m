From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:17:00 +0200
Subject: [Buildroot] [git commit] package/micropython: fix build with
 gcc 4.8
In-Reply-To: <20200919120439.145B08572F@busybox.osuosl.org>
References: <20200919120439.145B08572F@busybox.osuosl.org>
Message-ID: <20200919141700.1f9b3854@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Sep 2020 14:13:50 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=50c66003673c6b84481db04ec2bda10093fd822b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> micropython uses -Wfloat-conversion since version 1.13 and
> https://github.com/micropython/micropython/commit/30840ebc9925bb8ef025dbc2d5982b1bfeb75f1b
> 
> This will result in the following build failure with gcc 4.8:
> arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wfloat-conversion'
> 
> To avoid this build failure, set CWARN to an empty value moreover, while
> at it, move some duplicated variables under MICROPYTHON_MAKE_OPTS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6fe5a5ab91a5d235147e74461bb165ec2cfdc967
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/micropython/micropython.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

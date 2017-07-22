From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:34:06 +0200
Subject: [Buildroot] [PATCH 06/20] system: move setting getty to the
 corresponding init systems
In-Reply-To: <f00f1e7daced126edc573f652b97e9228b347615.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f00f1e7daced126edc573f652b97e9228b347615.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <20170722223406.6f214502@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 19:25:32 +0200, Yann E. MORIN wrote:
> Currently, setting the getty is done:
>   - by the skeleton package when the init system is either busybox or
>     sysvinit;
>   - by the systemd package when the init system is systemd;
> both by registering a target-finalize hook.
> 
> This is not very consistent.
> 
> Move setting the getty out of the skeleton and into the package that
> provides the init system, by registering a per-package target-fialize
> hook.
> 
> This offloads yet a bit more out of the skeleton, so that it is easier
> to properly separate the skeletons for the various init systems.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/busybox/busybox.mk   | 12 +++++++++++-
>  package/skeleton/skeleton.mk | 22 ----------------------
>  package/sysvinit/sysvinit.mk |  8 ++++++++
>  system/system.mk             | 11 +++++++++++
>  4 files changed, 30 insertions(+), 23 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

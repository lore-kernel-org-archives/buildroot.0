From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:36:17 +0200
Subject: [Buildroot] [PATCH 07/20] system: move remounting / to the
 corresponding init systems
In-Reply-To: <db57282a925ddcf70a8fca8631ae62347b04c175.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <db57282a925ddcf70a8fca8631ae62347b04c175.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <20170722223617.06af2b1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 19:25:33 +0200, Yann E. MORIN wrote:
> Currently, remounting / read-write (or not) is done by the skeleton
> package when the init system is eitehr busybox or sysvinit, by
> registering a target-finalize hook; it is not done at all for systemd.
> 
> Move registering this target-finalize hook to both of busybox and
> sysvinit. Leave systemd alone, we'll take care of it later.
> 
> Rename the macro to a more meaningful name, and move it to system.mk
> with the other such macros.
> 
> Yet a little bit less init-system knowledge in the skeleton.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/busybox/busybox.mk   |  3 +++
>  package/skeleton/skeleton.mk | 15 ---------------
>  package/sysvinit/sysvinit.mk |  3 +++
>  system/system.mk             | 15 +++++++++++++++
>  4 files changed, 21 insertions(+), 15 deletions(-)

Applied to master, after dropping the two comments, as pointed by
Arnout.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

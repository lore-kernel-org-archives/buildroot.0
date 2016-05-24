From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 20:50:52 +0200
Subject: [Buildroot] [PATCH] package/lxc: add patch to fix musl build
In-Reply-To: <1463721348-13936-1-git-send-email-joerg.krause@embedded.rocks>
References: <1463721348-13936-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160524205052.1902eff8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 May 2016 07:15:48 +0200, J?rg Krause wrote:
> Add a patch to fix a build issue with the musl C library.
> 
> struct in6_addr is both defined in the C library header <netinet/in.h> and the
> Linux kernel header <linux/in6.h>.
> 
> lxc_user_nic.c includes both <netinet/in.h> and <linux/if_bridge.h>. The later
> one includes <linux/in6.h>.
> 
> This breaks build with the musl libc:
>   error: redefinition of ?struct in6_addr?
> 
> As lxc_user_nic.c does not use any references from <linux/if_bridge.h> it is
> safe to remove this header.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f32/f321823be6b477be7dc55393e563a3a61794265d/
> http://autobuild.buildroot.net/results/8ab/8ab2dc8e0634fbfb582db94cdf94cee5712711f9/
> http://autobuild.buildroot.net/results/e27/e27d637b1bb7278ae30d86a72a2d88432d805d2c/
> .. and more.
> 
> Upstream status: Pending
> https://github.com/lxc/lxc/pull/1029
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../0002-Fix-redefinition-of-struct-in6_addr.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

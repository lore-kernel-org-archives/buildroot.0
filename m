From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:42:21 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: do not default to
 any version for custom headers
In-Reply-To: <1467389013-24303-1-git-send-email-yann.morin.1998@free.fr>
References: <1467389013-24303-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160701224221.2d8b9ef6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:03:33 +0200, Yann E. MORIN wrote:
> Currently, for a custom headers version, or for the same headers as the
> kernel, wedefault to a "very old" version (i.e. 2.6.x in practice).
> 
> However, as Vivien explained, when using the same headers as the kernel,
> and the kernel is set to use the default version (aka latest version
> known to Buildroot) of the kernel, one would expect the headers are
> automatically tracking the latest version. Off course, that expectation
> is broken because of the above.
> 
> However, whatever version we default to, it will probably not be
> correct, whether we default to the latest version or to the "very old"
> version.
> 
> So, simply drop the specific default version, so the default is now the
> latest version.
> 
> Note: that has the potential to break existing defconfig files that
> relied on the "very old" version to be the default. Well, whatever,
> they'll get a build failre quite early, and it is easy to fix.
> 
> Reported-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/linux-headers/Config.in.host | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

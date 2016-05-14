From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 15:22:58 +0200
Subject: [Buildroot] [PATCH] glmark2: narrow down libgl requirements
In-Reply-To: <1460719846-1046-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460719846-1046-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160514152258.295ea6f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 08:30:46 -0300, Gustavo Zacarias wrote:
> Mesa3d DRI drivers can be enabled without support for libgl (for
> example without x11). So make glmark2 gl (x11) support depend on
> BR2_PACKAGE_HAS_LIBGL being present as well.
> It doesn't exactly mean mesa3d providing libgl, but since we can't have
> more than one libgl provider at the same time it's equivalent.
> This is fallout from f1894ec95728806e09405d26663e0ea371afaeab which
> enabled DRI drivers for non-xorg builds. Fixes:
> http://autobuild.buildroot.net/results/174/1743ee5a340e5f4b1f8519e0b11eb196caa4f30e/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glmark2/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

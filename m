From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:56:06 +0200
Subject: [Buildroot] [PATCH] connman: add patch to fix build with
 headers >= 4.5
In-Reply-To: <1460643843-26057-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460643843-26057-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160415095606.189893ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Apr 2016 11:24:03 -0300, Gustavo Zacarias wrote:
> Add a patch from Gentoo that fixes the build on linux headers >= 4.5
> The probem arises from an incompatibility in newer headers when both
> net/if.h and linux/if.h are included in the same source.
> See https://bugs.gentoo.org/show_bug.cgi?id=577584
> 
> Fixes:
> http://autobuild.buildroot.net/results/48e/48e6f34a7940f52d987db47784c0d9e82f39de7c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/connman/0003-xtables.patch | 61 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/connman/0003-xtables.patch

Applied, thanks! I guess it's the same problem as the one affecting
strongswan, which was recently resolved by disabling iptables support.
Correct? If you have a better fix for strongswan, feel free to submit
it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2015 16:18:18 +0200
Subject: [Buildroot] [PATCH] u-boot: 2015.07 - fix creation of .config
In-Reply-To: <1438351475-14447-1-git-send-email-abrodkin@synopsys.com>
References: <1438351475-14447-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150731161818.2056383e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Fri, 31 Jul 2015 17:04:35 +0300, Alexey Brodkin wrote:
> Due to recent changes in U-Boot, see
> http://git.denx.de/?p=u-boot.git;a=commit;h=a26cd04920dc069fd6e91abb785426cf6c29f45f
> re-creation of .config from defconfig by "make oldconfig" happened
> incorrectly.

Hum, reverting an upstream patch doesn't really seem like a proper
solution for the problem. Also, it will only fix the problem for those
using exactly U-Boot 2015.07, but not for the majority of users who
have to use a vendor-specific U-Boot version (unfortunately).

So I believe we need to fix this properly, not by reverting an upstream
patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

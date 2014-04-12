From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 17:41:41 +0200
Subject: [Buildroot] [PATCH] linphone: arc: Undefine __arc__ when
 building for ARC processors
In-Reply-To: <1396627478-13712-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <1396627478-13712-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140412174141.5288aec0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Fri,  4 Apr 2014 20:04:38 +0400, Anton Kolesov wrote:
> This patch is similar to 821a6d63. Libexosip2 defines symbol __arc__, which
> gets in contradiction with same symbol defined by the GCC for the Synopsys
> DesignWare ARC cores. Previous patch undefined __arc__ for libosip2 and
> libexosip2, however linphone includes headers from libexosip2, which causes
> build failure unless same patch is applied to it.
> 
> This patch fixes
> http://autobuild.buildroot.net/results/0d2e19d40d6d0df4048e6ebae5f77022f89ca7cb/
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> ---
>  package/linphone/linphone.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

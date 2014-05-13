From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 23:38:17 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: Remove ldconfig calls
In-Reply-To: <1400013313-2281-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400013313-2281-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140513233817.3fed1500@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

Thanks a lot for looking into this issue!

On Tue, 13 May 2014 22:35:13 +0200, Bernd Kuhls wrote:
> ldconfig breaks links created by gpu-viv-bin-mx6q.
> 
> fixes
> http://autobuild.buildroot.net/results/ab5/ab57dd3729d529366808cbfc802f49360b2ec2b9/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/netsnmp/netsnmp-002-no_ldconfig.patch |   50 +++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/netsnmp/netsnmp-002-no_ldconfig.patch
> 
> diff --git a/package/netsnmp/netsnmp-002-no_ldconfig.patch b/package/netsnmp/netsnmp-002-no_ldconfig.patch
> new file mode 100644
> index 0000000..10f33d8
> --- /dev/null
> +++ b/package/netsnmp/netsnmp-002-no_ldconfig.patch
> @@ -0,0 +1,50 @@
> +Running ldconfig breaks links created by gpu-viv-bin-mx6q
> +
> +patch inspired by
> +https://dev.openwrt.org/browser/packages/libs/net-snmp/patches/160-no_ldconfig.patch?rev=17091
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Do you think and upstreamable version of this patch is possible?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

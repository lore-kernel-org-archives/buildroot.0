From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 23:03:27 +0100
Subject: [Buildroot] [PATCH v2] lldpd: new package
In-Reply-To: <1453201853-31045-1-git-send-email-julien.floret@6wind.com>
References: <20160118211309.057d1922@free-electrons.com>
 <1453201853-31045-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20160120230327.058a99c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Floret,

On Tue, 19 Jan 2016 12:10:53 +0100, Julien Floret wrote:
> lldpd is a 802.1ab implementation (LLDP) to help you locate neighbors
> of all your equipments.
> 
> LLDP is an industry standard protocol designed to supplant
> proprietary Link-Layer protocols such as EDP or CDP. The goal of LLDP
> is to provide an inter-vendor compatible mechanism to deliver
> Link-Layer notifications to adjacent network devices.
> 
> https://vincentbernat.github.io/lldpd/
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
> Changes v1 -> v2:
>   - rename BR2_PACKAGE_LLDPD_CUSTOM to BR2_PACKAGE_LLDPD_CUSTOM_TLV
>   - explicitely disable privsep, xml, snmp, json, seccomp
>   - remove LLDPD_SOURCE (same as default value)
>   - add LLDPD_LICENSE_FILES
>   - remove localstatedir configure option (same as default value)
>   - use preferred configure option format (with/without, enable/disable)
>   - simplify conditionals for configure options

I've applied, with some minor additional changes:

    [Thomas:
     - add depends on BR2_USE_MMU, since fork() is used
     - rewrap Config.in help text]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:20:16 +0100
Subject: [Buildroot] [PATCH v3,
 2/2] lxc: fix build without stack protector
In-Reply-To: <20181204201553.11463-2-fontaine.fabrice@gmail.com>
References: <20181204201553.11463-1-fontaine.fabrice@gmail.com>
 <20181204201553.11463-2-fontaine.fabrice@gmail.com>
Message-ID: <20181206212016.3bb66b83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Dec 2018 21:15:53 +0100, Fabrice Fontaine wrote:
> Stack protector has been added in version 3.0.3 by
> https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a
> 
> However, some compilers could missed the needed library (-lssp or
> -lssp_nonshared) at linking step so use ax_check_link_flag instead of
> ax_check_compile_flag
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Baruch Siach):
>  - Add patch to use ac_check_link_flag

Applied to master, thanks. I think you could submit upstream, it's a
fix that makes sense to have.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

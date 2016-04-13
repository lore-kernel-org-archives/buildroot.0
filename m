From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:14:49 +0200
Subject: [Buildroot] [PATCH v4] ipmitool: fix musl build
In-Reply-To: <1460403231-6036-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460403231-6036-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160413231449.42202da6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Apr 2016 21:33:51 +0200, J?rg Krause wrote:
> Add two patches to fix musl build and one patch to make the package
> autoreconfigurable.
> 
> The first patch adds 'foreign' to 'AUTOMAKE_OPTIONS' to make the package
> autoreconfigurable.
> 
> The second patch avoids the redefinition of wchar_t by using autoconf to check
> for the type wchar_t. Patching configure.ac requires to set AUTORECONF = YES
> and add a post extract hook to create some missing files needed by autorefonf.
> 
> The third patch adds missing header include of <linux/params.h> needed for the
> macro EXEC_PAGESIZE defined in the Linux Kernel headers.
> 
> All patches send upstream:
> https://sourceforge.net/p/ipmitool/mailman/message/35004711/
> https://sourceforge.net/p/ipmitool/mailman/message/35007331/
> https://sourceforge.net/p/ipmitool/mailman/message/35007330/
> 
> Fixes:
> http://autobuild.buildroot.net/results/75f/75fd6f1be0271bb15078c62f3effdbb67ac07427/
> http://autobuild.buildroot.net/results/cac/cacf8179a9c8142eef69562462d3c3b0b20c2879/
> http://autobuild.buildroot.net/results/c10/c1045882947ff7150c750088ae1981bd99134c54/
> http://autobuild.buildroot.net/results/6a7/6a770f8a3dddb15ba4d95555e74b198799278dcf/
> .. and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v3 -> v4:
>  - Remove check for _WCHAR_T which is redundant and potentially wrong (Arnout
>    Vandecappelle)
>  - reorder patches, so the autoreconfigurable patch is applied first before the
>    two patches fixing musl build actually

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

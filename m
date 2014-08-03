From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 14:38:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltrace: Fix "unmet direct
 dependencies"
In-Reply-To: <1407065792-19859-1-git-send-email-bernd.kuhls@t-online.de>
References: <1407065792-19859-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140803143830.5c5d3417@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  3 Aug 2014 13:36:32 +0200, Bernd Kuhls wrote:
> Fixes build error in elfutils
> http://autobuild.buildroot.net/results/37f/37f87ad7ba087d42d0001f55305f7468c2a172b6/
> 
> eblwstrtab.c:(.text+0x43): undefined reference to `wmempcpy'
> eblwstrtab.c:(.text+0x1ba): undefined reference to `wcslen'
> eblwstrtab.c:(.text+0x2df): undefined reference to `wmemcmp'
> 
> because ltrace did not take into account that elfutils depends on
> BR2_LARGEFILE & BR2_USE_WCHAR. This is also visible here:
> 
> wget http://autobuild.buildroot.net/results/37f/37f87ad7ba087d42d0001f55305f7468c2a172b6/defconfig
> make defconfig BR2_DEFCONFIG=defconfig
> 
> warning: (BR2_PACKAGE_LTRACE) selects BR2_PACKAGE_ELFUTILS which has unmet direct
> dependencies (BR2_LARGEFILE && BR2_USE_WCHAR && !BR2_avr32 && !BR2_bfin)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks! However, you forgot to add the comment for the
new dependencies, so I've added it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

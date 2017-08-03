From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Aug 2017 09:06:30 +0200
Subject: [Buildroot] [PATCH v3] imx6q-sabresd: Add a qt5 defconfig
	variant
In-Reply-To: <1498078187-32377-1-git-send-email-festevam@gmail.com>
References: <1498078187-32377-1-git-send-email-festevam@gmail.com>
Message-ID: <47e21512-545b-5183-7397-844035c9818f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-06-17 22:49, Fabio Estevam wrote:
> Introduce imx6q-sabresd_qt5_defconfig that supports the opensource
> Etnaviv graphical stack.
> 
> This defconfig provides a way to quickly test some graphical applications,
> such as kmscube, qt5, glmark2.
> 
> Currently kernel mainline exhibits issues when running cpufreq as ondemand
> governor on mx6, so add a linux fragment that disables such option for the
> time being.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

 Hi Fabio, I applied to next, with a lot of changes:

     - Add Fabio to DEVELOPERS
     - Rename linux config fragment to linux_qt5.fragment
     - Add comment to linux_qt5.fragment why it is needed
     - Add explicit CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y to it
     - Reorder defconfig entries to they match imx6q-sabresd_defconfig
     - Remove strace and host-uboot-tools, neither seems to be needed
     - Drop BR2_PACKAGE_QT5BASE_LICENSE_APPROVED, it no longer exists
     - Replace BR2_TARGET_ROOTFS_EXT2_BLOCKS with BR2_TARGET_ROOTFS_EXT2_SIZE
     - Regenerate .gitlab-ci.yml

 Could you re-test based on the next branch?

 Also, you set BR2_TOOLCHAIN_BUILDROOT_GLIBC=y but none of the packages selected
seem to need it. Is there a reason why it is needed? Could you either remove it
(after testing with uClibc-ng) or add a comment why it is needed and remove
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

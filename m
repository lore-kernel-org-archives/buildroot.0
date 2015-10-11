From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 14:47:01 +0200
Subject: [Buildroot] [PATCH 1/2] wpa_supplicant: Add an explicit option
 to enable nl80211.
In-Reply-To: <1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <20150713112947.7e14fd64@free-electrons.com>
 <1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20151011144701.66672b8e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Cavallari,

On Thu, 16 Jul 2015 15:02:33 +0200, Nicolas Cavallari wrote:
> Currently, nl80211 support is conditional with libnl being enabled,
> using implicit dependencies.  This causes problems since it is not
> obvious and wpa_supplicant without nl80211 isn't what most user expects.
> 
> If nl80211 isn't enabled, then buildroot only enables the wext driver,
> which will only work if some deprecated kernel feature isn't left
> disabled, or if using a outdated out-of-tree linux driver which doesn't
> use the cfg80211 infrastructure.
> 
> This makes nl80211 support an explicit option, which
> "select BR2_PACKAGE_LIBNL" accordingly.  To handle upgrades nicely, it
> would have been nice to have "default y if BR2_PACKAGE_LIBNL", but
> Kconfig treats this as a circular dependency.  So instead, this enables
> the option by default, which is less worse than not enabling nl80211
> when it was previously implicitly enabled.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/wpa_supplicant/Config.in         | 16 ++++++++++++++++
>  package/wpa_supplicant/wpa_supplicant.mk |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)

I've applied after doing some minor fixes:

    [Thomas:
     - rewrap Config.in help text
     - add comment about thread dependency.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

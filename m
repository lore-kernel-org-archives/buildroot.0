From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 17 Sep 2015 17:26:03 +0200
Subject: [Buildroot] [1/2,
 v2] wpa_supplicant: Add an explicit option to enable nl80211.
In-Reply-To: <1437119950-25976-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <1437119950-25976-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20150917152603.GA28602@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

On Fri, Jul 17, 2015 at 09:59:09AM +0200, Nicolas Cavallari wrote:
> Currently, nl80211 support is conditionnal with libnl being enabled,
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
> when it was previously implicitely enabled.

Actually I like the fact that it is enabled by default. As you said,
most users now want NL80211.

Only one remark, why are there two spaces after every dots in your
commit logs. Is it a custom git hook? ;-)

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary

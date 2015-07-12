From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 19:25:52 +0200
Subject: [Buildroot] [PATCH v2] wpa_supplicant: Add NL80211 support
 option
In-Reply-To: <1407514672-6231-1-git-send-email-jtheou@adeneo-embedded.us>
References: <1407514672-6231-1-git-send-email-jtheou@adeneo-embedded.us>
Message-ID: <20150712192552.23e76408@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jean-Baptiste Theou,

On Fri, 8 Aug 2014 09:17:52 -0700, Jean-Baptiste Theou wrote:
> When you select wpa_supplicant, having an visual indication about the
> support or not of NL80211 is important.
> 
> And even if libnl is available, you may want to disable the support of
> NL80211 inside wpa_supplicant.

You forgot your Signed-off-by here. But we anyway have more comments
below.

> +config BR2_PACKAGE_WPA_SUPPLICANT_NL80211
> +	bool "Enable NL80211"
> +	default y if BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  Enable support for NL80211.

In which cases would you want to *not* have NL80211 support if you
already have libnl enabled? What is the reason/use-case?

If the NL80211 support in wpa_supplicant itself adds a significant
binary size to the filesystem, then it might be useful to have an
option such as the one you propose. But in this case, you should
include some numbers in your commit log.

Also, your patch keeps the automatic dependency handling of libnl, and
adds explicitly dependency handling on top of it, which doesn't make a
lot of sense: it should really be either one or the other solution, not
both.

You can also see slide 146 and following of
http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
for more details about automatic or explicit handling of optional
dependencies.

In the mean time, we'll mark your patch as Rejected in patchwork. Don't
hesitate to resubmit a patch with a better explanation, and a cleanup
of automatic vs. explicit handling of the libnl dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

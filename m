From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:27:04 +0100
Subject: [Buildroot] [PATCH v1] package/bluez5_utils: Allow user to
 enable disabled plugins
In-Reply-To: <20170315225014.6427-1-andriy.shevchenko@linux.intel.com>
References: <20170315225014.6427-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20170319212704.2982ddc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Mar 2017 00:50:14 +0200, Andy Shevchenko wrote:

> +config BR2_PACKAGE_BLUEZ5_PLUGINS_MIDI
> +	bool "build midi plugin"
> +	select BR2_PACKAGE_ALSA_LIB

Are you sure BR2_PACKAGE_ALSA_LIB is sufficient? Have you tried
building with all alsa-lib sub-options disabled (they are enabled by
default, so you may have missed it). Especially, I am wondering if
BR2_PACKAGE_ALSA_LIB_RAWMIDI is not needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

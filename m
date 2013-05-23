From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 16:56:01 +0200
Subject: [Buildroot] [PATCH 1/1] gpsd: Add config options for USB,
 Bluetooth, Qt.
In-Reply-To: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
References: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
Message-ID: <20130523165601.5fc0fe15@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arn R,

On Fri, 24 May 2013 00:43:01 +1000, Arn R wrote:
> These options can now be disabled individually.
> Previously, these options were simply enabled if the package they
> depended on was also enabled. By default they will still be enabled
> if the packages they depend on are enabled.

Well, we have a fuzzy boundary on how to handle this, we've discussed
that not long ago with Arnout. Which problem are you seeing with the
current situation (i.e, without your patch) ?

When possible and when it makes we generally try to auto-detect when we
can enable a particular feature, as you've seen in gpsd.mk.

Anyway, some comments below:

> +config BR2_PACKAGE_GPSD_BLUETOOTH_DEV
> +	bool "allow GPS devices via Bluetooth"
> +	default y

This should not be enabled by default.

> +	depends on BR2_PACKAGE_BLUEZ_UTILS

This should be a select.

And ditto for the other options.

I see what you wanted to achieve: something that's automatically
enabled when for example bluez-utils is enabled, so that the existing
behavior is preserved. But for package sub-options, they are generally
disabled by default and they select whichever dependency they need.

Let's wait the opinion of others to see how to handle this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

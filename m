From: Arn R <arnerro@gmail.com>
Date: Fri, 24 May 2013 01:30:14 +1000
Subject: [Buildroot] [PATCH 1/1] gpsd: Add config options for USB,
 Bluetooth, Qt.
In-Reply-To: <20130523165601.5fc0fe15@skate>
References: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
 <20130523165601.5fc0fe15@skate>
Message-ID: <CAD0gWNZA=e-iQ+G98P5Hgi1Z_OBK0=P6TiHJ-+X0S_D+fih0PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, May 24, 2013 at 12:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Well, we have a fuzzy boundary on how to handle this, we've discussed
> that not long ago with Arnout.

Could you point me to the thread where you discussed it?

> Which problem are you seeing with the
> current situation (i.e, without your patch) ?

There is no serious problem, this is more a matter of micro-management :)
For example, I don't use the Qt binding (even though Qt is present in
my build) so I simply do not want it present in the filesystem. My gps
module is connected to a plain UART port (but I use BlueZ for another
bluetooth device), so I have no need for the Bluetooth or USB gps
support. Since GPSd provided explicit options to enable/disable these
very features I thought I may as well provide access to those options.


> When possible and when it makes we generally try to auto-detect when we
> can enable a particular feature, as you've seen in gpsd.mk.
>
> Anyway, some comments below:
>
> > +config BR2_PACKAGE_GPSD_BLUETOOTH_DEV
> > +     bool "allow GPS devices via Bluetooth"
> > +     default y
>
> This should not be enabled by default.
>
> > +     depends on BR2_PACKAGE_BLUEZ_UTILS
>
> This should be a select.
>
> And ditto for the other options.
>
> I see what you wanted to achieve: something that's automatically
> enabled when for example bluez-utils is enabled, so that the existing
> behavior is preserved. But for package sub-options, they are generally
> disabled by default and they select whichever dependency they need.
>
> Let's wait the opinion of others to see how to handle this.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

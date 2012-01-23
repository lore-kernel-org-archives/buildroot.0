From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2012 22:21:50 +0100
Subject: [Buildroot] [PATCH 00/14] Add EFL packages to buildroot
In-Reply-To: <CAFbHwiQEzOV7_wK647kRDjXZTWxEEPjnXo3uLfpOk=u1AbxszQ@mail.gmail.com>
References: <CAFbHwiQEzOV7_wK647kRDjXZTWxEEPjnXo3uLfpOk=u1AbxszQ@mail.gmail.com>
Message-ID: <20120123222150.7f28bf58@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jan 2012 16:35:06 +0000,
Will Newton <will.newton@gmail.com> a ?crit :

> This series is a reworked version of the previous series. It takes
> into account review comments by Arnout Vandecappelle, fixes some bugs
> and also adds some new packages, efreet, ethumb elementary and edbus.
> 
> There are 3 patches to non-EFL packages that are required, a host
> version of libjpeg and lua must be built and the xcb-util libraries
> need to be installed into staging.

Good to see EFL getting into Buildroot.

Many of your packages have a host variant, but do not defined any
HOST_... information, and the host variant appears to be unused. Take
libembryo for example, it declares a host variant, but does not define
any HOST_LIBEMBRYO_DEPENDENCIES. Is this normal?

It looks like some of the packages for the host are needed to build
edje-cc and eet-eet for the host. This could be explained somewhere.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

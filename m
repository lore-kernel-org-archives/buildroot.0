From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 25 Jul 2014 18:34:10 -0400
Subject: [Buildroot] tzdata when using a custom seleton
Message-ID: <CANxTyt6Kew54xGwwRxQnHaeZ-CH4-SbKoMgkwSMKytRX9Z-mmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I recently started to update our buildroot at work from 2013.02 to
2014.05, and ran into a tzdata issue - still present with the latest
today.  I am using a custom skeleton.  Previously, I was able to use
the tzdata package to get time zone files into my rootfs.  It seems
like I can't do that anymore because those options are shown only when
using the default skeleton.

I think that this comes from commit
d6a37917dde1293f6e25d87801283e098c22d580, "system: make the zoneinfo
list a system option", when the timezone list moved from
tzdata/Config.in to system/Config.in, changing names along the way.

Is it intentional that configurations using custom skeletons can no
longer install time zone files?  Or is it just a side effect of where
the moved settings are in system/Config.in?

Danomi -

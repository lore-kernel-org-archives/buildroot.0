From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 17:46:30 +0200
Subject: [Buildroot] [PATCH 1/1] gpsd: Add config options for USB,
 Bluetooth, Qt.
In-Reply-To: <CAD0gWNZA=e-iQ+G98P5Hgi1Z_OBK0=P6TiHJ-+X0S_D+fih0PQ@mail.gmail.com>
References: <1369320181-6069-1-git-send-email-arnerro@gmail.com>
 <20130523165601.5fc0fe15@skate>
 <CAD0gWNZA=e-iQ+G98P5Hgi1Z_OBK0=P6TiHJ-+X0S_D+fih0PQ@mail.gmail.com>
Message-ID: <20130523174630.0c7efe41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arn R,

On Fri, 24 May 2013 01:30:14 +1000, Arn R wrote:
> Hi Thomas,
> 
> On Fri, May 24, 2013 at 12:56 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Well, we have a fuzzy boundary on how to handle this, we've
> > discussed that not long ago with Arnout.
> 
> Could you point me to the thread where you discussed it?

See http://lists.busybox.net/pipermail/buildroot/2013-May/072318.html
from Arnout, and my reply at
http://lists.busybox.net/pipermail/buildroot/2013-May/072335.html.

> > Which problem are you seeing with the
> > current situation (i.e, without your patch) ?
> 
> There is no serious problem, this is more a matter of
> micro-management :) For example, I don't use the Qt binding (even
> though Qt is present in my build) so I simply do not want it present
> in the filesystem. My gps module is connected to a plain UART port
> (but I use BlueZ for another bluetooth device), so I have no need for
> the Bluetooth or USB gps support. Since GPSd provided explicit
> options to enable/disable these very features I thought I may as well
> provide access to those options.

I see, thanks for your feedback on this use case.

We have two options here:

 1) Either declare that adding such options would add too many options
    to all the packages, and that such special modifications should be
    left to local modifications.

 2) Or add many more configuration options to packages.

Maybe (2) is what makes sense here. The cost of new options in terms of
maintenance is not so high, so maybe that's what we should do. I don't
know.

Peter, Arnout?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

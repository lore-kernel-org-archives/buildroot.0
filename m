From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:08:34 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <CAJX3zAuwNz7zzdrxupT+o_ZWR7AYRrk6h1XpRuYHk778pMU0ZQ@mail.gmail.com>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
 <20191111213154.19409-2-avraham.shukron@gmail.com>
 <20191112220534.531a470f@windsurf>
 <CAJX3zAuwNz7zzdrxupT+o_ZWR7AYRrk6h1XpRuYHk778pMU0ZQ@mail.gmail.com>
Message-ID: <20191115220834.56a3e732@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Nov 2019 22:22:00 +0200
Avraham Shukron <avraham.shukron@gmail.com> wrote:

> Your suggestion works. If python3 is selected - host-python3 is used.
> BUT - host-qemu also depends on host-libglib2 which depends on host-meson
> which depends on python3,

True. But then, how did you get build issues when building qemu ? I
mean, your v3 in fact doesn't do anything really: host-python3 was
already built as one of the dependencies of qemu, through libglib2. So
how did you get issues ?

> BTW - I'm pretty sure that there aren't really so many packages that truly
> depends on **host**-python2 (except maybe python2 itself)
> So in general I think it could be a good idea to just replace **all**
> host-python with host-python3 (again - except python2 itself) and
> just see what happens.

We discussed this at the latest Buildroot Developers meeting, you can
see some notes in "Python 2 deprecation" at
https://bimestriel.framapad.org/p/buildroot-elce-2019-meeting. We
welcome contributions in this area.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

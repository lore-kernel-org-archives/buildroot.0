From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 14:31:11 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
 libudev, not a udev daemon
In-Reply-To: <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
 <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
 <XnsA3777C2F4BB23berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140727143111.7f5091a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 27 Jul 2014 12:12:29 +0200, Bernd Kuhls wrote:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.199
> 8 at free.fr:
> 
> > xserver_xorg-server is happy enough with just a libudev, and does
> > not require a udev daemon.
> 

> although it is true that xserver_xorg-server compiles with libudev alone it 
> segfaults at runtime when checking for video hardware without udev daemon:

That's the kind of thing that worries me about the idea of allowing
only libudev to be installed without the udev daemon running. I believe
libudev and the udev daemon are meant to be used together, and we're
likely to fall into various issues by allowing libudev to be installed
separately from the udev daemon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

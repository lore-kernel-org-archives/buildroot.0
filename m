From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Sep 2015 19:20:25 +0200
Subject: [Buildroot] [PATCH v4 1/2] board: add support for Intel Galileo
 Gen 2
In-Reply-To: <1442849592.3055.47.camel@intel.com>
References: <1441914721.20486.6.camel@intel.com>
 <CAJ3iQcoMbnFxPE+DAV=2PF7xCmQdqz8YGKTkZT5BeFNasbsmyw@mail.gmail.com>
 <20150921164554.0e4f348f@free-electrons.com>
 <CAJ3iQcrKO2-yifLBWBq0qQHN9DpbWx0sK7CHGiRB=Kk77qtDzA@mail.gmail.com>
 <1442849592.3055.47.camel@intel.com>
Message-ID: <20150921192025.76121f3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Sep 2015 15:33:12 +0000, Kinsella, Ray wrote:

> Strange - an artifact of the speed of the SD cards perhaps?
> Need to add rootwait in grub.conf - me thinks.

The detection of SD card is asynchronous. So even with a given SD card,
from one boot to the other, you might have some cases where the SD card
gets detected in time for the root filesystem to be mounted by the
kernel, and some cases where it doesn't get detected in time. rootwait
tells the kernel to wait until it appears.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

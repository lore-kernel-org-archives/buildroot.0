From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Nov 2014 09:28:31 +0100
Subject: [Buildroot] How to invode rebuilding a device tree
In-Reply-To: <890488882.2944382.1416454598139.JavaMail.yahoo@jws10625.mail.bf1.yahoo.com>
References: <890488882.2944382.1416454598139.JavaMail.yahoo@jws10625.mail.bf1.yahoo.com>
Message-ID: <20141120092831.7575522d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tim michals,

On Thu, 20 Nov 2014 03:36:38 +0000 (UTC), Tim michals wrote:

> Is there some way to do rebuild the device tree using the build
> system? make linux-rebuild works, but it rebuilds the entire kernel.
> Maybe just invoke the kernel make file with the <device-tree>.dtb?

"make linux-rebuild" doesn't rebuild the entire kernel, it simply
triggers a new "make" in the kernel tree. So if only your Device Tree
changed, then only your Device Tree will be regenerated. Maybe the
kernel will be linked again, but it certainly will not be rebuilt again
from scratch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

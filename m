From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:37:01 +0100
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
In-Reply-To: <1509658298.7985.2.camel@synopsys.com>
References: <20171102181405.6476-1-yann.morin.1998@free.fr>
 <1509658298.7985.2.camel@synopsys.com>
Message-ID: <20171102223701.4a47f1fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 21:31:39 +0000, Alexey Brodkin wrote:

> Indeed our GDB is based on very up to date upstream sources so all
> limitations for GDB 8.x are valid for ARC's one.
> 
> That said it has nothing to do with ARCH but only GDB version makes sense.
> So why don't we just introduce BR2_GDB_VERSION_ARC which will be the only option
> for ARC and will have the same set of "depends" as BR2_GDB_VERSION_8_0?

If we do that, then we would end up with gdb being available, but no
version selectable on ARC if the host has a compiler older than gcc
4.8. We prefer to hide gdb entirely in such a situation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

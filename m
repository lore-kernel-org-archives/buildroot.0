From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 15:44:24 +0200
Subject: [Buildroot] [PATCH next 2/2] parted: bump version to 3.2
In-Reply-To: <20170522134015.54040-2-Vincent.Riera@imgtec.com>
References: <20170522134015.54040-1-Vincent.Riera@imgtec.com>
 <20170522134015.54040-2-Vincent.Riera@imgtec.com>
Message-ID: <20170605154424.68e39484@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 14:40:15 +0100, Vicente Olivert Riera wrote:

> LVM2 dependency is necessary otherwise it will fail. See:
>   https://lists.gnu.org/archive/html/bug-parted/2014-08/msg00001.html
> 
> Due to the LVM2 dependency, the --enable-device-mapper option is
> automatically enabled so there is no need to add it explicitly to the
> LVM2_CONF_OPTS.

The --enable-device-mapper option still exists, and allows to disable
the lvm2 dependency. The build failure can be fixed by backporting
upstream commit 7e87ca3c531228d35e13e802d2622006138b104c.

So no need for the forced lvm2 dependency, no need for host-lvm2.

Please try to send *less* package updates, but *better* package
updates. Seems like I've already made the same statement earlier
today...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

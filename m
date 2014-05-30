From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 May 2014 22:03:01 +0200
Subject: [Buildroot] buildroot-2014.05-rc3 report on Microblazeel
 Spartan 6 LX45 little endian uartlite and ethernetlite AXI hardware design
In-Reply-To: <CAPALihMP2UAY_VyxhX84Y64hb1NEWA+M9uFziw6gtmZtOi3kHw@mail.gmail.com>
References: <CAPALihMP2UAY_VyxhX84Y64hb1NEWA+M9uFziw6gtmZtOi3kHw@mail.gmail.com>
Message-ID: <20140530220301.47c4e2cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Welch,

On Fri, 30 May 2014 10:58:02 -0500, William Welch wrote:

> First congratulations and thank you for all the hard work!

Thanks!

> The internal buildroot toolchain for microblazeel works fine. -- the system
> boots up into the shell prompt.  Previously it had not worked on my Spartan
> 6, even though it was working on QEMU.

Cool, glad to know the recent changes made by Waldemar improved things.

> The old 'Xilinx' toolchain also works fine, as expected.

Yeah, for basic things. But we had to deprecate them because they are
causing way too many build issues with a significant number of packages.

> However, the 'MUSL' toolchain does not work -- apparently, buildroot
> quietly installs a 'big endian' toolchain, even though I selected
> microblazeel AXI.   I am basing this on the output of 'readelf' on the
> kernel image and the busybox image -- both say 'big endian'.  When I tried
> to boot anyway, I get no console output.

Seems like musl only supports 'microblaze', which is the BE variant of
Microblaze. I'll send a patch to adjust the Buildroot dependencies to
not offer the MUSL external toolchain on microblazeel.

Thanks a lot for the report!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

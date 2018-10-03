From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Oct 2018 14:44:22 +0200
Subject: [Buildroot] Custom C Libraries for RISC-V 32-bit Support
In-Reply-To: <20181003114145.bla23tjlwaqc5glu@sapphire.tkos.co.il>
References: <37c3dc75-0145-ce92-05c0-6c9559b86022@embecosm.com>
 <20181003104024.ijzjzu6t4sp7cee3@sapphire.tkos.co.il>
 <a20fc000-76ef-da38-b7d7-2fb185fe88d5@embecosm.com>
 <20181003114145.bla23tjlwaqc5glu@sapphire.tkos.co.il>
Message-ID: <20181003144422.2f2dc17b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Oct 2018 14:41:45 +0300, Baruch Siach wrote:

> The kernel way is definitely not the way to go. The kernel and U-Boot are 
> special because people tend to use per target source trees. I think that 
> something like what ARC is doing would be easier. A patch set might be 
> problematic because we'll need to forward port the patches whenever we bump 
> glibc version.

I agree with Baruch, I'd prefer to see something similar to what we do
for glibc on ARC, i.e the musl/glibc package automatically chose a
different repo/version when building for RISC-V 32 (glibc) or RISC-V
32/64 (musl).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

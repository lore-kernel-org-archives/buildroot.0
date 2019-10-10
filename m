From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 16:33:30 +0200
Subject: [Buildroot] Buildroot for Texas Instruments AM65X - add 2nd
 toolchain?
In-Reply-To: <1570715805181.62328@amazon.com>
References: <1570715805181.62328@amazon.com>
Message-ID: <20191010163330.358f056d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Scott,

On Thu, 10 Oct 2019 13:56:45 +0000
"Whitney, Scott" <scwhitn@amazon.com> wrote:

> We'd also like to create U-Boot, but for the AM65X, U-Boot has at
> least one piece (tiboot3.bin) that runs on a 32-bit ARM R5 core,
> requiring a 32-bit ARM cross-compiler.  That piece configures some
> hardware like the DRAM controller and then loads some 64-bit code
> U-Boot code into DRAM, after which an A53 64-bit core starts running
> it.

This piece of software is bare metal, so there's no need for a Linux
capable toolchain. We have the same problem on other platforms.

A patch series was submitted in February tosolve this problem:

  http://lists.busybox.net/pipermail/buildroot/2019-February/242251.html

People keep asking for this. I guess I should take my evening tonight
to finally rework this patch series, and send a new iteration of it.

> Has anyone used Buildroot with the AM65X?  Is it feasible to
> build/configure a 2nd toolchain (32-bit ARM) within Buildroot,
> possibly as an additional host package?

See the above patch series, which does exactly that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

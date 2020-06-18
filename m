From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 09:23:03 +0200
Subject: [Buildroot] rm_work
In-Reply-To: <7d1c3ddd-3d77-0edd-6f7e-7e574a728ad7@grandegger.com>
References: <7d1c3ddd-3d77-0edd-6f7e-7e574a728ad7@grandegger.com>
Message-ID: <20200618092303.601a065e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jun 2020 09:01:36 +0200
Wolfgang Grandegger <wg@grandegger.com> wrote:

> I want to build my Buildroot-BSP in a RAMdisk, but there is not enough
> space for the build directory. Is it possible to free the build
> resources immediately after the package has been build, installed and
> deployed, similar to Yocto's "rm_work". At least I didn't find an option
> in the "Build Options" menu. Could such a feature be implemented easily?

We indeed do not have such an option. In *theory* it could be easily
implemented. However, in practice, there are a number of cases where
the build directory of a package gets used even *after* that package
has been completely built/installed.

A simple example: building external kernel modules. We use the Linux
kernel build tree in output/build/linux-<version>/.

So, if we want to reach the goal of being able to drop the build
directory of each package after its build is completed, quite a few
packages will have to be changed/fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

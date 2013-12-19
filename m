From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Dec 2013 14:46:28 +0100
Subject: [Buildroot] [PATCH] evemu: New package. Also adds libevdev.
In-Reply-To: <20131218174050.GA3321@free.fr>
References: <1387375269-25387-1-git-send-email-anaumann@ultratronik.de>
 <20131218174050.GA3321@free.fr>
Message-ID: <20131219144628.496c6374@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Andreas,

Yann's comments are good, I'm just going to add one more below.

On Wed, 18 Dec 2013 18:40:50 +0100, Yann E. MORIN wrote:

> Except for those minor nitpicks, it all Looks Good To Me (TM).

Both packages lack the <pkg>_LICENSE and <pkg>_LICENSE_FILES
informations. See the Buildroot manual for details about these
variables.

Also, the libevdev configure.ac script uses PKG_CHECK_MODULES, so the
package should depend on host-pkgconf. Same thing for evemu.

Finally, your packages don't have any toolchain dependency. This might
be correct, but it would be good if you could test the build of both of
those packages with the following initial configurations:

  http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config
  http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config

If it builds fine with both of those toolchain configuration, then
you're good to go. If not, then it means that there are some missing
toolchain dependencies.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

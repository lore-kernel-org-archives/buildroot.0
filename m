From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:25:05 +0200
Subject: [Buildroot] [PATCH] linux-zigbee: new package
In-Reply-To: <1399139280-9258-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1399139280-9258-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140609142505.7b24a2e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat,  3 May 2014 19:48:00 +0200, Maxime Hadjinlian wrote:
> linux-zigbee is a mix of utility tools that implements a 802.15.4 stack
> along with a usefull library for any program that would need to use this
> stack.
> 
> Note that the name is mislead, for licensing reason, this does *NOT*
> implement the ZigBee protocol.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

I've committed this patch, after making a fairly significant number of
changes. From the git commit log:

    [Thomas:
     - add dependency on threads, propagated from libnl
     - improve the Config.in description by borrowing more text from the
       upstream website
     - fix the prompt of sub-options to be more consistent, and add help
       texts where appropriate
     - fix indentation of the BR2_PACKAGE_LINUX_ZIGBEE_TESTS option help
       text
     - add missing dependencies on host-pkgconf, host-flex and host-bison
     - add missing SoB line in the patch disabling test-serial. Maxime is
       a well-known contributor, so I assumed we had his SoB.
     - fix indentation of <pkg>_CONF_OPT.
     - remove <pkg>_INSTALL_STAGING = YES since the package does not
       install any library, and the two headers it installs are available
       through the toolchain kernel headers.
     - add comment to explain <pkg>_AUTORECONF = YES.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

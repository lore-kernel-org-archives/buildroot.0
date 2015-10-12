From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:17:19 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151012231719.7ecbe700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri,  9 Oct 2015 15:26:02 +0200, Romain Naour wrote:
> The PCI support needs to be checked since this driver is based
> on it. Otherwise the build fail with:
>  #error "This driver requires PCI support to be available"
> 
> But this message is concealed by several occurrence of this
> one:
>  error: implicit declaration of function 'pci_find_bus' [-Werror=implicit-function-declaration]
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
> v3: changes suggested by Arnout
>     - remove the patch and use CC=$(TARGET_CC) instead.
>     - Add a 'or' between GPLv2 and BSD-3c for license information
>     - Add some more license files (files.txt)
>     - Fixes typos and indentation.
>     - move the check for PCI option to LINUX_POST_CONFIGURE_HOOKS
>     - redirect echo to stderr.
> v2: - rename the package simply to iqvlinux (ThomasP)
>     - move it to "Hardware Handling" menu (ThomasP)
>     - Cc Yann for the kernel-module infra
>     - Add a check for CONFIG_PCI even if it's redundant with
>       the message from the Makefile.
>       (Do we really need this check ?)
> ---
>  package/Config.in              |  1 +
>  package/iqvlinux/Config.in     | 18 ++++++++++++++++++
>  package/iqvlinux/iqvlinux.hash |  5 +++++
>  package/iqvlinux/iqvlinux.mk   | 34 ++++++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+)
>  create mode 100644 package/iqvlinux/Config.in
>  create mode 100644 package/iqvlinux/iqvlinux.hash
>  create mode 100644 package/iqvlinux/iqvlinux.mk

Applied after doing the following changes:

    [Thomas:
     - fix minor typo in Config.in: s/Enthernet/Ethernet/
     - license is "GPLv2, BSD-3c", not "GPLv2 or BSD-3c"
     - remove IQVLINUX_PCI_CHECK, until a proper generic solution is
       implemented.]

As you can see, I've removed the IQVLINUX_PCI_CHECK so that a nicer
solution can be discussed/implemented with Yann. However, since this
check was not really mandatory, I decided to add the package
nonetheless (albeit without the check).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

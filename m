From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:42:05 +0200
Subject: [Buildroot] [PATCH 1/1] sispmctl: new package
In-Reply-To: <1401375933-23332-1-git-send-email-phil@zankapfel.net>
References: <1401375933-23332-1-git-send-email-phil@zankapfel.net>
Message-ID: <20140609144205.3dd41ead@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Thu, 29 May 2014 17:05:33 +0200, Phil Eichinger wrote:
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> ---
>  package/Config.in            |    1 +
>  package/sispmctl/Config.in   |   11 +++++++++++
>  package/sispmctl/sispmctl.mk |   17 +++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/sispmctl/Config.in
>  create mode 100644 package/sispmctl/sispmctl.mk

Thanks, I've applied your patch, after making a small number of
changes. Here is the list of changes I made:

    [Thomas:
     - Add missing select of BR2_PACKAGE_LIBUSB, since
       BR2_PACKAGE_LIBUSB_COMPAT depends on it
     - Add missing thread dependency, since libusb requires threads.
     - Add missing wide-char dependency. Without wide char support,
       sispmctl doesn't build.
     - Rewrap the Config.in help text, and remove trailing whitespaces.
     - License is GPLv2+, not GPLv2.
     - Remove --disable-dependency-tracking from <pkg>_CONF_OPT. That's a
       global, standard, autoconf option, and there's no reason to pass it
       at the per-package level.]

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

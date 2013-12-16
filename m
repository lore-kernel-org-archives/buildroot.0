From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 22:52:50 +0100
Subject: [Buildroot] [PATCH] ti-uim: Add new package
In-Reply-To: <1386502217-2761-1-git-send-email-alexandre.belloni@free-electrons.com>
 (Alexandre Belloni's message of "Sun, 8 Dec 2013 12:30:17 +0100")
References: <1386502217-2761-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <8738lsqx8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@free-electrons.com> writes:

 > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 > ---
 >  package/Config.in        |  1 +
 >  package/ti-uim/Config.in |  8 ++++++++
 >  package/ti-uim/ti-uim.mk | 21 +++++++++++++++++++++
 >  3 files changed, 30 insertions(+)
 >  create mode 100644 package/ti-uim/Config.in
 >  create mode 100644 package/ti-uim/ti-uim.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index a7ab4ea9d535..8947fc1dc686 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -329,6 +329,7 @@ source "package/sunxi-mali/Config.in"
 >  source "package/sunxi-mali-prop/Config.in"
 >  source "package/sysstat/Config.in"
 >  source "package/ti-gfx/Config.in"
 > +source "package/ti-uim/Config.in"
 >  source "package/ti-utils/Config.in"
 >  source "package/uboot-tools/Config.in"
 >  source "package/udev/Config.in"
 > diff --git a/package/ti-uim/Config.in b/package/ti-uim/Config.in
 > new file mode 100644
 > index 000000000000..0e2183d0cbc8
 > --- /dev/null
 > +++ b/package/ti-uim/Config.in
 > @@ -0,0 +1,8 @@
 > +config BR2_PACKAGE_TI_UIM
 > +	bool "ti-uim"
 > +	help
 > +	  User Mode Initialization Manager for TI wl12xx connectivity chip shared
 > +	  transport drivers. This daemon is needed to get the btwilink driver to
 > +	  work.
 > +

Help text should be wrapped so it displays in menuconfig in 80 cols
without scrolling.

 > +	  http://omappedia.org/wiki/Device_Driver_Interface_of_WiLink_Solution
 > diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
 > new file mode 100644
 > index 000000000000..86e8b882a8b2
 > --- /dev/null
 > +++ b/package/ti-uim/ti-uim.mk
 > @@ -0,0 +1,21 @@
 > +#############################################################
 > +#
 > +# ti-uim
 > +#
 > +#############################################################

Somebody once went through the tree changing the file headers to all use
80 chars, so we should keep it like that ;)

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard

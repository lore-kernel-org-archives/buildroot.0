From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 20 Aug 2007 16:34:02 +0200
Subject: [Buildroot] Overriding DL_DIR in the environment
In-Reply-To: <1187370334.31026.4.camel@elrond.sweden.atmel.com>
References: <1187370334.31026.4.camel@elrond.sweden.atmel.com>
Message-ID: <20070820143402.GA23522@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 17, 2007 at 07:05:34PM +0200, Ulf Samuelsson wrote:
>I keep a central download location for all tarballs,
>and find it a pain to always have to edit the DL_DIR
>variable during "make menuconfig".
>
>It would be nice to be able to override the ".config" 
>value of DL_DIR in the shell environment.
>
>Here is a simple patch which will, 
>if you define
>
>$ export BUILDROOT_DL_DIR /usr/local/install/downloads
>
>in your ".bashrc", override the DL_DIR in the ".config".
>
>
>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>Index: Makefile
>===================================================================
>--- Makefile    (revision 19542)
>+++ Makefile    (arbetskopia)
>@@ -37,6 +37,9 @@
> ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
> -include $(TOPDIR).config
> endif
>+ifneq  ($(BUILDROOT_DL_DIR),)

This is whitespace-damaged (once again..)

If you add this to be noted via dependencies.sh then it's fine for me
provided that you fix that whitespace damage above.

That said, i usually symlink the DL_DIR to my usual repo of tarballs,
fwiw.

>+BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
>+endif
> 
> # To put more focus on warnings, be less verbose as default
> # Use 'make V=1' to see the full commands
>--------------------------------------------------------------------
>
>
>
>Comments?

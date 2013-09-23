From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Sep 2013 12:50:04 +0200
Subject: [Buildroot] [PATCH] Add lesstif package
In-Reply-To: <52401C48.7090402@wanadoo.fr> (Thierry Bultel's message of "Mon, 
 23 Sep 2013 12:47:36 +0200")
References: <523A9EE2.9050701@wanadoo.fr> <87zjr59rgu.fsf@dell.be.48ers.dk>
 <52401C48.7090402@wanadoo.fr>
Message-ID: <87a9j3ak2r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:

Hi,

 >> We don't have a XLIB_LIBXP package in Buildroot?

 Thierry> ack
 Thierry> This is a mistake.
 Thierry> Taking your notes below in account, this should be

 Thierry>     select BR2_PACKAGE_XLIB_LIBXT
 Thierry>     select BR2_PACKAGE_XLIB_LIBXEXT

 Thierry> I wonder if I should not add "depends on BR2_PACKAGE_XORG7" as well ?
 Thierry> Else the needed libraries will not be built at all.

Indeed. Look at the blackbox package for an example


 Thierry> +# Remove the ac_find_motif.m4 that is copied on target
 Thierry> +define LESSTIF_FIXACLOCAL
 Thierry> +	rm -rf $(TARGET_DIR)/$(HOME)
 Thierry> +endef
 >> 
 >> HOME?

 Thierry> yes, current user $(HOME).
 Thierry> This is weird indeed but lesstif actually creates

 Thierry> $(TARGET_DIR)/$(HOME)/$(TOPDIR)/output/host/usr/share/aclocal/ac_find_motif.m4

Ahh. Could you extend the comment a bit to explain this?


 >> Care to fix and resend?

 Thierry> Sure, once we are ok with the all points above

Great, thanks.

-- 
Bye, Peter Korsgaard

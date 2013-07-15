From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 00:32:44 +0200
Subject: [Buildroot] [PATCH v6 2/3] ti-gfx: add new package
In-Reply-To: <1373924660-1391-3-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Mon, 15 Jul 2013 16:44:19 -0500")
References: <1373924660-1391-1-git-send-email-spenser@gillilanding.com>
 <1373924660-1391-3-git-send-email-spenser@gillilanding.com>
Message-ID: <87vc4b8neb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> adds accelerated GPU support for the OMAP35xx, AM35xx, AM37xx, DM37xx,
 Spenser> AM387x, DM814x, AM389x, DM816x, and AM335x platforms.

..

 Spenser> +	$(call TI_GFX_INSTALL_LIBS,$(STAGING_DIR))
 Spenser> +
 Spenser> +	$(INSTALL) -D -m 0644 package/ti-gfx/egl.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 Spenser> +	$(INSTALL) -D -m 0644 package/ti-gfx/glesv2.pc $(STAGING_DIR)/usr/lib/pkgconfig/

Whenever you use install -D you alway have to prove the destination file
name, not just the directory.

Committed series with that fixed, thanks!

-- 
Bye, Peter Korsgaard

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Sep 2013 14:12:22 +0200
Subject: [Buildroot] [PATCH] Add lesstif package
In-Reply-To: <52401C48.7090402@wanadoo.fr>
References: <523A9EE2.9050701@wanadoo.fr> <87zjr59rgu.fsf@dell.be.48ers.dk>
 <52401C48.7090402@wanadoo.fr>
Message-ID: <20130923141222.2fb3c9a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Mon, 23 Sep 2013 12:47:36 +0200, Thierry Bultel wrote:

> >  Thierry> +# Remove the ac_find_motif.m4 that is copied on target
> >  Thierry> +define LESSTIF_FIXACLOCAL
> >  Thierry> +	rm -rf $(TARGET_DIR)/$(HOME)
> >  Thierry> +endef
> > 
> > HOME?
> 
> yes, current user $(HOME).
> This is weird indeed but lesstif actually creates

For those users who run Buildroot as root, this is going to remove
$(TARGET_DIR)/root from the root filesystem, which isn't nice. Also if
the user running Buildroot is foo and a 'foo' user has been created for
the target filesystem, it will remove its home directory.

Therefore, either the package should be patched not to install things
in such an odd location, or the removal should be made a bit more
specific. Remember to also test the case where Buildroot is built
out-of-tree using O=, since those files will then most likely not be
installed in $(TARGET_DIR)/$(HOME)/$(TOPDIR)/output.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

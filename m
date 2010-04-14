From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 12:31:27 +0200
Subject: [Buildroot] [PATCH] pciutils: convert to the autotools
	infrastructure
In-Reply-To: <78409DB4-3D71-4100-81B8-653F239F8E31@me.com> (Thomas
	Brandstetter's message of "Tue, 13 Apr 2010 23:49:17 +0200")
References: <78409DB4-3D71-4100-81B8-653F239F8E31@me.com>
Message-ID: <87k4safhq8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Brandstetter <thomas.brandstetter@me.com> writes:

 Thomas> Signed-off-by: Thomas Brandstetter <tbrandstetter@me.com>
 Thomas> ---
 Thomas> +PCIUTILS_DNS=no
 Thomas> +PCIUTILS_SHARED=yes

Thanks, but:

Applying: pciutils: convert to the autotools infrastructure
fatal: corrupt patch at line 45
Patch failed at 0001 pciutils: convert to the autotools infrastructure
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

 Thomas> +PCIUTILS_MAKE_OPT = CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(PCIUTILS_DIR) SHARED=$
 Thomas> (PCIUTILS_SHARED) ZLIB=$(PCIUTILS_ZLIB) DNS=$(PCIUTILS_DNS) SHAREDIR=/usr/share/misc

Your mailer has word wrapped the patch - Could you use git send-email
instead? That'll do the right thing.

It would also be good to split up that very long line using '\' - E.G.

PCIUTILS_MAKE_OPT = \
                  CC=... \
                  OPT=...

And so on.

We also have a TARGET_CONFIGURE_ENV (see package/Makefile.in) that might
be nicer to use.

-- 
Bye, Peter Korsgaard

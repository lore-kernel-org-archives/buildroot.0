From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 15:26:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/liboil
In-Reply-To: <20090125081654.4A59076D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 08\:16\:54 +0000 \(UTC\)")
References: <20090125081654.4A59076D28@busybox.osuosl.org>
Message-ID: <87ocxvfomx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 08:16:53 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25012

 ulf> Log:
 ulf> liboil make fails on ARM with release toolset for a few unneeded examples due to use of hidden __clz_tab, do not build them for now, but problem may need further examination

 ulf> Modified:
 ulf>    trunk/buildroot/package/liboil/liboil.mk


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/liboil/liboil.mk
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/liboil/liboil.mk	2009-01-25 08:14:37 UTC (rev 25011)
 ulf> +++ trunk/buildroot/package/liboil/liboil.mk	2009-01-25 08:16:53 UTC (rev 25012)
 ulf> @@ -26,6 +26,8 @@
 ulf>  LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
 ulf>  endif
 
 ulf> +LIBOIL_CONF_OPT+=--with-gnu-ld
 ulf> +

Why? You don't mention anything about this in your commit message.

 ulf> +
 ulf> +$(LIBOIL_HOOK_POST_CONFIGURE):
 ulf> +	$(SED) 's/uberopt//g' $(LIBOIL_DIR)/examples/Makefile
 ulf> +	$(SED) 's/work//g' $(LIBOIL_DIR)/examples/Makefile

Why not disable all examples?

A comment like

# disable examples

Just above would be nice.

-- 
Bye, Peter Korsgaard

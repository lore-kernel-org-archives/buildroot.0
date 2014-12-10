From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:40:26 +0100
Subject: [Buildroot] [PATCH] libsvgtiny: disable -Werror
In-Reply-To: <1418223572-2456-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418223572-2456-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141210214026.1e681f45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 10 Dec 2014 14:59:32 +0000, Vicente Olivert Riera wrote:

> +define LIBSVGTINY_DISABLE_WERROR
> +	$(SED) 's/-Werror//' $(@D)/Makefile
> +endef
> +LIBSVGTINY_POST_CONFIGURE_HOOKS += LIBSVGTINY_DISABLE_WERROR

As discussed on IRC, I would prefer this to be done using a patch
rather than a $(SED) command, for several reasons:

 * A $(SED) command that replaces some random string can start breaking
   when we bump the libsvgtiny Makefile, as it might start replacing
   other things than what was intended.

 * We will never notice when the $(SED) command will no longer be
   useful. With a patch, when we'll bump libsvgtiny, we'll get some
   conflict when re-applying the patch on the new version of
   libsvgtiny, and so we'll see if we can drop the patch, or if we need
   to re-adjust the patch.

Care to resend as a patch instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

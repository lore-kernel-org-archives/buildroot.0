From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jul 2011 06:57:16 +0300
Subject: [Buildroot] [PATCH] ebtables: new package
In-Reply-To: <87y605x2r0.fsf@macbook.be.48ers.dk>
References: <f2408a31cec10972f6f2a4a5fc885b4cc6704eb8.1310046029.git.baruch@tkos.co.il>
 <87y605x2r0.fsf@macbook.be.48ers.dk>
Message-ID: <20110711035716.GA20349@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Jul 10, 2011 at 11:08:35PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  Baruch> +endef
>  Baruch> +
>  Baruch> +define EBTABLES_INSTALL_TARGET_CMDS
>  Baruch> +	mkdir -p $(TARGET_DIR)/lib/ebtables
>  Baruch> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/extensions/*.so \
>  Baruch> +		$(TARGET_DIR)/lib/ebtables
>  Baruch> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/*.so \
>  Baruch> +		$(TARGET_DIR)/lib/ebtables
>  Baruch> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
>  Baruch> +		$(TARGET_DIR)/sbin/ebtables
> 
> Doesn't the makefile have an install target?

It does, but the 'exec' target (a dependency of 'install') uses install with 
-o root, which fails when building as non-root. Is there a standard way to 
make the install target under fakeroot?

> Care to fix and resend?

I'll update and resend.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

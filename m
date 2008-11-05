From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 5 Nov 2008 09:42:48 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/make
In-Reply-To: <87fxm6zi88.fsf@macbook.be.48ers.dk>
References: <20081105080930.8D6EE3C808@busybox.net>
	<87fxm6zi88.fsf@macbook.be.48ers.dk>
Message-ID: <20081105094248.3cf1c7c8@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 05 Nov 2008 09:31:51 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "egtvedt" == egtvedt  <egtvedt@uclibc.org> writes:
> 
>  egtvedt> Author: egtvedt
>  egtvedt> Date: 2008-11-05 00:09:30 -0800 (Wed, 05 Nov 2008)
>  egtvedt> New Revision: 23928
> 
>  egtvedt> Log:
>  egtvedt> make: select gettext and libintl if locale is enabled
> 
>  egtvedt>  ifeq ($(strip $(BR2_PACKAGE_MAKE)),y)
>  egtvedt> -TARGETS+=make
>  egtvedt> +TARGETS+=$(if $(BR2_PACKAGE_GETTEXT),gettext) make
> 
> We normally do this by adding it as a dependency to the make: target,
> E.G.:
> 
> make: uclibc $(if $(BR2_PACKAGE_GETTEXT),gettext)
> $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)
> 
> Adding it to TARGETS doesn't ensure that gettext gets built before
> make (well, actually it does, but it isn't very clear or robust)
> 
> Could you please change it?
> 

Jupp, no problem (-:

-- 
Best regards,
Hans-Christian Egtvedt

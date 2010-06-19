From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jun 2010 16:24:35 +0200
Subject: [Buildroot] [PATCH 08/10] linux: adjust kernel config according
 to the Buildroot configuration
In-Reply-To: <87y6ec9lf5.fsf@macbook.be.48ers.dk>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<655e8a3a75bc2f73712ebabca64e83805dd8b87d.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87y6ec9lf5.fsf@macbook.be.48ers.dk>
Message-ID: <20100619162435.1039628c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Jun 2010 21:43:10 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> I'm not sure I like this hardcoded policy. What if the user wants to run
> some precompiled OABI binaries together with his EABI rootfs?

I don't really like this hardcoded policy either, but I kept what
existed before.

What should we do ? Just not modify the kernel configuration, except
for the initramfs case ? Isn't the EABI thing going to hit a large
number of users, coming back with a "my Busybox init doesn't start"
question ?

>  Thomas> +endif
>  Thomas> +ifeq ($(BR2_INET_IPV6),y)
>  Thomas> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6,$(@D)/.config)
>  Thomas> +else
>  Thomas> +	$(call KCONFIG_DISABLE_OPT,CONFIG_IPV6,$(@D)/.config)
>  Thomas> +endif
>  Thomas> +	yes "" | $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig 2>&1 >/dev/null
> 
> The yes shouldn't be needed, and I don't like hiding errors.

It does not hide errors, it uses the default choice for every unset
option :-)

But ok, if you don't like it, why not.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

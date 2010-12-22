From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Dec 2010 11:23:50 +0100
Subject: [Buildroot] [Bug 2875] Kernel doesn't build Ext2 support
 out-of-the-box
In-Reply-To: <87mxnyung0.fsf@macbook.be.48ers.dk>
References: <bug-2875-163@https.bugs.busybox.net/>
	<20101222091404.B58E688F68@busybox.osuosl.org>
	<87mxnyung0.fsf@macbook.be.48ers.dk>
Message-ID: <20101222112350.7261db18@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Dec 2010 11:11:27 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> I agree, but you're giving a bad example:
> 
> linux/linux.mk:
> ifeq ($(BR2_INET_IPV6),y)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IPV6,$(@D)/.config)
> else
>         $(call KCONFIG_DISABLE_OPT,CONFIG_IPV6,$(@D)/.config)
> endif
> 
> Which comes from:
> 
> commit 100c09a53b8806b2281a93ad21744d26f68bcc6b
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Tue Jun 8 13:56:19 2010 +0200
> 
>     linux: adjust kernel config according to the Buildroot configuration
>     
>     We only adjust the configuration or ARM EABI and IPv6. The (more
>     complicated) initramfs case is handled in a separate commit. The user
>     is expected to take care of all other configuration details (like
>     having Netfilter enabled to make iptables work, etc.)
>     
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ;)

Notice that this commit was not *introducing* this, it was only
re-adding that feature into the new linux/linux.mk Makefile. See
http://git.buildroot.net/buildroot/tree/target/linux/Makefile.in.advanced?id=2010.05#n342 :-)

So, yes I'm contradicting myself, but not that much :-)

>  bugzilla> I will not mark the bug as WONTFIX, waiting for other
>  bugzilla> Buildroot developers to comment.
> 
> I vote for WONTFIX.

Ok. I think the IPv6 could also be removed (it's not because you have
an IPv6 capable toolchain that you necessarly want IPv6 in your kernel).
The EABI one is more or less justified, because we would otherwise have
hundreds of bug reports saying that userspace programs do not start.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

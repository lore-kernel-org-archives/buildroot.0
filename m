From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Nov 2010 20:38:18 +0100
Subject: [Buildroot] [PATCH v4] inetutils: new package for random
 network tools
In-Reply-To: <1290225547-9728-1-git-send-email-vapier@gentoo.org>
References: <1290145160-21033-1-git-send-email-vapier@gentoo.org>
	<1290225547-9728-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101123203818.3efd3e9a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Nov 2010 22:59:07 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> +	$(call USE_ENABLE,INET_IPV6,ipv6) \

The following bit in package/Makefile.in already passes --disable-ipv6
when IPv6 is not available:

ifneq ($(BR2_INET_IPV6),y)
DISABLE_IPV6= --disable-ipv6
endif

However, it does not pass --enable-ipv6 when IPv6 is enabled.

I'm not sure what to do:

 *) Pass --{disable,enable}-ipv6 to every package

 *) Remove completely the snippet in package/Makefile.in and let each
    package handle its options. I'm not sure --{disable,enable}-ipv6 is
    really a standard thing.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

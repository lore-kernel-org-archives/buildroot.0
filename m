From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 14:55:10 +0100
Subject: [Buildroot] [PATCH] iftop: new package
In-Reply-To: <1358351378-10876-2-git-send-email-bogdan@nimblex.net>
References: <1358351378-10876-1-git-send-email-bogdan@nimblex.net>
 <1358351378-10876-2-git-send-email-bogdan@nimblex.net>
Message-ID: <20130116145510.66bdf069@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bogdan Radulescu,

On Wed, 16 Jan 2013 15:49:38 +0000, Bogdan Radulescu wrote:

> +	select BR2_TOOLCHAIN_BUILDROOT_INET_IPV6

No, selecting toolchain options is not correct, and in this particular
case, it would only work for the internal toolchain backend (breaking
the external backend and Crosstool-NG backend).

See package/squid/Config.in for an example.

Basically, you must do something like:

config BR2_PACKAGE_FOO
	depends on BR2_INET_IPV6

comment "foo requires IPv6 support in toolchain"
	depends on !BR2_INET_IPV6

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

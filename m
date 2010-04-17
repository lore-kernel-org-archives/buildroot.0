From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 02:35:12 +0200
Subject: [Buildroot] transmission 1.74 fails to build
In-Reply-To: <p2je7c6a05e1004160937mfce6921bu36df256e24c019b5@mail.gmail.com>
References: <y2pe7c6a05e1004160014vf65ef3b9z1ade66ebe4bab63a@mail.gmail.com>
	<20100416164248.0f8890a5@surf>
	<p2je7c6a05e1004160937mfce6921bu36df256e24c019b5@mail.gmail.com>
Message-ID: <20100417023512.460d215c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marek,

Thanks for working on this package!

On Fri, 16 Apr 2010 18:37:21 +0200
Belisko Marek <marek.belisko@gmail.com> wrote:

> --- /dev/null
> +++ b/package/transmission/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_TRANSMISSION
> +	bool "transmission"
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBEVENT
> +	default n

default n is not needed, this is the default.

> diff --git a/package/transmission/settings.json.template
> b/package/transmission/settings.json.template

What is this ? Why isn't it part of the Transmission package itself ?

> diff --git a/package/transmission/transmission-init
> b/package/transmission/transmission-init

It should probably be named Sxxtransmission, just like all the other
init scripts.

> diff --git a/package/transmission/transmission.mk
> b/package/transmission/transmission.mk

Since transmission is using the autotools as its build system, you must
use the autotools infrastructure for the .mk file. See
http://buildroot.org/downloads/buildroot.html#autotools-tutorial for
details.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

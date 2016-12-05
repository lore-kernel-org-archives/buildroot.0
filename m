From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 14:33:22 +0100
Subject: [Buildroot] [PATCH 1/1] nginx-dav-ext: New package
In-Reply-To: <CAJtjsKayVVJBRf+v1PYnL1hb6D5FqfqC1Y3pb9fGnkybf3bpAA@mail.gmail.com>
References: <1480438071-11906-1-git-send-email-johan.oudinet@gmail.com>
 <20161204235230.4be68e7c@free-electrons.com>
 <CAJtjsKY2yT_EekNg2F_-K-PyLN5Zp47ykhRwVK4Kg3PixY4K9A@mail.gmail.com>
 <20161205121442.51bb6c46@free-electrons.com>
 <CAJtjsKayVVJBRf+v1PYnL1hb6D5FqfqC1Y3pb9fGnkybf3bpAA@mail.gmail.com>
Message-ID: <20161205143322.227297e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Dec 2016 14:20:43 +0100, Johan Oudinet wrote:

> Indeed, you have moved this module outside the HTTP modules:
> ifeq ($(BR2_PACKAGE_NGINX_HTTP),y)
> ...
> endif # BR2_PACKAGE_NGINX_HTTP
> 
> So now, linking fails if BR2_PACKAGE_NGINX_HTTP is not set.
> Should I rename this package to nginx-http-dav-ext to indicate it must
> be compiled with the HTTP server of nginx?

Hum, and the problem is I guess the same for the naxsi module. Renaming
the package name is not necessary, we should handle this using
dependencies.

The previous solution used for the nginx-naxsi package was not good,
because you could select BR2_PACKAGE_NGINX_NAXSI, but if
BR2_PACKAGE_NGINX_HTTP was disabled, in fact the naxsi module was not
built.

So instead, I believe that nginx-naxsi/Config.in and
nginx-dav-ext/Config.in should contain a:

	depends on BR2_PACKAGE_NGINX_HTTP

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

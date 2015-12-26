From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 10:58:36 +0100
Subject: [Buildroot] Nginx package
In-Reply-To: <567E5D9E.1030003@gmail.com>
References: <567E5D9E.1030003@gmail.com>
Message-ID: <20151226105836.26a19543@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Dec 2015 10:27:58 +0100, Geoffrey Ragot wrote:

> I have a question related to packages dependencies.
> 
> I have a case where i want to compile nginx with some additionnal 
> modules (luajit).
> I can define modules paths in the nginx config, but i don't find a way 
> to say buildroot to compile these additional modules before nginx, 
> otherwise than modifying nginx dependencies.

Well, look at nginx.mk, there are plenty of examples:

ifeq ($(BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE),y)
NGINX_DEPENDENCIES += zlib
NGINX_CONF_OPTS += --with-http_spdy_module
endif

If BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE is enabled, then zlib is
guaranteed to be built before nginx, and the option
--with-http_spdy_module will be passed to the nginx configure script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

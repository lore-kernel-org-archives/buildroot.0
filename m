From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 22:46:38 +0100
Subject: [Buildroot] [PATCH 7/8] package/optee-test: add deps on openssl
 when enabled
In-Reply-To: <20201030075045.6960-7-etienne.carriere@linaro.org>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
 <20201030075045.6960-7-etienne.carriere@linaro.org>
Message-ID: <20201031224638.1a75b0b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ?tienne,

On Fri, 30 Oct 2020 08:50:44 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

>  OPTEE_TEST_DEPENDENCIES = optee-client optee-os
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)

Is it intentional that the dependency is on BR2_PACKAGE_LIBOPENSSL and
not BR2_PACKAGE_OPENSSL ?

If you use BR2_PACKAGE_OPENSSL, it means that either openssl or
libressl can be used. If you use BR2_PACKAGE_LIBOPENSSL, then it means
that you really only support working with openssl.

Normally, libressl is a drop-in replacement for openssl, so it does
work just like openssl in most cases. There are however a few OpenSSL
APIs that are no longer supported in LibreSSL.

Could you clarify this point ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

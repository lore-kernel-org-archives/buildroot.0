From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 2 Nov 2020 09:08:09 +0100
Subject: [Buildroot] [PATCH 7/8] package/optee-test: add deps on openssl
 when enabled
In-Reply-To: <20201031224638.1a75b0b4@windsurf>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
 <20201030075045.6960-7-etienne.carriere@linaro.org>
 <20201031224638.1a75b0b4@windsurf>
Message-ID: <CAN5uoS9SaDYkYhNoYJdKKQ8v0M6roYzYkPZh6E8hbECr7FPEdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 31 Oct 2020 at 22:46, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello ?tienne,
>
> On Fri, 30 Oct 2020 08:50:44 +0100
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> >  OPTEE_TEST_DEPENDENCIES = optee-client optee-os
> > +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>
> Is it intentional that the dependency is on BR2_PACKAGE_LIBOPENSSL and
> not BR2_PACKAGE_OPENSSL ?
>
> If you use BR2_PACKAGE_OPENSSL, it means that either openssl or
> libressl can be used. If you use BR2_PACKAGE_LIBOPENSSL, then it means
> that you really only support working with openssl.
>
> Normally, libressl is a drop-in replacement for openssl, so it does
> work just like openssl in most cases. There are however a few OpenSSL
> APIs that are no longer supported in LibreSSL.
>
> Could you clarify this point ?

Thanks for highlighting this. Indeed, constraining to libopenssl was
not intentional.

I've checked. From my reading, I would think optee-test uses standard
stuff from openssl that libressl supports but
testing here with libressl makes the optee-test test tool fail on a
certificate test.
I guess this should be investigated from the optee project scope.
As for now I'd rather stick to BR2_PACKAGE_LIBOPENSSL dependency here
as this change proposes.

Regards,
Etienne




>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

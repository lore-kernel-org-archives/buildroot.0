From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 23:18:28 +0200
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <CACm0Nn0WyTPDnSyA+7bj10GddAstx0YkyUAuERcRSLSf0CyzRA@mail.gmail.com>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <20200515221042.011b8d33@windsurf.home>
 <CACm0Nn30Fbv8Dftgy2uqQ4otZg5R7JHoi8CbkN7t1mbJn-FeeQ@mail.gmail.com>
 <20200515224742.251bed10@windsurf.home>
 <CACm0Nn0WyTPDnSyA+7bj10GddAstx0YkyUAuERcRSLSf0CyzRA@mail.gmail.com>
Message-ID: <20200515231828.1657342a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 May 2020 00:03:10 +0300
Ed Spiridonov <edo.rus@gmail.com> wrote:

> > The idea of using select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
> > was to keep the current behavior, i.e be backward compatible.  
> 
> Does it make sense?
> If OpenSSL is selected, it will be used as a crypto backend. So any
> build based on an existing .config remains the same.

What you say will work if:

 (1) Your .mk file tests BR2_PACKAGE_OPENSSL and uses openssl if set,
     before using mbedtls

 (2) Users are using full .config and not defconfig files. Indeed, a
     defconfig file today that has BR2_PACKAGE_OPENVPN=y will not have
     BR2_PACKAGE_OPENSSL=y, because this is implied by
     BR2_PACKAGE_OPENVPN=y. So such users would transition from using
     OpenSSL as the crypto backend for openvpn to mbedtls.

I don't have a very strong feeling on this. I agree that on the other
hand, it's good to use a smaller crypto library by default if possible.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

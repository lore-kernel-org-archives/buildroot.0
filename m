From: Ed Spiridonov <edo.rus@gmail.com>
Date: Fri, 15 May 2020 23:39:09 +0300
Subject: [Buildroot] [PATCH] package/openvpn: add option to use mbed TLS
 instead of OpenSSL
In-Reply-To: <20200515221042.011b8d33@windsurf.home>
References: <20200511223108.4184-1-edo.rus@gmail.com>
 <20200515221042.011b8d33@windsurf.home>
Message-ID: <CACm0Nn30Fbv8Dftgy2uqQ4otZg5R7JHoi8CbkN7t1mbJn-FeeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 15, 2020 at 11:10 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Could you change this to:
>
>         select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS

Ok. But I would rather use mbed TLS as the default option:
        select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL

OpenVPN + mbed TLS combination is well tested (Android/iOS builds use mbed TLS).

> This way, we use mbedtls if available, otherwise we use OpenSSL.

BTW, there is "--disable-crypto" build option, but I'm unsure if anyone use it.

P.?S. What about other options? OpenWRT has lot of them
https://github.com/openwrt/openwrt/blob/master/package/network/services/openvpn/Config-openssl.in
This helps make the binary more compact.

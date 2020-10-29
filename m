From: Ed Spiridonov <edo.rus@gmail.com>
Date: Fri, 30 Oct 2020 01:20:44 +0300
Subject: [Buildroot] [PATCH v2, 1/1] package/openvpn: add mbedtls support
In-Reply-To: <mailman.19973.1603998272.40933.buildroot@busybox.net>
References: <mailman.19973.1603998272.40933.buildroot@busybox.net>
Message-ID: <CACm0Nn1yXwa3X1iTgTN61GACgBQUZsKhs6ser2NP=Cx3d=jb0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> mbedtls (former polarssl) support was dropped with commit
> 3380da69c5ab490e5c51dca0c4389b0da91743d0
>
> Put it back as openvpn supports mbedtls 2.x since version 2.4.0 and
> https://github.com/OpenVPN/openvpn/commit/86d8cd6860dfc74cb1a040ff8fe03140ebe7f930

I proposed such a patch in May, but it was not accepted.
http://buildroot-busybox.2317881.n4.nabble.com/PATCH-package-openvpn-add-option-to-use-mbed-TLS-instead-of-OpenSSL-td255807.html

IMO mbedtls could be selected by default.
I tried
        select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL
but it doesn't work (kconfig fails to resolve dependencies).

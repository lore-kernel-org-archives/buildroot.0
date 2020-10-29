From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 29 Oct 2020 23:56:45 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/openvpn: add mbedtls support
In-Reply-To: <CACm0Nn1yXwa3X1iTgTN61GACgBQUZsKhs6ser2NP=Cx3d=jb0g@mail.gmail.com>
References: <mailman.19973.1603998272.40933.buildroot@busybox.net>
 <CACm0Nn1yXwa3X1iTgTN61GACgBQUZsKhs6ser2NP=Cx3d=jb0g@mail.gmail.com>
Message-ID: <CAPi7W82bcS7sOJkYwSHoYPWN0A-4EBzhgtfqXuYMnK1PSqZ_ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeu. 29 oct. 2020 ? 23:20, Ed Spiridonov <edo.rus@gmail.com> a ?crit :
>
> > mbedtls (former polarssl) support was dropped with commit
> > 3380da69c5ab490e5c51dca0c4389b0da91743d0
> >
> > Put it back as openvpn supports mbedtls 2.x since version 2.4.0 and
> > https://github.com/OpenVPN/openvpn/commit/86d8cd6860dfc74cb1a040ff8fe03140ebe7f930
>
> I proposed such a patch in May, but it was not accepted.
> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-package-openvpn-add-option-to-use-mbed-TLS-instead-of-OpenSSL-td255807.html
Sorry, I missed your patch, I'll set mine as not applicable and wait
for the v2 of your patch to be merged.
>
> IMO mbedtls could be selected by default.
I don't agree as this will break backward compatibility which should
really be avoided.
Moreover, it should also be noted that upstream openvpn uses openssl,
and not mbedtls, by default:
https://github.com/OpenVPN/openvpn/blob/master/configure.ac#L267

We could add a Config option to allow the user to select the crypto
backend as some buildroot packages have such an option (libcurl,
libssh) however most don't (shairport-sync, uacme, ustream-ssl,
libnice, efl, lftp ...).
To conclude, I would advise that you send a v2 of your patch.
> I tried
>         select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL
> but it doesn't work (kconfig fails to resolve dependencies).
Best Regards,

Fabrice

From: Ed Spiridonov <edo.rus@gmail.com>
Date: Fri, 30 Oct 2020 03:28:35 +0300
Subject: [Buildroot] [PATCH v2, 1/1] package/openvpn: add mbedtls support
In-Reply-To: <CAPi7W82bcS7sOJkYwSHoYPWN0A-4EBzhgtfqXuYMnK1PSqZ_ew@mail.gmail.com>
References: <mailman.19973.1603998272.40933.buildroot@busybox.net>
 <CACm0Nn1yXwa3X1iTgTN61GACgBQUZsKhs6ser2NP=Cx3d=jb0g@mail.gmail.com>
 <CAPi7W82bcS7sOJkYwSHoYPWN0A-4EBzhgtfqXuYMnK1PSqZ_ew@mail.gmail.com>
Message-ID: <CACm0Nn0q7NCLpoU+gBVnV1eLHo=51nVBLfUi7iZJ9Eot+drvJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 30, 2020 at 1:57 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
> > IMO mbedtls could be selected by default.
> I don't agree as this will break backward compatibility which should
> really be avoided.
> Moreover, it should also be noted that upstream openvpn uses openssl,
> and not mbedtls, by default:
> https://github.com/OpenVPN/openvpn/blob/master/configure.ac#L267

AFAIK openvpn for Android and iOS uses mbedtls. So it is a well-tested
configuration.
I offered mbedtls as the default option because it is much more
compact (the difference in the size of the uncompressed image is about
2 MB).

BTW, I have been using my patch on 100+ devices since May with no issues at all.

> We could add a Config option to allow the user to select the crypto
> backend as some buildroot packages have such an option (libcurl,
> libssh) however most don't (shairport-sync, uacme, ustream-ssl,
> libnice, efl, lftp ...).
> To conclude, I would advise that you send a v2 of your patch.

Indeed I would be happy with your patch as well if openssl should
remain the default choice.

From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 15 Sep 2019 15:54:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: add missing
 host-perl dependency
In-Reply-To: <20190915130113.53523-1-aperez@igalia.com>
References: <20190915130113.53523-1-aperez@igalia.com>
Message-ID: <CAB0FRstKbDpiaa2+CVhR48+7zq9AH2-Aje6WvwhOc+bme2fm9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 15 sept. 2019 ? 15:01, Adrian Perez de Castro <aperez@igalia.com> a
?crit :

> Fixes:
>
> http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71/
>
> The JSON::PP module is included within the Perl installation. WebKit
> has some scripts used at build time which require Perl installed in
> the host.
>
>
Building host-perl is overkill, the system perl is enough.
The presence of a core module like JSON::PP could be checked in
dependencies.sh
see
https://git.busybox.net/buildroot/tree/support/dependencies/dependencies.sh#n259
Note: JSON::PP is a core module since Perl 5.18 which was released in 2013

Fran?ois


> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/webkitgtk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/
> webkitgtk.mk
> index 97e3311654..74c832d5df 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -12,7 +12,7 @@ WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
>  WEBKITGTK_LICENSE_FILES = \
>         Source/WebCore/LICENSE-APPLE \
>         Source/WebCore/LICENSE-LGPL-2.1
> -WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
> +WEBKITGTK_DEPENDENCIES = host-ruby host-perl host-python host-gperf \
>         enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
>         libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
>  WEBKITGTK_CONF_OPTS = \
> --
> 2.23.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190915/410825e0/attachment.html>

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 00:01:17 +0100
Subject: [Buildroot] [PATCH next v3] python-certifi: add new package
In-Reply-To: <1416694002-27684-1-git-send-email-yegorslists@googlemail.com>
References: <1416694002-27684-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20141122230117.GG4295@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2014-11-22 23:06 +0100, Yegor Yefremov spake thusly:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Hashes manually verified.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes:
> 	v3: add hash and fix license stuff
> 	v2: add MPL incense
> 
>  package/Config.in                          |  1 +
>  package/python-certifi/Config.in           |  6 ++++++
>  package/python-certifi/python-certifi.hash |  2 ++
>  package/python-certifi/python-certifi.mk   | 14 ++++++++++++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/python-certifi/Config.in
>  create mode 100644 package/python-certifi/python-certifi.hash
>  create mode 100644 package/python-certifi/python-certifi.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a6977ce..cffa8d4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -482,6 +482,7 @@ endif
>  if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  menu "external python modules"
>  	source "package/python-bottle/Config.in"
> +	source "package/python-certifi/Config.in"
>  	source "package/python-cffi/Config.in"
>  	source "package/python-configobj/Config.in"
>  	source "package/python-configshell-fb/Config.in"
> diff --git a/package/python-certifi/Config.in b/package/python-certifi/Config.in
> new file mode 100644
> index 0000000..9390b4f
> --- /dev/null
> +++ b/package/python-certifi/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_CERTIFI
> +	bool "python-certifi"
> +	help
> +	  Python package for providing Mozilla's CA Bundle.
> +
> +	  https://pypi.python.org/pypi/certifi
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> new file mode 100644
> index 0000000..9277f51
> --- /dev/null
> +++ b/package/python-certifi/python-certifi.hash
> @@ -0,0 +1,2 @@
> +sha1   f53dc8f57aaf6d69c183ebadcec52ece0a55cc3f                         certifi-14.05.14.tar.gz
> +sha256 1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69 certifi-14.05.14.tar.gz
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> new file mode 100644
> index 0000000..f142041
> --- /dev/null
> +++ b/package/python-certifi/python-certifi.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-certifi
> +#
> +################################################################################
> +
> +PYTHON_CERTIFI_VERSION = 14.05.14
> +PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> +PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/source/c/certifi
> +PYTHON_CERTIFI_SETUP_TYPE = setuptools
> +PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
> +PYTHON_CERTIFI_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> -- 
> 1.8.3.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141123/33cb343e/attachment.asc>

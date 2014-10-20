From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 18:44:31 +0200
Subject: [Buildroot] [PATCH v3] yaml-cpp: new package
In-Reply-To: <1413817878-26953-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1413817878-26953-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20141020164431.GA3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sebastien, All,

On 2014-10-20 11:11 -0400, Sebastien Bourdelin spake thusly:
> yaml-cpp is a YAML parser and emitter in C++ matching
> the YAML 1.2 spec.
> 
> https://code.google.com/p/yaml-cpp/
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hasehs manually checked, OK.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - added comments to explain the dependencies inherited from boost
> 		  (suggested by yann.morin.1998 at free.fr)
> ---
> Changes v1 -> v2:
>   - rename the commit title (suggested by
> 		  thomas.petazzoni at free-electrons.com)
>   - change package place to Librairies > XML/JSON (suggested by
> 		  thomas.petazzoni at free-electrons.com)
>   - change the YAML_CPP_VERSION and remove the useless YAML_CPP_SOURCE
> 		  (suggested by thomas.petazzoni at free-electrons.com)
> ---
>  package/Config.in              |  1 +
>  package/yaml-cpp/Config.in     | 14 ++++++++++++++
>  package/yaml-cpp/yaml-cpp.hash |  5 +++++
>  package/yaml-cpp/yaml-cpp.mk   | 13 +++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/yaml-cpp/Config.in
>  create mode 100644 package/yaml-cpp/yaml-cpp.hash
>  create mode 100644 package/yaml-cpp/yaml-cpp.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 89b46dc..7ff953e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -737,6 +737,7 @@ menu "JSON/XML"
>  	source "package/tinyxml/Config.in"
>  	source "package/xerces/Config.in"
>  	source "package/yajl/Config.in"
> +	source "package/yaml-cpp/Config.in"
>  endmenu
>  
>  menu "Logging"
> diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
> new file mode 100644
> index 0000000..d6afdac
> --- /dev/null
> +++ b/package/yaml-cpp/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_YAML_CPP
> +	bool "yaml-cpp"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE # boost
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
> +	select BR2_PACKAGE_BOOST
> +	help
> +	  yaml-cpp is a YAML parser and emitter in C++ matching
> +	  the YAML 1.2 spec.
> +
> +	  https://code.google.com/p/yaml-cpp/
> +
> +comment "yaml-cpp needs a toolchain w/ C++, largefile, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
> new file mode 100644
> index 0000000..391e317
> --- /dev/null
> +++ b/package/yaml-cpp/yaml-cpp.hash
> @@ -0,0 +1,5 @@
> +# hash from: https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz:
> +sha1 9c5414b4090491e96d1b808fe8628b31e625fdaa  yaml-cpp-0.5.1.tar.gz
> +
> +# Locally calculated:
> +sha256 3e7c9052b43d987d41819a203d97fc45de4eed3ec67e0fdb14265c3d11046f06  yaml-cpp-0.5.1.tar.gz
> diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
> new file mode 100644
> index 0000000..5ebdb23
> --- /dev/null
> +++ b/package/yaml-cpp/yaml-cpp.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# yaml-cpp
> +#
> +################################################################################
> +
> +YAML_CPP_VERSION = 0.5.1
> +YAML_CPP_SITE = https://yaml-cpp.googlecode.com/files
> +YAML_CPP_INSTALL_STAGING = YES
> +YAML_CPP_LICENSE = MIT
> +YAML_CPP_LICENSE_FILES = license.txt
> +
> +$(eval $(cmake-package))
> -- 
> 1.8.3.4
> 

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141020/1ea10040/attachment.asc>

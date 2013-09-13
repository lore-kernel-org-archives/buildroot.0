From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Fri, 13 Sep 2013 11:11:15 -0500
Subject: [Buildroot] [PATCH v4] omniorb: new package
In-Reply-To: <1379075641-18347-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1379075641-18347-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <OF4836DA8A.1B5738BC-ON86257BE5.0057FDFB-86257BE5.0058F076@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt Weber <mlweber1@rockwellcollins.com> wrote on 09/13/2013 07:34:01 AM:

> From: Matt Weber <mlweber1@rockwellcollins.com>
> To: buildroot at busybox.net
> Cc: Matt Weber <mlweber1@rockwellcollins.com>
> Date: 09/13/2013 07:34 AM
> Subject: [PATCH v4] omniorb: new package
> 
> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> ---
> Changes v3 -> v4
>   * Added depedency on BR2_INSTALL_LIBSTCPP and comment about
>     support when it's missing. package/omniorb/Config.in (suggested by 
Peter)
>   * Removed trailing white space package/omniorb/Config.in 
> (suggested by Peter)
>   * Cleaned up omni patch name and added description with upstream link
>     package/omniorb/omniorb-0001-supportCrossCompileToolExport.patch
> (suggested by Peter)
>   * Changed places where OMNIORB was uppercase to omniORB.  ORB is an
>     acronym, omni is not. package/omniorb/omniorb.mk (suggested by 
Peter)
>   * Removed empty line after autotools-package package/omniorb/
> omniorb.mk (suggested by Peter)
> 
[snip]

> 
> diff --git a/package/Config.in b/package/Config.in
> index 0d457a6..91e68e7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -625,6 +625,7 @@ source "package/libupnp/Config.in"
>  source "package/libvncserver/Config.in"
>  source "package/libwebsockets/Config.in"
>  source "package/nss-mdns/Config.in"
> +source "package/omniorb/Config.in"
>  source "package/openpgm/Config.in"
>  source "package/ortp/Config.in"
>  source "package/slirp/Config.in"
> diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
> new file mode 100644
> index 0000000..fcf6fc7
> --- /dev/null
> +++ b/package/omniorb/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_OMNIORB
> +   bool "omniorb"
> +   depend BR2_INSTALL_LIBSTCPP
> +   help
> +     omniORB is a robust high performance CORBA ORB for C++ and Python.
> +     omniORB is largely CORBA 2.6 compliant. omniORB is one of only
> +     three ORBs to have been awarded the Open Group's Open Brand for
> +     CORBA. This means that omniORB has been tested and certified
> +     CORBA compliant, to version 2.1 of the CORBA specification.
> +
> +     http://omniorb.sourceforge.net/
> +
> +comment "omniORB requires a toolchain with C++ support"
> +   depends !BR2_INSTALL_LIBSTCPP
created a bug with the depends.  will fix and resubmit.

[snip]

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130913/35db293e/attachment-0001.html>

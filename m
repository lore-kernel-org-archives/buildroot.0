From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 19:52:59 +0100
Subject: [Buildroot] [PATCH] ZNC: new package
In-Reply-To: <1388876370-3441-1-git-send-email-cedric.chepied@gmail.com>
References: <1388876370-3441-1-git-send-email-cedric.chepied@gmail.com>
Message-ID: <20140128195259.73158fe4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Ch?pied,

On Sat,  4 Jan 2014 23:59:30 +0100, C?dric Ch?pied wrote:
> ZNC is an IRC bouncer.
> It is available in menu "Networking applications"
> ---
>  package/Config.in     |  1 +
>  package/znc/Config.in |  6 ++++++
>  package/znc/znc.mk    | 22 ++++++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/znc/Config.in
>  create mode 100644 package/znc/znc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 35de506..925a6bf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -936,6 +936,7 @@ source "package/wpa_supplicant/Config.in"
>  source "package/wvdial/Config.in"
>  source "package/xinetd/Config.in"
>  source "package/xl2tp/Config.in"
> +source "package/znc/Config.in"
>  
>  endmenu
>  
> diff --git a/package/znc/Config.in b/package/znc/Config.in
> new file mode 100644
> index 0000000..ef5db26
> --- /dev/null
> +++ b/package/znc/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_ZNC
> +       bool "znc"
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_PERL
> +       help
> +         Advanced IRC bouncer

We generally want the URL of the project here in the help text. See
what we do for all other packages.

Looking at the configure.ac from ZNC, it seems like the OpenSSL and
Perl support is optional, and can be disabled using --disable-openssl
and --disable-perl. It would probably be a good idea to use these to
make these dependencies optional.

Also, your znc.mk should have ZNC_LICENSE and ZNC_LICENSE_FILES
defined. Look at the Buildroot manual for details about these.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

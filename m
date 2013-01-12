From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:44:45 +0100
Subject: [Buildroot] [PATCH 17/28] libgtk2: replace dependency on X.org
	server by dependency on libraries
In-Reply-To: <85bd537959bc6cf985757894bbbdaf854e7134a6.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:29 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <85bd537959bc6cf985757894bbbdaf854e7134a6.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87hamm2i0i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libgtk2 is a X client library, so it doesn't make sense for it to
 Thomas> depend on the X.org server. Instead, it should depend on the X client
 Thomas> libraries.

 Thomas> This patch therefore replaces the dependency on the X server by a
 Thomas> dependency on libX11, libXext, libXrender and fontconfig, that are the
 Thomas> mandatory requirements to build the X backend of Gtk.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libgtk2/Config.in  |    5 +++++
 Thomas>  package/libgtk2/libgtk2.mk |    3 ++-
 Thomas>  2 files changed, 7 insertions(+), 1 deletion(-)

 Thomas> diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
 Thomas> index efaf12f..42aef4b 100644
 Thomas> --- a/package/libgtk2/Config.in
 Thomas> +++ b/package/libgtk2/Config.in
 Thomas> @@ -8,6 +8,10 @@ config BR2_PACKAGE_LIBGTK2
 Thomas>  	select BR2_PACKAGE_LIBGLIB2
 Thomas>  	select BR2_PACKAGE_PANGO
 Thomas>  	select BR2_PACKAGE_GDK_PIXBUF
 Thomas> +	select BR2_PACKAGE_FONTCONFIG if BR2_PACKAGE_XORG7
 Thomas> +	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 Thomas> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 Thomas> +	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_XORG7
 Thomas>  	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 Thomas>  	depends on BR2_USE_WCHAR # glib2
 Thomas>  	depends on BR2_INSTALL_LIBSTDCPP # pango
 Thomas> @@ -19,6 +23,7 @@ config BR2_PACKAGE_LIBGTK2
 Thomas>  config BR2_PACKAGE_LIBGTK2_DEMO
 Thomas>  	bool "Install libgtk2 demo program"
 Thomas>  	depends on BR2_PACKAGE_LIBGTK2
 Thomas> +
 Thomas>  	help

This empty line shouldn't be there. Committed without this change,
thanks.

-- 
Bye, Peter Korsgaard

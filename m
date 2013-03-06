From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Mar 2013 21:59:25 +0100
Subject: [Buildroot] [PATCH 03/34] x11r7/xcb-util-wm: new package
In-Reply-To: <1362601396-32250-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 6 Mar 2013 21:22:45 +0100")
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2vc6y8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/x11r7/Config.in                  |    1 +
 Thomas>  package/x11r7/xcb-util-wm/Config.in      |   15 +++++++++++++++
 Thomas>  package/x11r7/xcb-util-wm/xcb-util-wm.mk |   13 +++++++++++++
 Thomas>  3 files changed, 29 insertions(+)
 Thomas>  create mode 100644 package/x11r7/xcb-util-wm/Config.in
 Thomas>  create mode 100644 package/x11r7/xcb-util-wm/xcb-util-wm.mk

 Thomas> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
 Thomas> index 706574c..2abd593 100644
 Thomas> --- a/package/x11r7/Config.in
 Thomas> +++ b/package/x11r7/Config.in
 Thomas> @@ -16,6 +16,7 @@ if BR2_PACKAGE_XORG7
 Thomas>  		source package/x11r7/mesa3d/Config.in
 Thomas>  		source package/x11r7/xcb-util/Config.in
 Thomas>  		source package/x11r7/xcb-util-keysyms/Config.in
 Thomas> +		source package/x11r7/xcb-util-wm/Config.in
 Thomas>  		source package/x11r7/xlib_libFS/Config.in
 Thomas>  		source package/x11r7/xlib_libICE/Config.in
 Thomas>  		source package/x11r7/xlib_libSM/Config.in
 Thomas> diff --git a/package/x11r7/xcb-util-wm/Config.in b/package/x11r7/xcb-util-wm/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..491e7a3
 Thomas> --- /dev/null
 Thomas> +++ b/package/x11r7/xcb-util-wm/Config.in
 Thomas> @@ -0,0 +1,15 @@
 Thomas> +config BR2_PACKAGE_XCB_UTIL_WM
 Thomas> +	bool "xcb-util-wm"
 Thomas> +	help

Doesn't this need to depend on libxcb or atleast host-pkgconf?

checking for XCB... no
configure: error: in `/home/peko/source/buildroot/output/build/xcb-util-wm-0.3.9':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables XCB_CFLAGS
and XCB_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

To get pkg-config, see <http://pkg-config.freedesktop.org/>.
See `config.log' for more details
make: *** [/home/peko/source/buildroot/output/build/xcb-util-wm-0.3.9/.stamp_configured] Error 1

-- 
Bye, Peter Korsgaard

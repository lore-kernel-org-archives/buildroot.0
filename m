From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Mar 2013 22:00:59 +0100
Subject: [Buildroot] [PATCH 04/34] x11r7/xcb-util-image: new package
In-Reply-To: <1362601396-32250-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 6 Mar 2013 21:22:46 +0100")
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v606y5w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/x11r7/Config.in                        |    1 +
 Thomas>  package/x11r7/xcb-util-image/Config.in         |   15 +++++++++++++++
 Thomas>  package/x11r7/xcb-util-image/xcb-util-image.mk |   14 ++++++++++++++
 Thomas>  3 files changed, 30 insertions(+)
 Thomas>  create mode 100644 package/x11r7/xcb-util-image/Config.in
 Thomas>  create mode 100644 package/x11r7/xcb-util-image/xcb-util-image.mk

 Thomas> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
 Thomas> index 2abd593..5d0f991 100644
 Thomas> --- a/package/x11r7/Config.in
 Thomas> +++ b/package/x11r7/Config.in
 Thomas> @@ -15,6 +15,7 @@ if BR2_PACKAGE_XORG7
 Thomas>  		source package/x11r7/libxcb/Config.in
 Thomas>  		source package/x11r7/mesa3d/Config.in
 Thomas>  		source package/x11r7/xcb-util/Config.in
 Thomas> +		source package/x11r7/xcb-util-image/Config.in
 Thomas>  		source package/x11r7/xcb-util-keysyms/Config.in
 Thomas>  		source package/x11r7/xcb-util-wm/Config.in
 Thomas>  		source package/x11r7/xlib_libFS/Config.in
 Thomas> diff --git a/package/x11r7/xcb-util-image/Config.in b/package/x11r7/xcb-util-image/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..31fc61a
 Thomas> --- /dev/null
 Thomas> +++ b/package/x11r7/xcb-util-image/Config.in
 Thomas> @@ -0,0 +1,15 @@
 Thomas> +config BR2_PACKAGE_XCB_UTIL_IMAGE
 Thomas> +	bool "xcb-util-image"
 Thomas> +	select BR2_PACKAGE_XCB_UTIL

Same here:

checking for XCB... no
configure: error: in `/home/peko/source/buildroot/output/build/xcb-util-0.3.9':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables XCB_CFLAGS
and XCB_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

To get pkg-config, see <http://pkg-config.freedesktop.org/>.
See `config.log' for more details
make: *** [/home/peko/source/buildroot/output/build/xcb-util-0.3.9/.stamp_configured] Error 1

-- 
Bye, Peter Korsgaard

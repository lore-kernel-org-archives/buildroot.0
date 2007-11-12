From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 12 Nov 2007 19:02:12 +0100
Subject: [Buildroot] My tweeks/fixes to get a mostly default
	system	working w/ 2.6.23.1 kernel
In-Reply-To: <35333.74.94.141.114.1194881381.squirrel@bvwireless.net>
References: <35333.74.94.141.114.1194881381.squirrel@bvwireless.net>
Message-ID: <20071112180211.GI6510@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 12, 2007 at 10:29:41AM -0500, Eric Malkowski wrote:

>Index: package/quagga/quagga.mk
>===================================================================
>--- package/quagga/quagga.mk    (revision 20365)
>+++ package/quagga/quagga.mk    (working copy)
>@@ -139,6 +139,8 @@
>        (cd $(QUAGGA_DIR); rm -rf config.cache; \
>                $(TARGET_CONFIGURE_OPTS) \
>                $(TARGET_CONFIGURE_ARGS) \
>+               ac_cv_func_malloc_0_nonnull=yes \
>+               ac_cv_func_realloc_0_nonnull=yes \

Unfortunately this isn't correct. See package/Makefile.in at least in my
tree.

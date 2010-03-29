From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Mar 2010 16:45:26 +0200
Subject: [Buildroot] [PATCH] Bump libdrm to 2.4.14
In-Reply-To: <1269849170-13244-1-git-send-email-paul@pauljones.id.au> (Paul
	Jones's message of "Mon, 29 Mar 2010 18:52:50 +1100")
References: <1269849170-13244-1-git-send-email-paul@pauljones.id.au>
Message-ID: <87bpe7chkp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Jones <paul@pauljones.id.au> writes:

 Paul> Also adds proper dependency information to stop build errors.
 Paul> Signed-off-by: Paul Jones <paul@pauljones.id.au>
 Paul> ---
 Paul>  package/libdrm/Config.in |    6 ++++++
 Paul>  package/libdrm/libdrm.mk |    4 +++-
 Paul>  2 files changed, 9 insertions(+), 1 deletions(-)

 Paul> diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
 Paul> index 3d8a731..e1d35ad 100644
 Paul> --- a/package/libdrm/Config.in
 Paul> +++ b/package/libdrm/Config.in
 Paul> @@ -1,5 +1,11 @@
 Paul>  config BR2_PACKAGE_LIBDRM
 Paul>  	bool "libdrm"
 Paul> +	select BR2_PACKAGE_XPROTO_GLPROTO
 Paul> +	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 Paul> +	select BR2_PACKAGE_XLIB_LIBXXF86VM
 Paul> +	select BR2_PACKAGE_XLIB_LIBXMU
 Paul> +	select BR2_PACKAGE_XPROTO_DRI2PROTO
 Paul> +	select BR2_PACKAGE_PTHREAD_STUBS

That won't work unless we make libdrm depend on the X stuff, as those
packages are only available when BR2_PACKAGE_XORG7 is enabled - E.G.:

make: *** No rule to make target `xproto_glproto', needed by `libdrm-depends'.  Stop.

Care to fix?

-- 
Bye, Peter Korsgaard

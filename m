From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jul 2013 17:21:16 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: needs threads
In-Reply-To: <1373900642-9049-1-git-send-email-spenser@gillilanding.com>
References: <1373900642-9049-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130715172116.141937ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Mon, 15 Jul 2013 10:04:02 -0500, Spenser Gilliland wrote:
> See autobuild failures
> 
> http://autobuild.buildroot.net/results/d1fb882fe4d22a17bdd438360da515011dda2b30/build-end.log
> http://autobuild.buildroot.net/results/b66e807769ead5caa3e3b6312e9f7c35c14eafe7/build-end.log
> http://autobuild.buildroot.net/results/9c3fa0c5003a6369e70bfe6d611f7d745742a8c7/build-end.log
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/libglib2/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
> index 5282885..0ee53b7 100644
> --- a/package/libglib2/Config.in
> +++ b/package/libglib2/Config.in
> @@ -5,10 +5,12 @@ config BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBFFI
>  	select BR2_PACKAGE_ZLIB
>  	depends on BR2_USE_WCHAR # gettext
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

No this doesn't work. If you want to do this, you should remove the
libglib2 patch that attempts at making glib work without thread support
and propagate this depends on to all the reverse dependencies of
libglib2.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

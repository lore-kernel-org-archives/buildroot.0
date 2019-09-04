From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 4 Sep 2019 06:29:15 -0700
Subject: [Buildroot] [PATCH/next 1/1] package/libite: bump version to
 2.1.0
In-Reply-To: <20190831114558.24718-1-bernd.kuhls@t-online.de>
References: <20190831114558.24718-1-bernd.kuhls@t-online.de>
Message-ID: <7cbf1f2f-b22f-6f84-fee3-bbc1d18399a6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 8/31/2019 4:45 AM, Bernd Kuhls wrote:
> Added md5 hash provided by upstream.
> Switched from github helper to .xz tarball provided by upstream.
> This tarball contains a configure script so we do not need to
> autoreconf anymore.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/libite/libite.hash | 4 +++-
>   package/libite/libite.mk   | 6 +++---
>   2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/package/libite/libite.hash b/package/libite/libite.hash
> index 01859f0a21..db3f6232b2 100644
> --- a/package/libite/libite.hash
> +++ b/package/libite/libite.hash
> @@ -1,5 +1,7 @@
> +# From https://github.com/troglobit/libite/releases/download/v2.1.0/libite-2.1.0.tar.xz.md5
> +md5 701aa509f27ee35156bc53601e69fa74  libite-2.1.0.tar.xz
>   # Locally calculated
> -sha256 bd5d08066f3e53cc8967beb6f0620286aad7a24d49fb730caa1c6d09a26bb705  libite-2.0.2.tar.gz
> +sha256 cf56e720146243749e0af5763d4a84eef738e20f2bef2d867497fefc39dee991  libite-2.1.0.tar.xz
>   sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
>   sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  src/chomp.c
>   sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
> diff --git a/package/libite/libite.mk b/package/libite/libite.mk
> index 7fe6ce33b8..3ef5efe672 100644
> --- a/package/libite/libite.mk
> +++ b/package/libite/libite.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -LIBITE_VERSION = 2.0.2
> -LIBITE_SITE = $(call github,troglobit,libite,v$(LIBITE_VERSION))
> +LIBITE_VERSION = 2.1.0
> +LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
> +LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)/
>   LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
>   LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
>   LIBITE_INSTALL_STAGING = YES
> -LIBITE_AUTORECONF = YES
>   
>   $(eval $(autotools-package))


I get the following error:

package/libite/libite.mk:14: *** LIBITE_SITE 
(https://github.com/troglobit/libite/releases/download/v2.1.0/) cannot 
have a trailing slash.? Stop.


Otherwise,

Tested-by: Ryan Coe <bluemrp9@gmail.com>

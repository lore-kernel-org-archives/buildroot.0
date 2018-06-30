From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 00:10:06 +0200
Subject: [Buildroot] [PATCH 2/5] Add first KF5 package :
 extra-cmake-modules
In-Reply-To: <20180215204815.14707-2-pinaraf@pinaraf.info>
References: <20180215204815.14707-1-pinaraf@pinaraf.info>
 <20180215204815.14707-2-pinaraf@pinaraf.info>
Message-ID: <20180701001006.35ced39f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 21:48:12 +0100, Pierre Ducroquet wrote:
> extra-cmake-modules contains several additional CMake modules used by the
> other KF5 packages. It does not install anything on the target and contain
> only CMake files for the host.
> 
> Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>

I've applied this package. To be honest, I wasn't sure if it should be
a host package or a target package, but since CMake looks for its
module in $(STAGING_DIR), having it as a target package like you did
was the easiest option. We can always change this later if needed.

I fixed the commit title to follow our convention.

> ---
>  package/kf5/Config.in                                   |  1 +
>  package/kf5/kf5-extra-cmake-modules/Config.in           | 11 +++++++++++
>  .../kf5-extra-cmake-modules.hash                        |  2 ++
>  .../kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk  | 17 +++++++++++++++++
>  4 files changed, 31 insertions(+)
>  create mode 100644 package/kf5/kf5-extra-cmake-modules/Config.in
>  create mode 100644 package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
>  create mode 100644 package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
> 
> diff --git a/package/kf5/Config.in b/package/kf5/Config.in
> index 4e6ee3a107..89d8c7a140 100644
> --- a/package/kf5/Config.in
> +++ b/package/kf5/Config.in
> @@ -6,4 +6,5 @@ menuconfig BR2_PACKAGE_KF5
>  	  select which modules should be built.
>  
>  if BR2_PACKAGE_KF5
> +source "package/kf5/kf5-extra-cmake-modules/Config.in"
>  endif
> diff --git a/package/kf5/kf5-extra-cmake-modules/Config.in b/package/kf5/kf5-extra-cmake-modules/Config.in
> new file mode 100644
> index 0000000000..3319ccf2c7
> --- /dev/null
> +++ b/package/kf5/kf5-extra-cmake-modules/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
> +	bool "kf5-extra-cmake-modules"
> +	help
> +	  KF5 is a set of Qt framework addons, extending Qt in
> +	  various ways, not only restricted in helping integration
> +	  in KDE.
> +	  

There was some trailing space here.

> +	  This package corresponds to the extra CMake modules, required
> +	  for most KF5 libraries.
> +
> +	  https://api.kde.org/frameworks/extra-cmake-modules/html/index.html
> diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
> new file mode 100644
> index 0000000000..4481b80af7
> --- /dev/null
> +++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 5757a5ddceede5321b58345a8dbf953c2282487bf9c24ae477efde800b94fffd extra-cmake-modules-5.43.0.tar.xz

I've updated the hash for 5.47, and added the hash of the license file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

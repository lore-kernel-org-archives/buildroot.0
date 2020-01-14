From: daggs <daggs@gmx.com>
Date: Tue, 14 Jan 2020 13:45:43 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/rpi-userland: bump version
 to 42ec119
In-Reply-To: <20200114094256.23174-3-ps.report@gmx.net>
References: <20200114094256.23174-1-ps.report@gmx.net>
 <20200114094256.23174-3-ps.report@gmx.net>
Message-ID: <trinity-41871925-7822-4238-98ae-909b71ee05a8-1579005943320@3c-app-mailcom-bs09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Peter,

> Sent: Tuesday, January 14, 2020 at 11:42 AM
> From: "Peter Seiderer" <ps.report@gmx.net>
> To: buildroot at buildroot.org
> Cc: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>, "Martin Bark" <martin@barkynet.com>, "Mahyar Koshkouei" <mahyar.koshkouei@gmail.com>, "Arthur Courtel" <arthur.courtel@smile.fr>
> Subject: [Buildroot] [PATCH v1 3/3] package/rpi-userland: bump version to 42ec119
>
> - add 0006-Fix-for-cmake-vmcs_host-error-fixes-603.patch (upstream
>   suggested cmake compile fix, taken from [1])
>
> [1] https://github.com/raspberrypi/userland/pull/605/commits/c22df881e1f45f8934b355e903f4d9be2391ab98
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...-for-cmake-vmcs_host-error-fixes-603.patch | 29 +++++++++++++++++++
>  package/rpi-userland/rpi-userland.hash        |  2 +-
>  package/rpi-userland/rpi-userland.mk          |  2 +-
>  3 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 package/rpi-userland/0006-Fix-for-cmake-vmcs_host-error-fixes-603.patch
>
> diff --git a/package/rpi-userland/0006-Fix-for-cmake-vmcs_host-error-fixes-603.patch b/package/rpi-userland/0006-Fix-for-cmake-vmcs_host-error-fixes-603.patch
> new file mode 100644
> index 0000000000..d0669f0f06
> --- /dev/null
> +++ b/package/rpi-userland/0006-Fix-for-cmake-vmcs_host-error-fixes-603.patch
> @@ -0,0 +1,29 @@
> +From 902831348f72c88df2776d4a09e86874ae2e34e0 Mon Sep 17 00:00:00 2001
> +From: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> +Date: Fri, 27 Dec 2019 15:49:45 +0100
> +Subject: [PATCH] Fix for cmake vmcs_host error (fixes #603)
> +
> +Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
> +
> +Upstream: https://github.com/raspberrypi/userland/pull/605/commits/c22df881e1f45f8934b355e903f4d9be2391ab98
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + interface/vmcs_host/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
> +index e34e0ae..ab2e0fa 100755
> +--- a/interface/vmcs_host/CMakeLists.txt
> ++++ b/interface/vmcs_host/CMakeLists.txt
> +@@ -24,7 +24,7 @@ if(NOT ARM64)
> +
> + 	# ILCS pulls in EGL for the ILCS/EGL surface API support
> + 	target_link_libraries(vcilcs brcmEGL brcmGLESv2 khrn_client vchiq_arm vcos)
> +-	set(INSTALL_TARGETS "${INSTALL_TARGETS} vcilcs")
> ++	set(INSTALL_TARGETS ${INSTALL_TARGETS} vcilcs)
> + endif()
> +
> + # vchostif needs ilcore as well (vmcs_main pulls it in)
> +--
> +2.24.1
> +
> diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
> index 6d59f2aafc..98d62fa73f 100644
> --- a/package/rpi-userland/rpi-userland.hash
> +++ b/package/rpi-userland/rpi-userland.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 d6231e9fa33c805cf7cbb559a0d6eb125605fc2ba862d9e5a3248778dd269859 rpi-userland-5070cb7fc150fc98f1ed64a7739c3356970d9f76.tar.gz
> +sha256 cb0f1d653fdb9975783f30359277d9de2868607381e081796eac68745e3e8324 rpi-userland-42ec119e03eb8dffc7c83e2ac0e665e333abbef6.tar.gz
>  sha256 bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5 LICENCE
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 2b672b6c97..555e84ecab 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RPI_USERLAND_VERSION = 5070cb7fc150fc98f1ed64a7739c3356970d9f76
> +RPI_USERLAND_VERSION = 42ec119e03eb8dffc7c83e2ac0e665e333abbef6
>  RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
>  RPI_USERLAND_LICENSE = BSD-3-Clause
>  RPI_USERLAND_LICENSE_FILES = LICENCE
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

do note that this commit allows rpi-userland compilation on aarch64. might be a good idea to fix rpi-userland.mk and Config.in to support that.

Dagg.

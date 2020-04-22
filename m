From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2020 21:53:17 +0200
Subject: [Buildroot] [PATCH 1/2] package/{openjdk,
 openjdk-bin}: bump version to 14.0.1+7
In-Reply-To: <20200422192118.4039564-1-aduskett@gmail.com>
References: <20200422192118.4039564-1-aduskett@gmail.com>
Message-ID: <20200422195317.GD5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, all,

On 2020-04-22 12:21 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master, thanks.

I am however not going to apply patch 2, which I think needs some
discussion...

Regards,
Yann E. MORIN.

> ---
>  package/openjdk-bin/openjdk-bin.hash | 8 ++++----
>  package/openjdk-bin/openjdk-bin.mk   | 4 ++--
>  package/openjdk/openjdk.hash         | 4 ++--
>  package/openjdk/openjdk.mk           | 4 ++--
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> index 98e039c17e..52380f55ae 100644
> --- a/package/openjdk-bin/openjdk-bin.hash
> +++ b/package/openjdk-bin/openjdk-bin.hash
> @@ -1,6 +1,6 @@
> -# From https://github.com/AdoptOpenJDK/openjdk12-binaries/releases
> -sha256  6c06853332585ab58834d9e8a02774b388e6e062ef6c4084b4f058c67f2e81b5	OpenJDK14U-jdk_x64_linux_hotspot_14_36.tar.gz
> +# From https://github.com/AdoptOpenJDK/openjdk14-binaries/releases
> +sha256  9ddf9b35996fbd784a53fff3e0d59920a7d5acf1a82d4c8d70906957ac146cd1  OpenJDK14U-jdk_x64_linux_hotspot_14.0.1_7.tar.gz
>  
>  # Locally calculated
> -sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
> -sha256	a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb	legal/java.prefs/ASSEMBLY_EXCEPTION
> +sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> +sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index 31dc4a4666..ca8e11fe13 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -HOST_OPENJDK_BIN_VERSION_MAJOR = 14
> -HOST_OPENJDK_BIN_VERSION_MINOR = 36
> +HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.1
> +HOST_OPENJDK_BIN_VERSION_MINOR = 7
>  HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
>  HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
>  HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> index d5be642052..e453d12d1a 100644
> --- a/package/openjdk/openjdk.hash
> +++ b/package/openjdk/openjdk.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634  jdk-14+36.tar.gz
> -sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> +sha256  301203cbda9c40a5fc496b3299806995ac4833b39c6d2e8470fd85a35461afd4  jdk-14.0.1+7.tar.gz
> +sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index ffa62dd10d..d33459db97 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -OPENJDK_VERSION_MAJOR = 14
> -OPENJDK_VERSION_MINOR = 36
> +OPENJDK_VERSION_MAJOR = 14.0.1
> +OPENJDK_VERSION_MINOR = 7
>  OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
>  OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
>  OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
> -- 
> 2.25.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 17 May 2017 12:40:56 +0300
Subject: [Buildroot] [PATCH v2] package/pulseview: fix a build issue
In-Reply-To: <1495012969-16933-1-git-send-email-brgl@bgdev.pl>
References: <1495012969-16933-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170517094056.liyuiskvqdjrplh2@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,

On Wed, May 17, 2017 at 11:22:49AM +0200, Bartosz Golaszewski wrote:
> Backport an upstream patch fixing the build issue related to boost
> math definitions.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> v1 -> v2:
> - backported the upstream patch instead of fixing it myself
> 
>  ...txt-Avoid-fext-numeric-literals-not-suppo.patch | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch
> 
> diff --git a/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch b/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch
> new file mode 100644
> index 0000000..3bd05bd
> --- /dev/null
> +++ b/package/pulseview/0003-CMakeLists.txt-Avoid-fext-numeric-literals-not-suppo.patch
> @@ -0,0 +1,26 @@
> +From 326f6d8317da370513868946c4a77dea0cd7f913 Mon Sep 17 00:00:00 2001
> +From: Uwe Hermann <uwe@hermann-uwe.de>
> +Date: Wed, 17 May 2017 11:00:44 +0200
> +Subject: [PATCH 3/3] CMakeLists.txt: Avoid -fext-numeric-literals, (not
> + supported by clang).

These patch numbers tend to get out of sync overtime. Please generate the 
patch with the -N parameter of 'git format-patch' to omit the numbering.

> +
> +This (re-)fixes bug #863.

Please add your sign-off here.

> +---
> + CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index e8bc79f..e7e4432 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -395,6 +395,7 @@ add_definitions(${QT_DEFINITIONS} -DQT_NO_KEYWORDS)
> + add_definitions(-D__STDC_LIMIT_MACROS)
> + add_definitions(-Wall -Wextra)
> + add_definitions(-std=c++11)
> ++add_definitions(-DBOOST_MATH_DISABLE_FLOAT128=1)
> + 
> + if(ENABLE_DECODE)
> + 	add_definitions(-DENABLE_DECODE)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

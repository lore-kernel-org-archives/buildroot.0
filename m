From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 May 2013 14:31:15 +0300
Subject: [Buildroot] [PATCH] poco: Add upstream patch to add support for
 aarch64.
In-Reply-To: <CAFbHwiTLP2KRtYo=wvG2EJdR=Uf7r1BeZb+S8=BFbJ1_8PyqEw@mail.gmail.com>
References: <CAFbHwiTLP2KRtYo=wvG2EJdR=Uf7r1BeZb+S8=BFbJ1_8PyqEw@mail.gmail.com>
Message-ID: <20130522113115.GT7188@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,

On Wed, May 22, 2013 at 11:49:30AM +0100, Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@linaro.org>
> ---
>  package/poco/poco-aarch64.patch | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/poco/poco-aarch64.patch

This patch conflicts with the one posted by Gustavo last week 
(http://lists.busybox.net/pipermail/buildroot/2013-May/072343.html). Both 
patches should be combined into a single one.

baruch

> 
> diff --git a/package/poco/poco-aarch64.patch b/package/poco/poco-aarch64.patch
> new file mode 100644
> index 0000000..f629f7b
> --- /dev/null
> +++ b/package/poco/poco-aarch64.patch
> @@ -0,0 +1,39 @@
> +From 37899eda9563d9134cb5864751b6432cabfaac3e Mon Sep 17 00:00:00 2001
> +From: Will Newton <will.newton@linaro.org>
> +Date: Tue, 21 May 2013 22:11:05 +0100
> +Subject: [PATCH] Foundation/include/Poco/Platform.h: Add support for AArch64.
> +
> +Add support for big and little endian AArch64 preprocessor defines.
> +---
> + Foundation/include/Poco/Platform.h | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/Foundation/include/Poco/Platform.h
> b/Foundation/include/Poco/Platform.h
> +index f34f277..8ddb4cb 100644
> +--- a/Foundation/include/Poco/Platform.h
> ++++ b/Foundation/include/Poco/Platform.h
> +@@ -145,6 +145,7 @@
> + #define POCO_ARCH_S390    0x0c
> + #define POCO_ARCH_SH      0x0d
> + #define POCO_ARCH_NIOS2   0x0e
> ++#define POCO_ARCH_AARCH64 0x0f
> +
> +
> + #if defined(__ALPHA) || defined(__alpha) || defined(__alpha__) ||
> defined(_M_ALPHA)
> +@@ -207,7 +208,12 @@
> +     #else
> +         #define POCO_ARCH_BIG_ENDIAN 1
> +     #endif
> +-
> ++#elif defined(__AARCH64EL__)
> ++    #define POCO_ARCH POCO_ARCH_AARCH64
> ++    #define POCO_ARCH_LITTLE_ENDIAN 1
> ++#elif defined(__AARCH64EB__)
> ++    #define POCO_ARCH POCO_ARCH_AARCH64
> ++    #define POCO_ARCH_BIG_ENDIAN 1
> + #endif
> +
> +
> +--
> +1.8.1.4
> +

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jan 2020 23:38:26 +0100
Subject: [Buildroot] [PATCH v1] package/zxing-cpp: bump version to
 0db7f85
In-Reply-To: <20200109143231.30713-1-ps.report@gmx.net>
References: <20200109143231.30713-1-ps.report@gmx.net>
Message-ID: <82156321-a41b-bd20-1f11-7341d26559aa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/01/2020 15:32, Peter Seiderer wrote:
> - bump version to 0db7f85
> - add hash for license file
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
> 
>  - upstream contains an altnenative fix for the c++11/testrunner
>    problem (enforcing -std=c++11 for the whole compile, see [1])

 Hum, so that means there is now a hard dependency on GCC 4.8+.

 Note that this doesn't lead to autobuilder failures because the oldest
toolchain we check for in the autobuilders is the Sourcery ARM toolchain which
is 4.8.

 Maybe we should do something about that...

 Regards,
 Arnout

> 
> [1] https://github.com/glassechidna/zxing-cpp/commit/14d0a7196993868e5fb5ef18afd03a2bf2ca8014
> ---
>  package/zxing-cpp/zxing-cpp.hash | 5 ++++-
>  package/zxing-cpp/zxing-cpp.mk   | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
> index 4625fbf61c..f12349bbd9 100644
> --- a/package/zxing-cpp/zxing-cpp.hash
> +++ b/package/zxing-cpp/zxing-cpp.hash
> @@ -1,2 +1,5 @@
>  # Locally calculated
> -sha256 643c931a35c363109cd38c5a1526505b75f57c0634907cb7b6bc24f6f48eb32b zxing-cpp-0db7f855135222becff193671faae79c083424b6.tar.gz
> +sha256 4c2b8601d0e3377143c1a0bbab220146af9fa5a5e29e8fbef42862fe3d38f8e6 zxing-cpp-e0e40ddec63f38405aca5c8c1ff60b85ec8b1f10.tar.gz
> +
> +# License files
> +sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4 COPYING
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> index 7113ae2b06..2cead4e65b 100644
> --- a/package/zxing-cpp/zxing-cpp.mk
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZXING_CPP_VERSION = 0db7f855135222becff193671faae79c083424b6
> +ZXING_CPP_VERSION = e0e40ddec63f38405aca5c8c1ff60b85ec8b1f10
>  ZXING_CPP_SITE = $(call github,glassechidna,zxing-cpp,$(ZXING_CPP_VERSION))
>  ZXING_CPP_LICENSE = Apache-2.0
>  ZXING_CPP_LICENSE_FILES = COPYING
> 

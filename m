From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 11:51:02 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: use -fPIC
In-Reply-To: <1392545101-26953-1-git-send-email-francois.perrad@gadz.org>
References: <1392545101-26953-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAHXCMMJC6k66QKHMmW8gHLvxJic2cAy2Xv52P2X41daS+Z18aQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Sun, Feb 16, 2014 at 11:05 AM, Francois Perrad <fperrad@gmail.com> wrote:
> fix build for lua-ev
> http://autobuild.buildroot.org/results/730/7303fffa6075d02289b6fdb12a1debdf0dd7d6f1//build-end.log
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-cmake.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index dbe0d97..f0b8e62 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -162,8 +162,8 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>         set(CMAKE_SYSTEM_NAME Linux)\n\
>         set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
>         set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
> -       set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS)\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
> -       set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS)\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\
> +       set(CMAKE_C_FLAGS \"\$${CMAKE_C_FLAGS} $(TARGET_CFLAGS) -fPIC\" CACHE STRING \"Buildroot CFLAGS\" FORCE)\n\
> +       set(CMAKE_CXX_FLAGS \"\$${CMAKE_CXX_FLAGS} $(TARGET_CXXFLAGS) -fPIC\" CACHE STRING \"Buildroot CXXFLAGS\" FORCE)\n\

Usually, PIC properties is set at the cmake target level, but this
property is driven by the global variable
CMAKE_POSITION_INDEPENDENT_CODE (see:
http://www.cmake.org/cmake/help/v2.8.12/cmake.html#prop_tgt:POSITION_INDEPENDENT_CODE)

I would prefer using this variable, it should not break anything if
some projects set this property otherwise.

Regards,


-- 
Samuel

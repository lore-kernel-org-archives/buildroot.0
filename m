From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 9 Jan 2011 00:42:42 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <20110107181536.53713c9a@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<20110107181536.53713c9a@surf>
Message-ID: <AANLkTimTzc3zxYPX40UjRqcGJ5-L2D9Y7-arPMdW9L9r@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2011/1/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello Bjorn,
>
> I finally had the time to try this, and got some issues, fixed by the
> below patch.
>
> On Sun, 12 Dec 2010 20:29:14 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> +$(O)/toolchainfile.cmake:
>> + ? ? @echo -en "\
>> + ? ? set(CMAKE_SYSTEM_NAME Linux)\n\
>> + ? ? set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
>> + ? ? set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
>> + ? ? set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
>> + ? ? set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
>> + ? ? set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
>> + ? ? set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
>> + ? ? " > $@
>>
>> ?.PHONY: all world dirs clean distclean source outputmakefile \
>> ? ? ? $(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
>
> diff --git a/Makefile b/Makefile
> index 831b424..994dd52 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -375,8 +375,11 @@ world: prepare dependencies dirs $(BASE_TARGETS)
> $(TARGETS_ALL) $(O)/toolchainfile.cmake:
> ? ? ? ?@echo -en "\
> ? ? ? ?set(CMAKE_SYSTEM_NAME Linux)\n\
> + ? ? ? set(CMAKE_PROGRAM_PATH $(HOST_DIR)/usr/bin)\n\
> ? ? ? ?set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
> ? ? ? ?set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
> + ? ? ? set(CMAKE_C_FLAGS \"$(CMAKE_TARGET_CFLAGS)\")\n\
> + ? ? ? set(CMAKE_CXX_FLAGS \"$(CMAKE_TARGET_CXXFLAGS)\")\n\
> ? ? ? ?set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
> ? ? ? ?set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> ? ? ? ?set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
>
> With those, I can successfully use the CMake toolchain file to build a
> Qt application against the Buildroot libraries.
>
> If you agree, could you merge those modifications into your patch ?

Yes, I will merge it. Thanks for testing and patching!

Best regards,
Bj?rn Forsman

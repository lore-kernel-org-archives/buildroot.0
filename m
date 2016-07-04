From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 5 Jul 2016 00:56:06 +0200
Subject: [Buildroot] [PATCH v3 00/14] Fortran support for all toolchains
In-Reply-To: <20160703170211.39c252b6@free-electrons.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
 <20160703170211.39c252b6@free-electrons.com>
Message-ID: <CAHXCMMLcuMbvWHkcE5SsUy_k=AxEhcmQvhgVEDuok-3SJ64GKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sun, Jul 3, 2016 at 5:02 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun,  3 Jul 2016 15:47:36 +0200, Samuel Martin wrote:
>
>> Samuel Martin (13):
>>   toolchain/toolchain-common.in: add BR2_TOOLCHAIN_HAS_LIBQUADMATH
>>     hidden symbol
>>   package/gcc: complete the logic on libquadmath
>>   package/gcc: fix fortran support
>>   toolchain: add hidden symbol for fortran support in the toolchain
>>   docs/manual: document dependency on fortran
>>   package/gcc: select BR2_TOOLCHAIN_HAS_FORTRAN when appropriate
>>   pkg-cmake.mk: export the fortran compiler path in the CMake toolchain
>>     file
>>   toolchain/helpers: add fortran check
>>   toolchain/toolchain-external: enable fortran check when it is selected
>>   toolchain/toolchain-external: add libgfortran and libquadmath to the
>>     TOOLCHAIN_EXTERNAL_LIBS list
>>   toolchain/toolchain-external: add knob for fortran support
>>   toolchain/toolchain-external: update external toolchain configuration
>>     with BR2_TOOLCHAIN_HAS_FORTRAN
>>   package/fftw: add fortran support
>
> I've applied those patches, with some minor tweaks here and there.
>
> However, I haven't applied the lapack patch since it fails to build
> with the Linaro toolchain as we discussed.

I've just rebased this patch on top of master (which includes this
commit [1] from Vicente), and now lapack builds correctly with
external prebuilt vendor toolchains.

[1] https://github.com/buildroot/buildroot/commit/c1d90e9bb7ad1b9737db9f6476a5bdaa27a9fa8a

Regards,

-- 
Samuel

From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 13:18:58 +0200
Subject: [Buildroot] [PATCH v2 08/15] package/gcc: used
 BR2_TOOLCHAIN_HAS_FORTRAN instead of BR2_TOOLCHAIN_BUILDROOT_FORTRAN
In-Reply-To: <20160701230623.505cc91a@free-electrons.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-9-s.martin49@gmail.com>
 <20160701230623.505cc91a@free-electrons.com>
Message-ID: <5e88dfd5-f29a-e7c5-c7b9-fc0e297272cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-07-16 23:06, Thomas Petazzoni wrote:
> Hello,
> 
> In the title: used -> use
> 
> On Fri,  1 Jul 2016 18:29:13 +0200, Samuel Martin wrote:
> 
>>  # Languages supported by the cross-compiler
>>  GCC_FINAL_CROSS_LANGUAGES-y = c
>>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
>> -GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
>> +GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_HAS_FORTRAN) += fortran
> 
> I am not actually sure of the value of this change, and I would rather
> suggest that BR2_TOOLCHAIN_BUILDROOT_CXX should be used to enable the
> C++ support.
> 
> To me, BR2_TOOLCHAIN_BUILDROOT_CXX and BR2_TOOLCHAIN_BUILDROOT_FORTRAN
> indicate that you *want* C++/Fortran support in the gcc being built by
> Buildroot. Those config options are from gcc, and affect the gcc build.
> 
> On the other hand BR2_INSTALL_LIBSTDCPP (which should be named
> BR2_TOOLCHAIN_HAS_CXX) and BR2_TOOLCHAIN_HAS_FORTRAN should be used by
> *consumers* that need C++ or Fortran.
> 
> So I would be inclined to reject this patch.

 I agree.

 BTW, we actually can easily change BR2_INSTALL_LIBSTDCPP into
BR2_TOOLCHAIN_HAS_CXX because it's a blind symbol.

 BR2_TOOLCHAIN_BUILDROOT_CXX _should_ actually be named BR2_PACKAGE_GCC_CXX, but
that's more difficult because it's not blind.

 Regards,
 Arnout

> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

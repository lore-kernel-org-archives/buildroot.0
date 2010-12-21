From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 06:53:24 -0800
Subject: [Buildroot] Fwd: g++-target compilation error
In-Reply-To: <AANLkTi=K0zKN0Oz2tctGrBrg=Pzth3ji+QZTrL7JCa1F@mail.gmail.com>
References: <AANLkTintm7dU1s=1HiGeMQob30kHY6yj+x7=y8EMTDM2@mail.gmail.com>
	<AANLkTi=9JkE_5Aff1uQrBPBRy+652O_RUyqote0+QXhh@mail.gmail.com>
	<AANLkTi=K0zKN0Oz2tctGrBrg=Pzth3ji+QZTrL7JCa1F@mail.gmail.com>
Message-ID: <20101221145324.GA4665@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On (16/12/10 18:56), Sergey Naumov wrote:
> I am trying to invertigate the problem with gcc-4.4.5-target
> compilation failure and it seems that while precompiling stdtr1c++.h
> it can't include <fenv.h> from <tr1/cfenv>, although in
> <bits/c++config.h> _GLIBCXX_HAVE_FENV_H is defined. It seems that it
> happens because <bits/c++config.h> is not included for stdtr1c++.h
> (pragma in c++config.h does not work for stdtr1c++.h, but works for
> stdc++.h)
> Complete log is in make.err.3.txt file.
> 
> Buildroot config + some useful logs are attached.
> 
> Sergey Naumov.

> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1/cctype:31: note: #pragma message: In file /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1/cctype TR1!! before include bits/c++config.h
> In file included from /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1/cctype:33,
>                  from /opt/buildroot-2010.11/output/toolchain/gcc-4.4.5/libstdc++-v3/include/precompiled/stdtr1c++.h:32:
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/cctype:42: note: #pragma message: In file /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/cctype before include bits/c++config.h
> In file included from /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1/cfenv:46,
>                  from /opt/buildroot-2010.11/output/toolchain/gcc-4.4.5/libstdc++-v3/include/precompiled/stdtr1c++.h:33:
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:49: error: '::fenv_t' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:50: error: '::fexcept_t' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:53: error: '::feclearexcept' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:54: error: '::fegetexceptflag' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:55: error: '::feraiseexcept' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:56: error: '::fesetexceptflag' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:57: error: '::fetestexcept' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:59: error: '::fegetround' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:60: error: '::fesetround' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:62: error: '::fegetenv' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:63: error: '::feholdexcept' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:64: error: '::fesetenv' has not been declared
> /opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include/tr1_impl/cfenv:65: error: '::feupdateenv' has not been declared
> make[3]: *** [i586-unknown-linux-uclibc/bits/stdtr1c++.h.gch/O2g.gch] Error 1
> make[3]: Leaving directory `/opt/buildroot-2010.11/output/build/gcc-4.4.5-target/i586-unknown-linux-uclibc/libstdc++-v3/include'

Try to compile uclibc with UCLIBC_HAS_FENV

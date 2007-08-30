From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 30 Aug 2007 07:07:31 +0200
Subject: [Buildroot] Revision 19714 breaks build of gcc 4.2.1
References: <f90898420708290617j1f87a539yf1bedcd060005dd7@mail.gmail.com>
	<46D57A3A.2060708@st.com>
Message-ID: <025301c7eac4$f2a09bd0$db03440a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The today's snapshot doesn't build because of the changes in
> 200-uclibc-locale.patch and 205-uclibc-locale-update.patch.
>
> Error-Log is attached.
>   
>
> In file included from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/iosfwd:45,
>                  from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/bits/stl_algobase.h:70,
>                  from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/algorithm:65,
>                  from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1/libstdc++-v3/include/precompiled/stdc++.h:55:
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h: In function ?int std::__convert_from_v(__uclibc_locale_struct* const&, char*, int, const char*, ...)?:
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h:100: error: ?uselocale? is not a member of ?__gnu_cxx?
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h:100: error: ?__cloc? was not declared in this scope
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h:115: error: ?uselocale? is not a member of ?__gnu_cxx?
> In file included from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/iosfwd:45,
>                  from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/bits/stl_algobase.h:70,


It seems to break the C++ build, so if you don't need C++ disable that.
Will look at this tonight.

Best Regards
Ulf Samuelsson

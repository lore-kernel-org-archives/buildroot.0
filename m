From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Wed, 29 Aug 2007 15:52:58 +0200
Subject: [Buildroot] Revision 19714 breaks build of gcc 4.2.1
In-Reply-To: <f90898420708290617j1f87a539yf1bedcd060005dd7@mail.gmail.com>
References: <f90898420708290617j1f87a539yf1bedcd060005dd7@mail.gmail.com>
Message-ID: <46D57A3A.2060708@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon Pasch wrote:
> The today's snapshot doesn't build because of the changes in
> 200-uclibc-locale.patch and 205-uclibc-locale-update.patch.
>
> Error-Log is attached.
>   
I think that latest changes (added by a my patch) exploited a 
old/sleeping problem...
It seems that uClibc has been configured with XLOCALE support enabled, 
but something else is missing.
If the uClibc configuration is not changed, in the past we never went in 
this path due to the wrong macro.

Carmelo
> ------------------------------------------------------------------------
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
>                  from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/algorithm:65,
>                  from /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1/libstdc++-v3/include/precompiled/stdc++.h:55:
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h: In function ?int std::__convert_from_v(__uclibc_locale_struct* const&, char*, int, const char*, ...)?:
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h:100: error: ?uselocale? is not a member of ?__gnu_cxx?
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h:100: error: ?__cloc? was not declared in this scope
> /home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include/i686-linux-uclibc/bits/c++locale.h:115: error: ?uselocale? is not a member of ?__gnu_cxx?
> make[5]: *** [i686-linux-uclibc/bits/stdc++.h.gch/O0g.gch] error 1
> make[5]: *** Warte auf noch nicht beendete Prozesse...
> make[5]: *** [i686-linux-uclibc/bits/stdc++.h.gch/O2g.gch] error 1
> make[5]: Leaving directory `/home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3/include'
> make[4]: *** [all-recursive] error 1
> make[4]: Leaving directory `/home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3'
> make[3]: *** [all] error 2
> make[3]: Leaving directory `/home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/i686-linux-uclibc/libstdc++-v3'
> make[2]: *** [all-target-libstdc++-v3] error 2
> make[2]: Leaving directory `/home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final'
> make[1]: *** [all] error 2
> make[1]: Leaving directory `/home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final'
> make: *** [/home/sp/buildroot/toolchain_build_i686/gcc-4.2.1-final/.compiled] error 2
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Wed, 30 Jul 2008 09:22:41 +0200
Subject: [Buildroot] When wchar is enabled then gcc can't be built with c++
	cross-compiler support
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF326540C@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I get a lot of errors when I try to compile the gcc with c++
cross-compiler support and wchar enabled in the uClibc.
I attached a file wich shows more errormessages, the main buildroot
.config file and the uclibc .config file.
I made a make clean and then a new make, but that doesn't help.
I hope someone knows how to fix this or has some ideas, because I really
need c++ cross-compiler support.
If you need more infos please answer what is needed.

Here are the last few lines with error messages:
bits/locale_facets.tcc:2700: error: template argument 3 is invalid
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/bits/locale_facets.tcc:2700: error:
template-id 'has_facet<<expression error> >' for 'bool
std::has_facet(const std::locale&)' does not match any template
declaration In file included from
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream:805,
                 from
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-avr32-2.1.5/libstdc
++-v3/include/precompiled/stdc++.h:60:
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream: In instantiation of
'std::basic_filebuf<char, std::char_traits<char> >':
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/bits/fstream.tcc:893:   instantiated from
here
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream:82: error: no type named 'state_type'
in 'struct std::char_traits<char>'
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream:83: error: no type named 'state_type'
in 'struct std::char_traits<char>'
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream:103: error: no type named
'state_type' in 'struct std::char_traits<char>'
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream:108: error: no type named
'state_type' in 'struct std::char_traits<char>'
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream:112: error: no type named
'state_type' in 'struct std::char_traits<char>'
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/fstream:160: error: no type named
'state_type' in 'struct std::char_traits<char>'
/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-u
clibc/libstdc++-v3/include/bits/fstream.tcc:736: error: no type named
'state_type' in 'struct std::char_traits<char>'
make[5]: *** [avr32-linux-uclibc/bits/stdc++.h.gch/O0g.gch] Fehler 1
make[5]: Leaving directory
`/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-
uclibc/libstdc++-v3/include'
make[4]: *** [all-recursive] Fehler 1
make[4]: Leaving directory
`/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-
uclibc/libstdc++-v3'
make[3]: *** [all] Fehler 2
make[3]: Leaving directory
`/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/avr32-linux-
uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Fehler 2
make[2]: Leaving directory
`/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final'
make[1]: *** [all] Fehler 2
make[1]: Leaving directory
`/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final'
make: ***
[/atmel/buildrootWork/toolchain_build_avr32/gcc-4.2.2-final/.compiled]
Fehler 2


Best Regards
Sebastian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: configs.zip
Type: application/x-zip-compressed
Size: 15232 bytes
Desc: configs.zip
Url : http://busybox.net/lists/buildroot/attachments/20080730/41411e08/attachment-0001.bin 

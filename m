From: Mikael Sundberg <micke@oddjob.se>
Date: Fri, 05 Sep 2008 13:21:32 +0200
Subject: [Buildroot] Qtopia4
Message-ID: <48C1163C.6000706@oddjob.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I?m trying to build Qtopia4 but get some errors, I can?t find the problem.
The problem is undefined references to a lot of wchar functions ( See 
attached log ). I have WCHAR enabled and uclibc is compiled with 
Widechars and Locale support.

...
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `mbsnrtowcs'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `mbsrtowcs'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `iswctype'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wctype'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wcsftime'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wcscmp'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wcsnrtombs'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wmemmove'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `mbrtowc'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `towlower'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `btowc'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wmemcmp'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wcscoll'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `_stdlib_mb_cur_max'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wmemset'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wcrtomb'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `__global_locale'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `ungetwc'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wcsxfrm'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wctob'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wmemcpy'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wmemchr'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `towupper'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `wcslen'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `putwc'
/root/arm/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/../../../../arm-linux-uclibc/lib/libstdc++.so: 
undefined reference to `getwc'
...

see the attached file for the full log

Anyone have any ideas?

Thank you!

regards,
Mikael Sundberg
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: LOG
Url: http://busybox.net/lists/buildroot/attachments/20080905/1b53eafc/attachment-0001.txt 

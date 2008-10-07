From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Oct 2008 16:56:10 +0200
Subject: [Buildroot] Issue with libtool while building/linking fontconfig
Message-ID: <20081007165610.4de3f377@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When building/linking fontconfig, I hit the following problem:

=======================================================================
/bin/bash ../libtool --tag=CC --mode=link /usr/local/uclibc-0.9.28-2/arm//bin/arm-linux-gcc -Os  -I/home/thomas/local/buildroot/build_arm/staging_dir/include -I/home/thomas/local/buildroot/build_arm/staging_dir/usr/include -I/usr/local/uclibc-0.9.28-2/arm//arm-linux/include  -g -O2  -L/home/thomas/local/buildroot/build_arm/staging_dir/lib -L/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib -o fc-cache  fc-cache.o ../src/libfontconfig.la
/usr/local/uclibc-0.9.28-2/arm//bin/arm-linux-gcc -Os -I/home/thomas/local/buildroot/build_arm/staging_dir/include -I/home/thomas/local/buildroot/build_arm/staging_dir/usr/include -I/usr/local/uclibc-0.9.28-2/arm//arm-linux/include -g -O2 -o fc-cache fc-cache.o  -L/home/thomas/local/buildroot/build_arm/staging_dir/lib -L/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib ../src/.libs/libfontconfig.so   -Wl,--rpath -Wl,/home/thomas/local/buildroot/build_arm/fontconfig-2.6.0/src/.libs
/usr/local/uclibc-0.9.28-2/arm/lib/gcc/arm-linux-uclibc/3.4.5/../../../../arm-linux-uclibc/bin/ld.real: warning: libfreetype.so.6, needed by ../src/.libs/libfontconfig.so, not found (try using -rpath or -rpath-link)
/usr/local/uclibc-0.9.28-2/arm/lib/gcc/arm-linux-uclibc/3.4.5/../../../../arm-linux-uclibc/bin/ld.real: warning: libexpat.so.1, needed by ../src/.libs/libfontconfig.so, not found (try using -rpath or -rpath-link)
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_PS_Font_Info'
../src/.libs/libfontconfig.so: undefined reference to `FT_Init_FreeType'
../src/.libs/libfontconfig.so: undefined reference to `XML_SetElementHandler'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_Sfnt_Name'
../src/.libs/libfontconfig.so: undefined reference to `FT_Load_Glyph'
../src/.libs/libfontconfig.so: undefined reference to `FT_Done_Face'
../src/.libs/libfontconfig.so: undefined reference to `XML_SetDoctypeDeclHandler'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_Char_Index'
../src/.libs/libfontconfig.so: undefined reference to `XML_ParserFree'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_Sfnt_Table'
../src/.libs/libfontconfig.so: undefined reference to `FT_Has_PS_Glyph_Names'
../src/.libs/libfontconfig.so: undefined reference to `XML_SetCharacterDataHandler'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_Glyph_Name'
../src/.libs/libfontconfig.so: undefined reference to `FT_Select_Charmap'
../src/.libs/libfontconfig.so: undefined reference to `XML_ErrorString'
../src/.libs/libfontconfig.so: undefined reference to `XML_ParseBuffer'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_Next_Char'
../src/.libs/libfontconfig.so: undefined reference to `FT_Load_Sfnt_Table'
../src/.libs/libfontconfig.so: undefined reference to `XML_ParserCreate'
../src/.libs/libfontconfig.so: undefined reference to `FT_Done_FreeType'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_Sfnt_Name_Count'
../src/.libs/libfontconfig.so: undefined reference to `FT_Select_Size'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_X11_Font_Format'
../src/.libs/libfontconfig.so: undefined reference to `XML_SetUserData'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_BDF_Property'
../src/.libs/libfontconfig.so: undefined reference to `XML_GetErrorCode'
../src/.libs/libfontconfig.so: undefined reference to `FT_Get_First_Char'
../src/.libs/libfontconfig.so: undefined reference to `XML_GetBuffer'
../src/.libs/libfontconfig.so: undefined reference to `FT_New_Face'
../src/.libs/libfontconfig.so: undefined reference to `XML_GetCurrentLineNumber'
collect2: ld returned 1 exit status
=======================================================================

The ../src/.libs/libfontconfig.so properly references the .la files of
libexpat and libfreetype. If I had these path to the .la files to the
big libtool command line, then it links properly.

Any clue about this problem ?

libtool really drives me crazy.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

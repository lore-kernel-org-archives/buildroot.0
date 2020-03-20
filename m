From: Simon Rowe <Simon.Rowe@citrix.com>
Date: Fri, 20 Mar 2020 15:12:07 +0000
Subject: [Buildroot] Error building Python with musl in 2020.02
Message-ID: <1584717125169.78577@citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm getting the following error when trying out 2020.02 with the latest musl-based toolchain


/build/host/bin/x86_64-buildroot-linux-musl-gcc -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -std=c99 -Wextra -Wno-unused-result -Wno-unused-parameter -Wno-missing-field-initializers -Werror=implicit-function-declaration  -I./Include/internal  -I. -I./Include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -DPy_BUILD_CORE_BUILTIN  -c ./Modules/xxsubtype.c -o Modules/xxsubtype.o
./Modules/posixmodule.c: In function 'os_copy_file_range_impl':
./Modules/posixmodule.c:9704:15: error: implicit declaration of function 'copy_file_range'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
 9704 |         ret = copy_file_range(src, p_offset_src, dst, p_offset_dst, count, flags);
      |               ^~~~~~~~~~~~~~~
      |               sync_file_range
cc1: some warnings being treated as errors
Makefile:1938: recipe for target 'Modules/posixmodule.o' failed


Has anyone else seen this?


Simon
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200320/29f1874a/attachment.html>

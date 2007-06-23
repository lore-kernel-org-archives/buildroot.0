From: AM <madwifi@vermark.com>
Date: Sat, 23 Jun 2007 18:24:36 -0400
Subject: [Buildroot] Need Help. Error running Make bzip2-1.0.3
Message-ID: <007501c7b5e5$48285710$0c02a8c0@vgsdt100>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having trouble running "make" after selecting a few package:
Here is what am getting.

        make -j1 CC=/home/amark/development/1.1/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc RANLIB=/home/amark/development/1.1/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib -C /home/amark/development/1.1/buildroot/build_i586/bzip2-1.0.3 libbz2.a
make[1]: Entering directory `/home/amark/development/1.1/buildroot/build_i586/bzip2-1.0.3'
rm -f libbz2.a
ar cq libbz2.a blocksort.o huffman.o crctable.o randtable.o compress.o decompress.o bzlib.o
/home/amark/development/1.1/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib libbz2.a
make[1]: Leaving directory `/home/amark/development/1.1/buildroot/build_i586/bzip2-1.0.3'
cp /home/amark/development/1.1/buildroot/build_i586/bzip2-1.0.3/bzlib.h /home/amark/development/1.1/buildroot/build_i586/staging_dir/include/
cp: cannot create regular file `/home/amark/development/1.1/buildroot/build_i586/staging_dir/include/': Is a directory
make: *** [/home/amark/development/1.1/buildroot/build_i586/staging_dir/lib/libbz2.so.1.0.3] Error 1


I looked in the Makefile of bzip2-1.0.3 and the PREFIX is set /usr, I also see where is suppose to create the directory include if it does not exist.
Here is the copy command from the Makefile: cp -f bzlib.h $(PREFIX)/include. Base on this, I would think it's suppose to go into staging_dir/usr/include. But the copy command above seems to be going to the wrong directory. Can somebody tell me why this is happening?

Thanks everybody....

A M
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070623/0be60f9b/attachment.htm 

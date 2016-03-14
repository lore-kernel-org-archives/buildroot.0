From: Mike Davies <busybox_mail@rovoreed.com>
Date: Mon, 14 Mar 2016 10:25:04 +0000
Subject: [Buildroot] tar failing to build with latest buildroot
Message-ID: <1457951104.2051.1.camel@rovoreed.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Title says it all really. 'tar' (the real one not the busybox version)
fails to build in the latest stable version. I'm using uClibc 1.0.12


[mike at ceri buildroot-2016.02]$ make
>>> tar 1.28 Building
PATH="/home/mike/work/kodi/buildroot
-2016.02/output/host/bin:/home/mike/work/kodi/buildroot
-2016.02/output/host/sbin:/home/mike/work/kodi/buildroot
-2016.02/output/host/usr/bin:/home/mike/work/kodi/buildroot
-2016.02/output/host/usr/sbin:/usr/lib64/qt
-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/m
ike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sbin
"  /usr/bin/make -j5  -C /home/mike/work/kodi/buildroot
-2016.02/output/build/tar-1.28/
/usr/bin/make  all-recursive
Making all in doc
make[4]: Nothing to be done for 'all'.
Making all in gnu
/usr/bin/make  all-recursive
make[6]: Nothing to be done for 'all-am'.
Making all in lib
/usr/bin/make  all-am
make[5]: Nothing to be done for 'all-am'.
Making all in rmt
make[4]: Nothing to be done for 'all'.
Making all in src
  CCLD     tar
tar.o: In function `tar_help_filter':
tar.c:(.text+0x334): undefined reference to `_obstack_begin'
tar.c:(.text+0x368): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x3a0): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x3f0): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x430): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x468): undefined reference to `_obstack_newchunk'
tar.o:tar.c:(.text+0x4b4): more undefined references to
`_obstack_newchunk' follow
tar.o: In function `tar_help_filter':
tar.c:(.text+0x5dc): undefined reference to `obstack_free'
tar.o: In function `parse_opt':
tar.c:(.text+0x21ac): undefined reference to `_obstack_begin'
tar.c:(.text+0x2208): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x2310): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x233c): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x2380): undefined reference to `_obstack_newchunk'
tar.c:(.text+0x23b8): undefined reference to `_obstack_newchunk'
tar.o:tar.c:(.text+0x2400): more undefined references to
`_obstack_newchunk' follow
tar.o: In function `parse_opt':
tar.c:(.text+0x24a0): undefined reference to `obstack_free'
xheader.o: In function `x_obstack_grow':
xheader.c:(.text+0x234): undefined reference to `_obstack_newchunk'
xheader.o: In function `x_obstack_1grow':
xheader.c:(.text+0x290): undefined reference to `_obstack_newchunk'
xheader.o: In function `xheader_init.isra.1':
xheader.c:(.text+0xc50): undefined reference to `_obstack_begin'
xheader.o: In function `xheader_destroy':
xheader.c:(.text+0x20b0): undefined reference to `obstack_free'
xheader.o: In function `xheader_string_end':
xheader.c:(.text+0x2404): undefined reference to `obstack_free'
xheader.c:(.text+0x242c): undefined reference to `_obstack_newchunk'
incremen.o: In function `obstack_code_rename':
incremen.c:(.text+0x494): undefined reference to `_obstack_newchunk'
incremen.c:(.text+0x4d4): undefined reference to `_obstack_newchunk'
incremen.c:(.text+0x534): undefined reference to `_obstack_newchunk'
incremen.c:(.text+0x574): undefined reference to `_obstack_newchunk'
incremen.o:incremen.c:(.text+0x5e0): more undefined references to
`_obstack_newchunk' follow
incremen.o: In function `append_incremental_renames':
incremen.c:(.text+0x1928): undefined reference to `_obstack_begin'
incremen.c:(.text+0x1964): undefined reference to `_obstack_newchunk'
incremen.c:(.text+0x1a40): undefined reference to `_obstack_newchunk'
incremen.c:(.text+0x1abc): undefined reference to `obstack_free'
incremen.c:(.text+0x1afc): undefined reference to `_obstack_newchunk'
incremen.c:(.text+0x1b38): undefined reference to `_obstack_newchunk'
incremen.o: In function `read_directory_file':
incremen.c:(.text+0x1df8): undefined reference to `_obstack_begin'
incremen.c:(.text+0x25d0): undefined reference to `obstack_free'
transform.o: In function `transform_name_fp':
transform.c:(.text+0x878): undefined reference to `_obstack_begin'
transform.c:(.text+0x938): undefined reference to `_obstack_newchunk'
transform.c:(.text+0x9a0): undefined reference to `_obstack_newchunk'
transform.c:(.text+0xaac): undefined reference to `_obstack_newchunk'
transform.c:(.text+0xb4c): undefined reference to `_obstack_newchunk'
transform.c:(.text+0xba4): undefined reference to `_obstack_newchunk'
transform.o:transform.c:(.text+0xbe0): more undefined references to
`_obstack_newchunk' follow
transform.o: In function `transform_name_fp':
transform.c:(.text+0xcb0): undefined reference to `obstack_free'
xattrs.o: In function `acls_one_line.constprop.4':
xattrs.c:(.text+0xd8): undefined reference to `_obstack_begin'
xattrs.c:(.text+0x114): undefined reference to `_obstack_newchunk'
xattrs.c:(.text+0x144): undefined reference to `_obstack_newchunk'
xattrs.c:(.text+0x17c): undefined reference to `_obstack_newchunk'
xattrs.c:(.text+0x1bc): undefined reference to `_obstack_newchunk'
xattrs.c:(.text+0x230): undefined reference to `obstack_free'
collect2: error: ld returned 1 exit status
Makefile:1324: recipe for target 'tar' failed
make[4]: *** [tar] Error 1
Makefile:1348: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:1287: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:195: recipe for target
'/home/mike/work/kodi/buildroot-2016.02/output/build/tar
-1.28/.stamp_built' failed
make[1]: *** [/home/mike/work/kodi/buildroot-2016.02/output/build/tar
-1.28/.stamp_built] Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2
[mike at ceri buildroot-2016.02]$ 

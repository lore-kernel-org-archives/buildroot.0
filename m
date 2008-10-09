From: Daniel Lerch <dlerch@gmail.com>
Date: Thu, 9 Oct 2008 10:51:39 +0200
Subject: [Buildroot] openssl error
Message-ID: <88372fcb0810090151s1f9650b1u17252c27f9899d65@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
In default configuration buildroot works fine, but when I select
packages/networking/openssl I get the following errors:

...
PATH/buildroot/build_i386/staging_dir/usr/include/features.h:382:4:
error: #error It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately, uClibc was built without large file support enabled
...

...
PATH/buildroot/build_i386/staging_dir/usr/include/bits/uClibc_stdio.h:72:2:
error: #error Sorry... uClibc was built without large file support!
...


I think that 'large file' params are ok:

$ cat toolchain/uClibc/uClibc-0.9.28.config | grep "LARGE\|LFS"
UCLIBC_HAS_LFS=y
UCLIBC_HAS_FOPEN_LARGEFILE_MODE=y


Can somebody help me?


Thanks.


-- 
Daniel Lerch
project: www.opendomo.com
blog: h4ck1t.blogspot.com

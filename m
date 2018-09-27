From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu, 27 Sep 2018 07:46:44 -0700
Subject: [Buildroot] [PATCH 0/2] perl-sys-cpu fixes
Message-ID: <20180927144646.20954-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The second patch has 
- #include <sys/unistd.h>
because it is redundant with glibc, and doesn't exist with musl and
uclib.  Does anyone know if it is needed on other platforms?



Christopher McCrory (2):
  perl-sys-cpu: disable static builds
  perl-sys-cpu: remove extraneous include

 package/perl-sys-cpu/0001-remove-extraneous-include.patch | 10 ++++++++++
 package/perl-sys-cpu/Config.in                            |  4 ++++
 2 files changed, 14 insertions(+)
 create mode 100644 package/perl-sys-cpu/0001-remove-extraneous-include.patch

-- 
2.14.4

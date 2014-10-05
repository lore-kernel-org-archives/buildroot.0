From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:48 +0200
Subject: [Buildroot] [PATCH v2 00/16] New package Apache including mod_php
Message-ID: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset adds Apache webserver and its PHP module to buildroot.

v2:
- reordered patches (Yann)
- split patch and reordered apr-util dependencies (Yann)
- added support for PHP modules gd, mcrypt, mbstring
- updated patch to support in PHP (Yann, Thomas)
  - split patch to support Apache in PHP
    - patch PHP configure only to properly detect Apache
    - patching PHP configure for thread detection is now done
      with by sed as a POST_PATCH_HOOK
    - added slash after PKGDIR
- updated patch to add Apache as new package
  - added upstream SCM urls for the gen_test_char cross-compile patch (Yann)
  - added comments for the need to install to staging and autoreconf
  - added apr as dependency
  - moved --enable-nonportable-atomics to an if-clause
- apr
  - added upstream SCM urls for the gen_test_char cross-compile patch (Yann)
  - added comment for the need to autoreconf

Regards, Bernd

Bernd Kuhls (16):
  package/apr: Fix detection of rlimit and large file support
  package/apr-util: Add expat hard-dependency
  package/apr-util: Remove unused dependencies to neon and zlib
  package/apr-util: make sqlite optional
  package/apr-util: add optional dependency to berkeleydb
  package/apr-util: add optional dependency to gdbm
  package/apr-util: add optional dependency to mysql
  package/apr-util: add optional dependency to openssl
  package/php: Add support for GD module
  package/php: Add support for mcrypt module
  package/php: Add support for mbstring module
  package/apr: Bump version to 1.5.1
  package/apr: Fix for Apache when listening to multiple ports
  package/apr-util: Bump version to 1.5.4
  Apache: New package
  package/php: Add Apache support

-- 
1.7.10.4

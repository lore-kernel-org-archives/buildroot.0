From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2015 18:16:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/powertop: needs ncursesw
References: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
 <20150327173446.779683cf@free-electrons.com>
Message-ID: <XnsA46AB9F2F3F85berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150327173446.779683cf at free-electrons.com:

> Am I missing something?

Hi,

powertop is a weird piece of code;)

Using this defconfig

BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_POWERTOP=y

configure works

checking for NCURSES... no
checking for library containing delwin... -lncurses
[...]

but then this happens:

lib.cpp: In function 'void align_string(char*, size_t, size_t)':
lib.cpp:271:59: error: 'mbsrtowcs' was not declared in this scope
  sz = mbsrtowcs(NULL, (const char **)&buffer, max_sz, NULL);

Afaics mbsrtowcs() is a function which is only available with a wchar-enabled 
toolchain, so my patch does the right thing, but the description needs some 
additions.

Regards, Bernd

PS: Upstream of the powertop tarball is problematic:
http://autobuild.buildroot.net/results/50e/50e70b0c7c3533ddb7397fa7542a9369bf
7a7249/build-end.log

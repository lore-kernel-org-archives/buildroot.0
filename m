From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 May 2016 17:37:29 +0200
Subject: [Buildroot] [PATCH] p7zip: New package
References: <1464532380-16560-1-git-send-email-nerv@dawncrow.de>
Message-ID: <puer1dxrte.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

Am Sun, 29 May 2016 16:33:00 +0200 schrieb Andr? Hentschel:

> +define P7ZIP_BUILD_CMDS
> +	# Note that the build system of p7zip is a mess, so we can't use TARGET_CONFIGURE_OPTS

please move the comment outside the definition, otherwise it is printed during the build:

>>> p7zip 15.14.1 Building
# Note that the build system of p7zip is a mess, so we can't use TARGET_CONFIGURE_OPTS
/usr/bin/make -j9 CC= [...]

Building p7zip for blackfin using

http://autobuild.buildroot.net/toolchains/configs/bfin-uclinux.config

as defconfig fails with

../../../../CPP/myWindows/mySplitCommandLine.cpp:99:8: error: #error ENDIANNESS

Regards, Bernd

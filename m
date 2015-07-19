From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 21:20:19 +0200
Subject: [Buildroot] [PATCH/RFC v3 04/50] package/libcec: bump to
 version 3.0.1
In-Reply-To: <1437332755-9764-5-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
 <1437332755-9764-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150719212019.320c8715@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 19 Jul 2015 21:05:09 +0200, Bernd Kuhls wrote:
> - reflect upstream changes of the build system by switching from
>   an autotools-package to cmake-package
> - package is broken with gcc 4.5.4
>   https://github.com/Pulse-Eight/libcec/issues/78#issuecomment-91578591
>   "4.6 is no longer supported. you need a C++ 11 compatible compiler,
>    so 4.7 or newer"
>   Since buildroot does not contain gcc 4.6 anymore, using
>   depends on !BR2_GCC_VERSION_4_5_X
>   is enough.

Not quite: doing "depends on !BR2_GCC_VERSION_4_5_X" will solve the
internal toolchain problem, but not the external toolchain problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

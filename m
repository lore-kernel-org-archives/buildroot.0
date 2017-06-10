From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:04:04 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/php: fix icu support
In-Reply-To: <20170610084333.27483-1-bernd.kuhls@t-online.de>
References: <20170610084333.27483-1-bernd.kuhls@t-online.de>
Message-ID: <20170610230404.1d5ab283@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Jun 2017 10:43:33 +0200, Bernd Kuhls wrote:
> Propagate icu reverse dependencies.
> 
> Php lacks "-std=c++11", provided by icu-config, when compiling icu
> support leading to a build failure:
> 
> /home/peko/autobuild/instance-1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/unicode/umachine.h:347:13:
>  error: 'char16_t' does not name a type
>      typedef char16_t UChar;
> 
> Fixes
> http://autobuild.buildroot.net/results/238/238d0e4bb205c0e7288903c6498e6c1787d86a1b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added icu reverse dependencies, used PHP_CXXFLAGS (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

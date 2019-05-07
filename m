From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 May 2019 19:42:20 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: add support for
 Linux 5.1 kernel headers
In-Reply-To: <87k1f25kol.fsf@grinn-global.com> ("Marcin =?utf-8?Q?Niestr?=
 =?utf-8?Q?=C3=B3j=22's?= message of
 "Tue, 07 May 2019 17:49:30 +0200")
References: <20190507090149.3143-1-m.niestroj@grinn-global.com>
 <87k1f2tgok.fsf@dell.be.48ers.dk> <87k1f25kol.fsf@grinn-global.com>
Message-ID: <87ftpqtb43.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestr?j <m.niestroj@grinn-global.com> writes:

 > Peter Korsgaard <peter@korsgaard.com> writes:

 >>>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:
 >> 
 >> > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 >> > ---
 >> >  linux/linux.hash                     |  1 +
 >> >  package/linux-headers/Config.in.host | 11 ++++++++++-
 >> >  2 files changed, 11 insertions(+), 1 deletion(-)
 >> 
 >> > diff --git a/linux/linux.hash b/linux/linux.hash
 >> > index 035c324447..3d49ea476a 100644
 >> > --- a/linux/linux.hash
 >> > +++ b/linux/linux.hash
 >> > @@ -1,4 +1,5 @@
 >> >  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 >> > +sha256 d06a7be6e73f97d1350677ad3bae0ce7daecb79c2c2902aaabe806f7fa94f041  linux-5.1.tar.xz
 >> >  sha256 bcfd52bf1faa24f5f712146a873959461e001656ad67717e80b947aa6ad53479  linux-5.0.13.tar.xz
 >> >  # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 >> >  sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
 >> > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
 >> > index 6c848aa2e2..66366628c5 100644
 >> > --- a/package/linux-headers/Config.in.host
 >> > +++ b/package/linux-headers/Config.in.host
 >> > @@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 >> >  choice
 >> >  	prompt "Kernel Headers"
 >> >  	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
 >> > -	default BR2_KERNEL_HEADERS_5_0
 >> > +	default BR2_KERNEL_HEADERS_5_1
 >> >  	help
 >> >  	  Select the kernel version to get headers from.
 >> 
 >> > @@ -53,6 +53,10 @@ config BR2_KERNEL_HEADERS_5_0
 >> >  	bool "Linux 5.0.x kernel headers"
 >> >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 >> 
 >> > +config BR2_KERNEL_HEADERS_5_1
 >> > +	bool "Linux 5.1.x kernel headers"
 >> > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 >> 
 >> You forgot to actually add BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 (in
 >> toolchain/Config.in).

 > It was already added ~1 month ago with commit
 > d2500dc581039766b0a767391317aeea13a1474c ("toolchain: add
 > BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1").

Hah, indeed - Sorry ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Ossy <ossy1980@gmx.net>
Date: Tue, 22 Jun 2010 23:30:15 +0200
Subject: [Buildroot] [git commit master 1/1] ncurses: bump to 5.7
In-Reply-To: <20100621210810.7075D817F1@busybox.osuosl.org>
References: <20100621210810.7075D817F1@busybox.osuosl.org>
Message-ID: <4C212B67.4070703@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.06.2010 23:07, schrieb Gustavo Zacarias:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=c32ce8b56b0257c4e55652356b65df01c7c1e1e3
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Closes #2038
>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
> ---
>   CHANGES                    |    5 +++--
>   package/ncurses/ncurses.mk |    2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/CHANGES b/CHANGES
> index 25d5233..6a455e8 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -15,8 +15,8 @@
>
>   	Updated/fixed packages: busybox, cdrkit, file, gawk,
>   	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
> -	lmbench, lrzsz, netperf, ntfsprogs, openssl, php, qt, sqlite,
> -	squashfs, tn5250, usbutils, xkeyboard-config
> +	lmbench, lrzsz, ncurses, netperf, ntfsprogs, openssl, php, qt,
> +	sqlite, squashfs, tn5250, usbutils, xkeyboard-config
>
>   	Removed packages: modutils
>
> @@ -40,6 +40,7 @@
>   	#1987: intltool: Fix spelling mistake
>   	#1999: Typo in path checking
>   	#2035: ipsec-tools-0.7.2 fails to build with gcc-4.4.x
> +	#2038: Bump ncurses to 5.7
>
>   2010.05, Released May 30th, 2010:
>
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 584a969..ee101f3 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -23,7 +23,7 @@
>   # USA
>
>   # TARGETS
> -NCURSES_VERSION = 5.6
> +NCURSES_VERSION = 5.7
>   NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
>   NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
>   NCURSES_INSTALL_STAGING = YES
>
Hi,

ncurses 5.7 fails to build for arm target:
/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.5/../../../../arm-unknown-linux-ucl
ibcgnueabi/bin/ld: background: hidden symbol `__aeabi_ddiv' in 
/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/../lib/gcc/arm-unkn
own-linux-uclibcgnueabi/4.3.5/libgcc.a(_muldivdf3.o) is referenced by DSO
/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/../lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.5/../../../../arm-unknown-linux-ucl
ibcgnueabi/bin/ld: final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[2]: *** [background] Fehler 1
make[2]: Leaving directory 
`/home/ossy/buildroot/buildroot-dev/output/build/ncurses-5.7/test'


ossy at debian-virtual:~/buildroot/buildroot-dev$ cat .git/FETCH_HEAD
cd7459b4eef742069f7796c4dfceed8facbfab68                branch 'master' 
of http://git.buildroot.net/buildroot

Please find my config attached. I switched configuration cache on.

Regards,
Marcus Osdoba
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100622/78a48e48/attachment-0002.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uclibc-config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100622/78a48e48/attachment-0003.ksh>

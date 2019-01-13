From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Jan 2019 10:37:37 +0200
Subject: [Buildroot] [PATCH] syslog-ng: depend on !BR2_STATIC_LIBS
In-Reply-To: <20190113083002.17176-1-judge.packham@gmail.com>
References: <20190113083002.17176-1-judge.packham@gmail.com>
Message-ID: <871s5hvtpq.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Sun, Jan 13 2019, Chris Packham wrote:
> Upstream now unconditionally requires dlfcn.h:
> - https://github.com/balabit/syslog-ng/commit/01258e56abc5804f8ea977ff9ab98cc8e2fd4702
>
> Fixes:
> - http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333
>
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
> index fbc236221a..0561ba35d8 100644
> --- a/package/syslog-ng/Config.in
> +++ b/package/syslog-ng/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSLOG_NG
>  	depends on BR2_USE_WCHAR # glib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	select BR2_PACKAGE_EVENTLOG
>  	select BR2_PACKAGE_LIBGLIB2

Please update the dependencies comment at the end of Config.in.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

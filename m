From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 07:58:39 +0100
Subject: [Buildroot] [PATCH v4 1/3] package/mono: enable mono library
 compilation
In-Reply-To: <1423748972-17471-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
 <1423748972-17471-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150214075839.5ee08252@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 12 Feb 2015 14:49:30 +0100, Angelo Compagnucci wrote:

> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index 0bbf338..9ec3c24 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -21,7 +21,6 @@ MONO_AUTORECONF = YES
>  MONO_CONF_OPTS = --disable-gtk-doc \
>  	--with-mcs-docs=no \
>  	--with-moonlight=no \
> -	--disable-libraries \
>  	--with-ikvm-native=no \
>  	--enable-minimal=aot,profiler,debug \
>  	--disable-mcs-build \

Apparently, Mono was working fine with --disable-libraries, as long as
no third party libraries are used. So should we make this optional
instead? What is the size impact of this (i.e a Mono build with
--disable-libraries, and a Mono build without --disable-libraries), in
terms of installed size? If the size difference is small compared to
the overall size of Mono, then I'm fine for doing it unconditionally.

Could you comment on this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

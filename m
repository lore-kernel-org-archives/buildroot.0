From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2011 08:26:16 +0100
Subject: [Buildroot] procps fails to compile on Fedora 14 due to newer
 version of GNU make
In-Reply-To: <AANLkTinvmWA5EWv+98t=YqasMOmxg4pusJgD4SQ7ayUV@mail.gmail.com>
References: <AANLkTinvmWA5EWv+98t=YqasMOmxg4pusJgD4SQ7ayUV@mail.gmail.com>
Message-ID: <20110319082616.6dfb9018@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bruce,

On Fri, 18 Mar 2011 11:16:39 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> [root at plxarm01 tmp]# cat procps-sort-order.patch
> --- procps-3.2.7.orig/Makefile  2006-06-24 10:02:25.000000000 +0100
> +++ procps-3.2.7/Makefile       2011-03-18 10:55:46.055307083 +0000
> @@ -174,7 +174,7 @@
>  # want this rule first, use := on ALL, and ALL not filled in yet
>  all: do_all
> 
> --include */module.mk
> +-include proc/module.mk ps/module.mk
> 
>  do_all:    $(ALL)

Could you send a patch that adds this modification as a patch against
the procps package in Buildroot ? This way we could integrate it.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 23:37:27 +0100
Subject: [Buildroot] [PATCH/next v10 01/28] package/freeswitch: new
 package
In-Reply-To: <1456869536-18324-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456869536-18324-1-git-send-email-bernd.kuhls@t-online.de>
 <1456869536-18324-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160301233727.5e1aa761@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

Thanks for the new iteration!

On Tue,  1 Mar 2016 22:58:29 +0100, Bernd Kuhls wrote:

> diff --git a/package/freeswitch/0004-Makefile.am-fs_cli-needs-libzrtp.a.patch b/package/freeswitch/0004-Makefile.am-fs_cli-needs-libzrtp.a.patch
> new file mode 100644
> index 0000000..b862af7
> --- /dev/null
> +++ b/package/freeswitch/0004-Makefile.am-fs_cli-needs-libzrtp.a.patch
> @@ -0,0 +1,41 @@
> +From 2e53d91ac18f34dd08227c2940d1525da5c6dbd2 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Tue, 1 Mar 2016 21:38:51 +0100
> +Subject: [PATCH 1/1] Makefile.am: fs_cli needs libzrtp.a
> +
> +Compiling freeswitch sometimes shows a strange linking error:
> +
> +libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemWipe':
> +/home/bernd/buildroot/br7_freeswitch/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:69: undefined reference to `zrtp_memset'
> +libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemAlloc':
> +/home/bernd/buildroot/br7_freeswitch/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:78: undefined reference to `zrtp_sys_alloc'
> +libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemFree':
> +/home/bernd/buildroot/br7_freeswitch/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:87: undefined reference to `zrtp_sys_free'
> +
> +Adding libuuid as dependency fixes the problem but I fail to see the
> +connection between libzrtp and libuuid.

It feels rather odd to have a patch that we don't really understand :-)
It would be nicer to get a full understanding so that the bug can be
fixed upstream.

Also, using the first person ("I") is normally not done in commit logs.

> diff --git a/package/freeswitch/0005-build-Makefile.am-modcheck.sh-is-superfluous-when-cr.patch b/package/freeswitch/0005-build-Makefile.am-modcheck.sh-is-superfluous-when-cr.patch
> new file mode 100644
> index 0000000..88f6011
> --- /dev/null
> +++ b/package/freeswitch/0005-build-Makefile.am-modcheck.sh-is-superfluous-when-cr.patch
> @@ -0,0 +1,26 @@
> +From d39fa44865110dd6d8ebe914f6fc1f0fa5caf14e Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Tue, 1 Mar 2016 22:14:55 +0100
> +Subject: [PATCH 1/1] build/Makefile.am: modcheck.sh is superfluous when
> + cross-compiling

If it were just superfluous, then we could still keep it. I guess you
meant to say something stronger than "superfluous", right ?

(For those two aspects, no need to resend a full patch series.)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

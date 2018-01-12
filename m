From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:35:01 +0100
Subject: [Buildroot] [PATCH] augeas: bump to version 1.9.0
In-Reply-To: <20180109201846.1156-1-joerg.krause@embedded.rocks>
References: <20180109201846.1156-1-joerg.krause@embedded.rocks>
Message-ID: <20180112223501.396a6dc9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 21:18:46 +0100, J?rg Krause wrote:
> Add two patches from upstream to fix a build issue when building an
> example. Ideally, the examples should not be build at all. However,
> upstream disliked the idea of adding configure options like
> `--disable-examples` [1]. So we'll make do with the patches and force a
> autoreconf.

Well, since the patches are upstream, once a new release is made, we
can drop the patches, and remove AUTORECONF = YES, correct ?

> diff --git a/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch b/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
> new file mode 100644
> index 0000000000..8ccd6b54b7
> --- /dev/null
> +++ b/package/augeas/0001-examples-Makefile-fix-missing-trailing-backslash-for-dump-LDADD.patch
> @@ -0,0 +1,21 @@
> +From d506cf6c1567cbb0a762c04d9354ab1694a5ac05 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Mon, 11 Dec 2017 23:33:08 +0100
> +Subject: [PATCH] Update Makefile.am
> +
> +Add missing trailing backslash for `dump_LDADD`.

Missing SoB here and for the other patch as well. Could you fix this
and resend ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

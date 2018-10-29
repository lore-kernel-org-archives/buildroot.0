From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 29 Oct 2018 09:35:33 +0100
Subject: [Buildroot] Failure to build kernel headers
Message-ID: <CAGm1_ktCAZCm0Sax3cNcmsfXEo=FqiCL7fyxiOjr2GL1uNZLeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build a BR toolchain with headers based on the kernel built:

...
BR2_KERNEL_HEADERS_AS_KERNEL
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18
...

The kernel comes from an internal git repo.

I get following output:

ERROR: No hash found for linux-518a05013fafcda72459b70a76c41713aaf4ab62.tar.gz
package/pkg-generic.mk:135: recipe for target
'/home/buildroot/prods1-nfs/build/linux-headers-518a05013fafcda72459b70a76c41713aaf4ab62/.stamp_downloaded'
failed
make[1]: *** [/home/buildroot/prods1-nfs/build/linux-headers-518a05013fafcda72459b70a76c41713aaf4ab62/.stamp_downloaded]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Why hash is required for a custom "package"?

Regards,
Yegor

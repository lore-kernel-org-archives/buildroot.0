From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Dec 2015 18:18:44 +0100
Subject: [Buildroot] [PATCH 12/51] core/apply-patches: store full path
 of applied patches
In-Reply-To: <5a0a287345904fab50326aa020b60e8cb08ca5be.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <5a0a287345904fab50326aa020b60e8cb08ca5be.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <56607974.9090508@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Currently, we only store the filename of the applied patches.
>
> However, we are soon to want to install those patches in the legal-info
> directory, so we'll have to know where those patches come from.
>
> Instead of duplicating the logic to find the patches, just store the
> full path to each of those patches so we can retrieve them more easily
> later on.

Mmh, storing absolute pathnames always look a bit ugly... Any simple
way to store the relative path ("package/busybox/0002-unzip.patch")?

Also, there's a double slash in the output:
$ cat ./output/build/busybox-1.24.1/.applied_patches_list
/home/murray/devel/buildroot/package/busybox//0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
/home/murray/devel/buildroot/package/busybox//0002-unzip.patch
/home/murray/devel/buildroot/package/busybox//0003-g-unzip-fix-recent-breakage.patch
/home/murray/devel/buildroot/package/busybox//0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch

BTW, in order to evaluate the risk that your change breaks something,
I found myself wondering what .applied_patches_list is used for. And it
seems unused... am I missing something?

-- 
Luca

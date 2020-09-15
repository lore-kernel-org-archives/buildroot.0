From: Jonatan Hatakeyama Zeidler <jonatan.zeidler@brainlab.com>
Date: Tue, 15 Sep 2020 13:44:11 +0000
Subject: [Buildroot] Adding BR2_PACKAGE_PYTHON3 make U-Boot build fail
In-Reply-To: <d30bce23621c48874241cbd24e7c85a741067991.camel@brainlab.com>
References: <d30bce23621c48874241cbd24e7c85a741067991.camel@brainlab.com>
Message-ID: <ac3ea61a6f9f4eca0a14af0ccab4089bc247f307.camel@brainlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 2020-09-15 at 12:55 +0000, Jonatan Hatakeyama Zeidler wrote:
> Hello,
> 
> my buildroot config (attached) works fine and produces a bootable
> build. Now I want to add Python 3 to the root fs. But adding
> BR2_PACKAGE_PYTHON3=y leads to a build error in u-boot:
> 
> ./arch/arm/mach-k3/make_fit.py am65xx_phycore_kit \
> arch/arm/dts/k3-am65xx-phycore-kit.dtb > u-boot.its
>   CAT     u-boot-dtb.bin
>   COPY    u-boot.dtb
>   MKIMAGE u-boot-dtb.img
>   COPY    u-boot.bin
> Traceback (most recent call last):
>   File "./arch/arm/mach-k3/make_fit.py", line 155, in <module>
>     main()
>   File "./arch/arm/mach-k3/make_fit.py", line 151, in main
>     generate_its(board, dtbs)
>   File "./arch/arm/mach-k3/make_fit.py", line 127, in generate_its
>     overlays=generate_fdts(get_overlays(board), dtbdir))
>   File "./arch/arm/mach-k3/make_fit.py", line 75, in get_overlays
>     m = r.match(l)
> TypeError: cannot use a string pattern on a bytes-like object
> 
> How is it possible that a target package affects the build tools? And
> how can I solve that?
> 
> Thanks
> Jonatan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks for the explanation. I get the issue with having
BR2_TARGET_UBOOT_NEEDS_PYTHON2=y set, unfortunately.

Thanks
Jonatan

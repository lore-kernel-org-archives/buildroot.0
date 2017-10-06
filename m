From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 20:59:14 +0200
Subject: [Buildroot] [PATCH 2/2] libressl: fix musl build with older
 kernel headers
In-Reply-To: <639a3f4f5d58b498ba75f4a206203bb041a8c3e7.1506676404.git.baruch@tkos.co.il>
References: <fcd9c70d93d412866e9f973469a81acfffa1860a.1506676404.git.baruch@tkos.co.il>
 <639a3f4f5d58b498ba75f4a206203bb041a8c3e7.1506676404.git.baruch@tkos.co.il>
Message-ID: <0f0f617a-06a3-b999-92b3-d570444150fa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-09-17 11:13, Baruch Siach wrote:
> musl provides its own SYS_getrandom definition, but not GRND_NONBLOCK.
> This breaks the build with kernel headers older than v3.17. Add a patch
> adding a local definition of GRND_NONBLOCK to fix the build.
> 
> The following defconfig reproduces the build failure:
> 
> BR2_x86_pentium_mmx=y
> BR2_TOOLCHAIN_BUILDROOT_MUSL=y
> BR2_KERNEL_HEADERS_3_12=y
> BR2_PACKAGE_LIBRESSL=y
> 
> The getentropy_linux.c file is in upstream tarball, but not in its git
> repository. It originates form OpenBSD. For this reason the patch is
> against the tarball, but not git formatted.
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to master, thanks.

> ---
>  package/libressl/0002-fix-musl.patch | 38 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libressl/0002-fix-musl.patch
> 
> diff --git a/package/libressl/0002-fix-musl.patch b/package/libressl/0002-fix-musl.patch

 But I changed the name to correspond to the subject line.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

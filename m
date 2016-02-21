From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:00:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/links: add optional support for
 librsvg
In-Reply-To: <1455988925-26749-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455988925-26749-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221150017.19f9990c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 18:22:05 +0100, Bernd Kuhls wrote:
> When librsvg was compiled before, links will use it as optional
> dependency, along with other gtk libraries:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/links | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libbz2.so.1.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libcairo.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libevent-2.0.so.5]
>  0x0000000000000001 (NEEDED)             Shared library: [libgdk_pixbuf-2.0.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libgio-2.0.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libglib-2.0.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libgobject-2.0.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libgpm.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
>  0x0000000000000001 (NEEDED)             Shared library: [libjpeg.so.8]
>  0x0000000000000001 (NEEDED)             Shared library: [liblzma.so.5]
>  0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libpng16.so.16]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [librsvg-2.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libtiff.so.5]
>  0x0000000000000001 (NEEDED)             Shared library: [libX11.so.6]
>  0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/links/links.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

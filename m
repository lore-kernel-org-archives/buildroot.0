From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:11:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/links: add optional support for
 libevent
In-Reply-To: <1455137922-18060-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137922-18060-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160216231104.643353ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 10 Feb 2016 21:58:41 +0100, Bernd Kuhls wrote:
> When libevent was compiled before, links will use it as optional
> dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/links | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libevent-2.0.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> (xz support will be added with the next patch of this series)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/links/links.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I've applied both patches to master. However, could you send another
patch that forces --with-<foo>/--without-<foo> ? Since we were not
doing that for other dependencies, I applied your patches as-is, but I
would like to see those options added explicitly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

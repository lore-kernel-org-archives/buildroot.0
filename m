From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:36:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: add optional support for
 libcap
In-Reply-To: <20161204103722.29834-1-bernd.kuhls@t-online.de>
References: <20161204103722.29834-1-bernd.kuhls@t-online.de>
Message-ID: <20161204153654.789631e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 11:37:22 +0100, Bernd Kuhls wrote:
> - without libcap
> $ host/usr/bin/x86_64-linux-readelf -a target/usr/bin/tor | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libevent-2.0.so.5]
>  0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]
> 
> - with libcap
> $ host/usr/bin/x86_64-linux-readelf -a target/usr/bin/tor | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libevent-2.0.so.5]
>  0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]
> 
> The tor configure script has no option to en-/disable libcap support.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tor/tor.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

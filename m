From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:24:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/lftp: add optional support for
 expat
In-Reply-To: <1456010851-27810-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456010851-27810-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221122415.45f8dc8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 00:27:31 +0100, Bernd Kuhls wrote:
> When expat was compiled before, the proto-http module will use it as
> optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/lftp/4.6.4/proto-http.so | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libexpat.so.1]
> [...]
> 
> The build system offers no option to en-/disable expat support:
> https://github.com/lavv17/lftp/blob/lftp-4.6-stable/configure.ac#L337
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lftp/lftp.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

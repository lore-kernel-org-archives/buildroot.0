From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:25:43 +0100
Subject: [Buildroot] [PATCH 02/10] package/openobex: depends on
 libusb-compat
In-Reply-To: <1456076099-19607-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
 <1456076099-19607-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221212543.17f977bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:34:51 +0100, Bernd Kuhls wrote:
> Openobex looks for libusb.pc provided by libusb-compat, not libusb-1.0.pc
> provided by libusb:
> https://github.com/zuckschwerdt/openobex/blob/master/acinclude.m4#L171
> 
> Openobex links against both libusb (libusb-1.0.so.0) and libusb-compat
> (libusb-0.1.so.4):
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/ircp | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libopenobex.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libusb-0.1.so.4]
>  0x0000000000000001 (NEEDED)             Shared library: [libusb-1.0.so.0]
> [...]
> 
> This patch changes the dependency in openobex.mk and also selects
> libusb-compat.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openobex/Config.in   | 3 ++-
>  package/openobex/openobex.mk | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

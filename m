From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:52:46 +0100
Subject: [Buildroot] [PATCH 6/6] xserver_xorg-server: fix dependency
 with dbus
In-Reply-To: <20161114132238.6569-7-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
 <20161114132238.6569-7-jezz@sysmic.org>
Message-ID: <20161217165246.2c0c4ac6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 14:22:38 +0100, J?r?me Pouiller wrote:
> If dbus and udev are enabled. Xorg link with both:
> 
> $ arm-linux-readelf -d usr/bin/X | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libdbus-1.so.3]
>  0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libudev.so.1]
> [...]
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

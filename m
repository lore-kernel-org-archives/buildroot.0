From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:42:23 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: add
 --enable-libdrm for udev
In-Reply-To: <1427817030-27888-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427817030-27888-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150331234223.69a55273@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 31 Mar 2015 12:50:30 -0300, Gustavo Zacarias wrote:
> If the libdrm package is enabled, the system is built with an udev
> provider and MESA3D_DRI_DRIVER is disabled this adds a --disable-libdrm
> to configure options, but udev still requires libdrm and results in a
> build failure since libdrm include paths aren't filled in (missing drm.h
> include error).
> So add --enable-libdrm for the udev scenario to counteract the previous
> --disable-libdrm.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. You forgot PATCH v2 and a changelog, though :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

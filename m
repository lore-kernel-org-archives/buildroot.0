From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:27:42 +0100
Subject: [Buildroot] [PATCH v2 1/2] libxkbcommon: disable wayland support
In-Reply-To: <20170310195455.16117-1-ps.report@gmx.net>
References: <20170310195455.16117-1-ps.report@gmx.net>
Message-ID: <20170320222742.0f126ac1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 20:54:54 +0100, Peter Seiderer wrote:
> Disable wayland support (only needed for the interactive-wayland
> test program). This fixes a compile failure in case wayland
> support is autodetected:
> 
>     GEN      xdg-shell-unstable-v5-protocol.c
>   /bin/sh: /usr/bin/wayland-scanner: No such file or directory
>   Makefile:2426: recipe for target 'xdg-shell-unstable-v5-protocol.c' failed
>   make[3]: *** [xdg-shell-unstable-v5-protocol.c] Error 127
>   make[3]: *** Waiting for unfinished jobs....
>     GEN      xdg-shell-unstable-v5-client-protocol.h
>   /bin/sh: /usr/bin/wayland-scanner: No such file or directory
>   Makefile:2428: recipe for target 'xdg-shell-unstable-v5-client-protocol.h' failed
>   make[3]: *** [xdg-shell-unstable-v5-client-protocol.h] Error 127
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2:
>   - split out the disable-wayland fix
> ---
>  package/libxkbcommon/libxkbcommon.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

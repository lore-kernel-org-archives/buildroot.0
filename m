From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 11:46:28 +0200
Subject: [Buildroot] [PATCH] package/efl/libevas: x-includes and
 x-libraries must be set for cross-compiling
In-Reply-To: <1430597796-23584-1-git-send-email-romain.naour@openwide.fr>
References: <1430597796-23584-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150503114628.37e24683@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  2 May 2015 22:16:36 +0200, Romain Naour wrote:
> evas_engine_software_xlib_cflags and evas_engine_software_xlib_libs
> contains unsafe libraries paths if x-include and x-libraries are
> not set in libevas.mk.
> 
> config.log:
> evas_engine_software_xlib_cflags='-I/usr/X11R6/include'
> evas_engine_software_xlib_libs='-L/usr/X11R6/lib -lX11 -lXext'
> 
> Fixes:
> http://autobuild.buildroot.net/results/e5f/e5fb1e62cb634b20233751b4ea3b0630de70e9e0/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/efl/libevas/libevas.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks. I've done a second commit on libecore with the exact
same fix, because the exact same problem occurred on libecore in my
test build. See
http://git.buildroot.net/buildroot/commit/?id=0d9d8984a9240a27f5ed2e15f1977ada67266906.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

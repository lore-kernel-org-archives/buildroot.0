From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 14:58:27 +0200
Subject: [Buildroot] [PATCH] package/gpsd: do not interact with systemd
 on install
In-Reply-To: <20170513082736.22734-1-yann.morin.1998@free.fr>
References: <20170513082736.22734-1-yann.morin.1998@free.fr>
Message-ID: <20170513145827.7b8a2e2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 10:27:36 +0200, Yann E. MORIN wrote:
> When building on a systemd-based host for a systemd-based target, gpsd's
> buildsystem will try to tell systemd to reload the its configuration and
> recreate the entire dependency tree of services.
> 
> Of course, this can not work when run as a user:
>     >>> gpsd 3.16 Installing to target  
>     ==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ===
>     Authentication is required to reload the systemd state.
>     Authenticating as: root
>     Password:
> 
> In fact, this does not even mean anything in cross-compilation.
> 
> Fortunately, upstream has already fixed their sin, so we backport it
> (tweaked to apply onto 3.16).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> ---
> Note: this was never observed in any of the autobuilders, even those
> running on a systemd-based distro, because in this case stdin is
> redirected and systemctl simply fails, but the construct is just to
> ignore the failure, so the build proceeds; the issue only occurs when
> there is an actual terminal to provide user input... :-/
> ---
>  ...eract-with-systemctl-when-cross-compiling.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/gpsd/0001-do-not-interact-with-systemctl-when-cross-compiling.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

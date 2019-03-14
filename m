From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:15:18 +0100
Subject: [Buildroot] [PATCH v2] package/systemd: use util-linux' agetty,
 drop patch
In-Reply-To: <20190312214846.10601-1-yann.morin.1998@free.fr>
References: <20190312214846.10601-1-yann.morin.1998@free.fr>
Message-ID: <20190314221518.46974533@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Mar 2019 22:48:46 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We currently have a patch that replaces the use of (hard-coded) agetty
> in systemd, to use just plain getty. That patch dates back to commit
> f4a5eed474c (Add the systemd package), when util-linux was not a
> dependency, and we relied on busybox to actually provide getty.
> 
> But nowadays, util-linux is a mandatory dependency of systemd anyway.
> agetty is about 42KiB, while busybox' getty is around 5KiB (give or
> take). That's an extra ~40KiB, but it has to be balanced against the
> rest of the system: systemd only runs on a glibc system, needs dbus and
> thus expat, and kmod, that a ~40KiB overhead is barely noticeable (a
> miminal systemd setup with nothing enabled, on ARM, is already ~20MiB)
> 
> So, drop our agetty-dropping patch, and forcibly enable agetty in
> util-linux.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Note: all 6 run-time tests still pass.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:10:20 +0100
Subject: [Buildroot] [PATCH] package/apitrace: bump to version 9.0
In-Reply-To: <20191207000605.403621-1-paul@crapouillou.net>
References: <20191207000605.403621-1-paul@crapouillou.net>
Message-ID: <20191208161020.759164c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Dec 2019 01:06:05 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Bump to upstream version 9.0, released 2019-11-26.
> 
> This may have been the case already in 8.0, but it is possible to
> compile without X11 by just specifying ENABLE_X11=OFF, so the package
> was updated to remove the X11 dependency.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to master with one small change, see below.

> +ifneq ($(BR2_PACKAGE_XORG7),)

We prefer positive logic:

ifeq ($(BR2_PACKAGE_XORG7),y)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

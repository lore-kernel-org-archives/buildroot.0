From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:57:29 +0200
Subject: [Buildroot] [PATCH v2 02/13] package/skeleton-init-openrc:
 basic skeleton for openrc
In-Reply-To: <20190512195550.24457-2-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-2-michal.lyszczek@bofc.pl>
Message-ID: <20190518225729.0b7eed0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 May 2019 21:55:39 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> This basic skeleton is similar to skeleton-init-sysv.
> All links in /var are same as in skeleton-init-sysv to be compatible
> with current default filesystem scheme.
> 
> Exceptions:
> 
> * /dev/shm and /dev/pts dirs were removed, since they are created by
>   openrc devfs service
> * /etc/fstab does not need /dev/shm, /dev/pts and /sys entries
>   becuse they are mounted by devfs and sysfs services respectively
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

Applied to next, after doing one change, see below.

> +++ b/package/skeleton-init-openrc/skeleton-init-sysv.mk

Too much copy paste here: this file should have been named
skeleton-init-openrc.mk. I fixed that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

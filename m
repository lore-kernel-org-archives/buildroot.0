From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:26:12 +0200
Subject: [Buildroot] [PATCH v2 10/13] package/openrc: change /run/lock
 from root:uucp to root:daemon
In-Reply-To: <20190512195550.24457-10-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-10-michal.lyszczek@bofc.pl>
Message-ID: <20190518232612.5439cd06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 May 2019 21:55:47 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> On gentoo /run/lock is owned by uucp group because of historical
> reasons. However uucp does not exist on buildroot by default, and
> it makes more sense that 'daemon' group should own this directory.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v1 -> v2
>   None
> ---
>  ....in-change-run-lock-from-root-uucp-t.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch

Applied to next, thanks. Could you please raise this issue with the
upstream OpenRC developers ? Perhaps they could add a build-time
variable to set the owner/group of /run/lock ? This way we could at
some point drop this patch from the openrc package in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 14:56:38 +0200
Subject: [Buildroot] [PATCH 00/15] Improve SELinux support
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200904145638.466a5b30@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Antoine,

On Fri, 31 Jul 2020 12:10:25 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> Antoine Tenart (15):
>   package/e2fsprogs: set xattrs for the root dir as well
>   fs/common.mk: set SELinux file security contexts
>   fs/common.mk: move down ROOTFS_REPRODUCIBLE for consistency
>   package/refpolicy: smaller monolithic policy
>   package/refpolicy: allow packages to select SELinux modules
>   package/systemd: select SELinux modules
>   package/dbus: select SELinux module
>   package/util-linux: select SELinux module
>   package/e2fsprogs: select SELinux module
>   package/refpolicy: allow providing user defined modules
>   package/refpolicy: allow selecting additional modules
>   package/refpolicy: allow to provide a custom refpolicy
>   package/refpolicy: allow packages to provide their own SELinux modules
>   package/refpolicy: fix the configure, build and install steps
>   docs/manual: add a section about SELinux

Thanks for this work! Since there was positive feedback from Adam, and
no other feedback, and the patch series was there for more than a
month, I applied it.

I did quite a few changes in some of the patches. I will reply
individually to those patches. For the other patches, if I'm not making
any comments, it means I applied them as-is, or with changes that are
so small and trivial that they are not worth mentioning.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

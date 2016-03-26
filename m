From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:52:52 +0100
Subject: [Buildroot] [PATCH 1/2] core/pkg-kconfig: add an option to use
 olddefconfig
In-Reply-To: <20160326174203.GA3589@free.fr>
References: <1458901049-3693-1-git-send-email-romain.izard.pro@gmail.com>
 <20160326174203.GA3589@free.fr>
Message-ID: <20160326185252.22cae0a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Mar 2016 18:42:03 +0100, Yann E. MORIN wrote:

> In fact, we've already discussed this, and we concluded that we would
> want an automatic behaviour.
> 
> I.e. we try to use olddefconfig, and fallback to the yes-trick, like so:
> 
>     make olddefconfig || { yes "" |make oldconfig; }
> 
> Care to adapt your patch and respin, please? Of course, your second
> patch will no longer make sense after that.
> 
> In the meantime, I marked your patches as "Changes Requested" in
> patchwork.

And here is the reason why we want this automatic behavior rather than
the explicit FOO_KCONFIG_OLDDEFCONFIG variable that you proposed
Romain: the Linux, Barebox and U-Boot packages, which are some of the
main users of kconfig-package infrastructure, have user-configurable
versions. Therefore, we don't know if the user will select a recent
enough version of the kernel, Barebox or U-Boot with olddefconfig
support.

For this reason, we cannot state in the Barebox, Linux or U-Boot
packages whether they support olddefconfig or not, as it depends on the
version. By having an automatic handling, regardless of the package and
its version, we will use olddefconfig if available, and fallback to the
old method if not.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

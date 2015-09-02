From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Sep 2015 09:10:51 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150902091051.7ee82cf3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  2 Sep 2015 00:55:13 +0200, Yann E. MORIN wrote:
> systemd is incresaingly expected things to live in /usr/bin or
> /usr/sbin.
> 
> However, a lot of packages stil install stuff directly into /bin or
> /sbin.
> 
> Add an option so that /bin and /sbin be symlinks to /usr/bin and
> /usr/sbin. Ditto for .lib for consistency.
> 
> That option is forcibly enabled when the init system is systemd.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But do we actually need this? Vicente sent a patch to fix the systemd
issues that were discussed on the list:

   [PATCH] systemd: override the path for kill, sulogin, mount and umount

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

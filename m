From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 21:59:39 +0200
Subject: [Buildroot] [PATCH] host-gdb: enable terminal user interface
 support
In-Reply-To: <1409341351-5866-1-git-send-email-yegorslists@googlemail.com>
References: <1409341351-5866-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140829215939.40095fe4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Fri, 29 Aug 2014 21:42:31 +0200, Yegor Yefremov wrote:

> +config BR2_PACKAGE_HOST_GDB_TUI
> +	bool "GDB TUI support"
> +	select BR2_PACKAGE_NCURSES

No, this select doesn't make sense. BR2_PACKAGE_NCURSES is the *target*
ncurses. There's no point in selecting it here since what you're
interested in is host-ncurses. Since there's no Config.in option for
host ncurses, simply don't select anything here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

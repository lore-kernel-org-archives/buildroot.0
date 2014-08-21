From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 23:33:12 +0200
Subject: [Buildroot] [PATCH 00/12] toolchain: warn for unsafe
 library/header paths
In-Reply-To: <53F656E5.9020802@openwide.fr>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53F656E5.9020802@openwide.fr>
Message-ID: <20140821233312.03679844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 21 Aug 2014 22:30:29 +0200, Romain Naour wrote:

> First of all, thanks for your work on this topic !
> 
> I'm using this series during investigations on build errors reported by
> autobuilders.
> 
> I discovered four packages that use unsafe paths:
> tmux, ipset, aircrack-ng (-I/usr/local/include)
> iprutils (-I/usr/include/ncurses)

Great!

> Do you know why the upstream status of the gcc patch is "Inappropriate" ?
> There is a way that this patch get merged into the mainline gcc ?
> My colleague Adrien asked my about that.

I *believe* because they hardcode which paths are assumed to be
"invalid", i.e /usr/include, /usr/local/include, etc. But it's probably
possible to implement a solution where those paths would be passed as
options at compile time and/or run time.

> Also, BR_COMPILER_PARANOID_UNSAFE_PATH needs to be renamed to
> BR2_COMPILER_PARANOID_UNSAFE_PATH to follow the naming scheme ?

No: BR2_* variables are Config.in options. Environment variables are
BR_*.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

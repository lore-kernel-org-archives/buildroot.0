From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 21 Aug 2014 22:30:29 +0200
Subject: [Buildroot] [PATCH 00/12] toolchain: warn for unsafe
 library/header paths
In-Reply-To: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408540005-26934-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53F656E5.9020802@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 20/08/2014 15:06, Thomas Petazzoni a ?crit :
> Hello,
> 
> This series is a respin of the patch I sent a long time ago to improve
> the external toolchain wrapper to warn/error when unsafe library or
> header paths are used.
> 
> This series extend this significantly by:
> 
>  - Making sure the external toolchain wrapper logic will work even if
>    Buildroot is built from /usr. To do this, we assume only
>    /usr/include and /usr/local/include are unsafe header paths, and
>    /usr/lib and /usr/local/lib are unsafe library paths. Other
>    locations in /usr are assumed to be safe.
> 
>  - Covering the internal toolchain backend as well, by
>    borrowing/adapting gcc and binutils patches from
>    CodeSourcery/Yocto. The compiler and linker directly check for
>    unsafe paths in -I/-L options.
> 
>  - Adding a Config.in option to control the usage of this
>    mechanism. When the option is disabled, only warnings are
>    emitted. When the option is enabled, any unsafe header or library
>    path will make the compilation fail.
> 
> Of course, this series is not meant for 2014.08, but for 2014.11.
> 
> Feedback welcome,
> 

First of all, thanks for your work on this topic !

I'm using this series during investigations on build errors reported by
autobuilders.

I discovered four packages that use unsafe paths:
tmux, ipset, aircrack-ng (-I/usr/local/include)
iprutils (-I/usr/include/ncurses)

Do you know why the upstream status of the gcc patch is "Inappropriate" ?
There is a way that this patch get merged into the mainline gcc ?
My colleague Adrien asked my about that.

Also, BR_COMPILER_PARANOID_UNSAFE_PATH needs to be renamed to
BR2_COMPILER_PARANOID_UNSAFE_PATH to follow the naming scheme ?

Best regards,
Romain

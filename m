From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:00:32 +0200
Subject: [Buildroot] [PATCH] package/mpd: fetch upstream patch to fix
 GCC 6 issue
In-Reply-To: <20160609094108.9446-1-joerg.krause@embedded.rocks>
References: <20160609094108.9446-1-joerg.krause@embedded.rocks>
Message-ID: <20160609220032.5858f2dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 11:41:08 +0200, J?rg Krause wrote:
> Fetch a patch from upstream to fix a build issue with GCC 6:
> 
> '''
> In file included from /home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/include/c++/6.1.0/bits/stl_algo.h:59:0,
>                  from /home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/include/c++/6.1.0/algorithm:62,
>                  from ./src/queue/IdTable.hxx:25,
>                  from ./src/queue/Queue.hxx:24,
>                  from src/queue/Playlist.hxx:23,
>                  from src/Partition.hxx:23,
>                  from src/Instance.cxx:22:
> /home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/include/c++/6.1.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
>  #include_next <stdlib.h>
> '''
> 
> Bug report: https://bugs.musicpd.org/view.php?id=4524
> Fetch from: aa5d05eaa4d482aa8f8df954335d0aba151eeff9
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpd/mpd.hash | 1 +
>  package/mpd/mpd.mk   | 3 +++
>  2 files changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:16:12 +0100
Subject: [Buildroot] [PATCH] util-linux: enable AUTORECONF
In-Reply-To: <1486735300-25677-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1486735300-25677-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170211151612.799312c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 19:31:40 +0530, Rahul Bedarkar wrote:
> Commit 55a9737895cb ("util-linux: link scriptreplay with libm (for isnan)")
> added two patches that touch configure.ac and Makemodule.am. But forgot
> to enable AUTORECONF.
> 
> When AUTORECONF is disabled and configure.ac is patched, it looks like
> make will detect change in timestamps and trigger reconfig. But it
> later fails because of missing dependencies. To fix this, explicitly
> enable AUTORECONF.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/544/544e8da290d40424ea3d1bffad7e0b8a566de495
> 
> Fixes: 55a9737895cb ("util-linux: link scriptreplay with libm (for isnan)")
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Cc: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/util-linux/util-linux.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

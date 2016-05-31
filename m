From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 23:24:32 +0200
Subject: [Buildroot] [PATCH v4] gdb: enable simulator support for host
 build
In-Reply-To: <20160531210136.GA17122@waldemar-brodkorb.de>
References: <20160531210136.GA17122@waldemar-brodkorb.de>
Message-ID: <20160531232432.5dcada77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 23:01:36 +0200, Waldemar Brodkorb wrote:
> Add an option to enable GDB simulator support, so
> it can be used to test some no-MMU systems.
> 
> Newer GDB Blackfin Simulator need a workaround for in-tree compile.
> It doesn't break for older Buildroot supported GDB Blackfin
> Simulator.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v3 -> v4:
>   - the workaround is Blackfin specific and is not fixed
>     upstream. Problem with ARM reported by Thomas Petazzoni
> v2 -> v3:
>   - add workaround for GDB bug when in-tree compile is used,
>     problem reported by Thomas Petazzoni
>   - tested with GDB 7.9, 7.10.1, 7.11
> v1 -> v2:
>   - no changes
> ---
>  package/gdb/Config.in.host |  5 +++++
>  package/gdb/gdb.mk         | 17 +++++++++++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)

This one builds, tested for both ARM and Blackfin, so: applied to next.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

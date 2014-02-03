From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 22:32:32 +0100
Subject: [Buildroot] [PATCH] gdb: move version selection from gdb.mk to
 Config.in.host
In-Reply-To: <1391031881-19546-1-git-send-email-arnout@mind.be>
References: <52E9752E.2020602@mind.be>
 <1391031881-19546-1-git-send-email-arnout@mind.be>
Message-ID: <20140203223232.58bce1dc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Wed, 29 Jan 2014 22:44:41 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This avoids duplication of the version selection between these two files.
> 
> Cc: Spenser Gilliland <spenser@gillilanding.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Warning: I have not really tested this!
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/gdb/Config.in.host | 14 +++++++++-----
>  package/gdb/gdb.mk         | 14 --------------
>  2 files changed, 9 insertions(+), 19 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I haven't actually built this, but I've done some testing by looking at
the .config file, and it indeed contains a proper BR2_GDB_VERSION value
even when a cross-gdb is not being built. Therefore, I'm fairly
confident that this patch is OK to be applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

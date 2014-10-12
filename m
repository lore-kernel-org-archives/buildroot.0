From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 17:57:49 +0200
Subject: [Buildroot] [PATCH 03/11] gdb: Patch for "unrecognized
 real-time signal" bug
In-Reply-To: <1396558881-29631-3-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-3-git-send-email-paul@crapouillou.net>
Message-ID: <20141012175749.62343466@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Thu,  3 Apr 2014 23:01:13 +0200, Paul Cercueil wrote:
> From: Maarten ter Huurne <maarten@treewalker.org>
> 
> This avoids the following error at GDB startup:
> 
> GDB bug: target.c (gdb_signal_from_host): unrecognized real-time signal
> 
> For details, see:
>   http://sourceware.org/bugzilla/show_bug.cgi?id=14523
> 
> Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
> Acked-By: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/gdb/7.4.1/signal-128.patch | 15 +++++++++++++++
>  package/gdb/7.5.1/signal-128.patch | 15 +++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/gdb/7.4.1/signal-128.patch
>  create mode 100644 package/gdb/7.5.1/signal-128.patch

Those gdb versions are no longer supported in Buildroot. Plus, as
pointed out by Vicente, the bug is actually in uClibc and not in gdb,
so we've marked this patch as Rejected in our patch tracking system.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

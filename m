From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 23:06:40 +0200
Subject: [Buildroot] [PATCHv2 10/21] Makefile: move source-check outside
 of noconfig_targets
In-Reply-To: <20150413204916.GJ29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413204916.GJ29025@free.fr>
Message-ID: <20150413230640.10513197@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 13 Apr 2015 22:49:16 +0200, Yann E. MORIN wrote:

> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> However, I noticed that source-check tries to go to the mirror. For
> example, cjson fails to download from svn for me here, and it falls back
> to looking on the mirror, and thus concludes it exists.
> 
> Shouldn't source-check be limited to looking at the upstream locations?
> 
> However, not a blocker, since it;s already the behaviour we have.

Yes, the behavior you're observing is indeed the current behavior as
far as I know, so my patches are not changing this. Indeed, we could
discuss whether source-check should check only primary site + upstream
site, or primary site + upstream site + sources.b.o.

From a BR maintenance point of view, checking only primary site +
upstream is probably better as it means we can get notified when an
upstream has disappeared.

But from a BR user point of view, what's important is that the source
code remains available *somewhere*, be it from upstream or sources.b.o.

So I'm not very decided on this. Opinions welcome.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

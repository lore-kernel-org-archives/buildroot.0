From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:03:05 +0200
Subject: [Buildroot] [PATCH v1 2/6] package/qt5base: drop all legacy gcc
 requierements below 5.0
In-Reply-To: <20200418225906.17514-2-ps.report@gmx.net>
References: <20200418225906.17514-1-ps.report@gmx.net>
 <20200418225906.17514-2-ps.report@gmx.net>
Message-ID: <20200419150305.5a898e07@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 00:59:02 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> As qt5 requires as minimum gcc 5.0 drop all legacy requierements below.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5base/Config.in | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

I have not applied this one, and neither the remaining patches in the
series. Indeed, we normally want to propagate "depends on" to all
reverse dependencies, even if in practice it is already not possible to
select a given option due to it being hidden by a "depends on" at a
higher level.

We believe that always duplicating improves consistency and helps
avoiding mistakes. I agree that we are not 100% consistent on this
throughout the tree, but the direction we want to go to is to replicate
these "depends no", not get rid of them.

I agree that this is a very 'opinionated' decision and I am myself a
bit split between the two possibilities we have. But the overall
consensus seems to be that we should have that duplication.

So, I've marked PATCH 2/6 to 6/6 as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

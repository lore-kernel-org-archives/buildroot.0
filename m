From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 14 Oct 2012 14:03:11 +0200
Subject: [Buildroot] [PATCH] pkg-avail: make it work without stgit
In-Reply-To: <1350213261-4929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
 <1350213261-4929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20121014120311.GF29733@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Oct 14, 2012 at 01:14:21PM +0200, Thomas Petazzoni wrote:
> In order to make this script usable by more developers, make it work
> without stgit. It supports a --mode=stgit option or a --mode=git
> option. When using --mode=stgit, it will preserve its existing
> behavior, when using --mode=git, it will simply make git commits
> without fuzzing needlessly with stgit.
> 
> I still don't understand why people keep using stgit. I guess it's a
> remnant of quilt-style workflow or something like that, because the
> plain git, with its "git rebase -i" feature, allows to do exactly the
> same thing, without having to use a separate tool. So people using
> stgit should /really/ consider having a serious look at "git rebase
> -i", and when they will see the light, they will wonder why for so
> many years they have suffered in keeping their old-style quilt-looking
> workflows.
> 
> Note: the --mode=stgit hasn't been tested after the changes.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/pkg-avail |   44 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 13 deletions(-)

What branch is this patch based on? I can't find support/scripts/pkg-avail in 
current master.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

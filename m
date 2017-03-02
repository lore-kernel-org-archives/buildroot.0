From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Mar 2017 12:57:16 +0200
Subject: [Buildroot] [PATCH] iptables: fix build with musl
In-Reply-To: <20170302092304.0f16c801@free-electrons.com>
References: <045cb32775a51576353bc4aa73dcc5fa8b554864.1488441240.git.baruch@tkos.co.il>
 <20170302092304.0f16c801@free-electrons.com>
Message-ID: <20170302105716.zjqthvskb4bqvml5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Mar 02, 2017 at 09:23:04AM +0100, Thomas Petazzoni wrote:
> On Thu,  2 Mar 2017 09:54:00 +0200, Baruch Siach wrote:
> > Add a patch that defines _GNU_SOURCE to expose some struct tcphdr fields.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/bee/bee20b689345b593378cfd91e0abc48bf381d3f9/
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  ...utils-nfsynproxy-fix-build-with-musl-libc.patch | 44 ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 package/iptables/0001-utils-nfsynproxy-fix-build-with-musl-libc.patch
> 
> Applied to master, thanks. Peter: I believe this one is *not* needed
> for the LTS branch, because it fixes a problem with the iptables 1.6.1
> bump, which was merged after the 2017.02 release. Baruch, could you
> confirm?

It's true that this issue does not effect 2017.02, but not because of the 
iptables version. In 2017.02 iptables is disabled for musl build. Commit 
6a27508ffb (Revert "package/iptables: nfsynproxy not available on musl") that 
enabled musl was applied to next.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

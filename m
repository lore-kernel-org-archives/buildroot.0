From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 12:27:23 +0200
Subject: [Buildroot] [PATCH] package/opencv3: fix build for x86_64 target
In-Reply-To: <20170512112054.447fb67a@free-electrons.com>
References: <20170504215333.4172-1-s.martin49@gmail.com>
 <20170512112054.447fb67a@free-electrons.com>
Message-ID: <20170512122723.48912a90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 11:20:54 +0200, Thomas Petazzoni wrote:

> On Thu,  4 May 2017 23:53:33 +0200, Samuel Martin wrote:
> > This change backports a fix from upstream fixing missing symbols due to
> > wrong compiler optimization flags.
> > 
> > On Buildroot side, also remove deprecated options passed on the
> > configure command.
> > 
> > Fixes:
> >   http://autobuild.buildroot.net/results/af9/af950c6172a578c4eeeb9440b6990ceb48263fa6/build-end.log
> >   http://autobuild.buildroot.net/results/e88/e8832302cd4f30cec076f67965f6aacbaca5b955/build-end.log
> > 
> > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  .../0001-cmake-support-multiple-CPU-targets.patch  | 2501 ++++++++++++++++++++
> >  package/opencv3/opencv3.mk                         |   16 +-
> >  2 files changed, 2502 insertions(+), 15 deletions(-)
> >  create mode 100644 package/opencv3/0001-cmake-support-multiple-CPU-targets.patch  
> 
> This patch does more harm than good: it breaks a lot of configurations.
> See http://autobuild.buildroot.net/?reason=opencv3-3.2.0.
> 
> I'll revert later today unless a better fix is proposed.

I have found and fixed the problem: your patch contains a file rename,
and patch < 2.7 don't support file renames. So I've re-generated the
patch without file renames (git format-patch --no-renames). I verified
that it indeed fixes the problem on build machines with patch < 2.7.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

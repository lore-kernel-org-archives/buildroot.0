From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 8 May 2018 12:57:18 +0300
Subject: [Buildroot] Analysis of build results for 2018-05-06
In-Reply-To: <20180508111447.73787b34@windsurf>
References: <20180507060023.E26CE207B7@mail.bootlin.com>
 <20180507234635.4d21612b@windsurf>
 <20180508043238.c3fv3552a7yo26he@tarshish>
 <20180508111447.73787b34@windsurf>
Message-ID: <20180508095718.geg4ousamb3ae2xi@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 08, 2018 at 11:14:47AM +0200, Thomas Petazzoni wrote:
> On Tue, 8 May 2018 07:32:38 +0300, Baruch Siach wrote:
> 
> > > >          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ef823b0b7dc75e18e6a875d18abbdf530397d02d |     
> > > >       x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fc4000c7b348bdc85eab1ce85dcdb9d9dbbbb3cc |     
> > > >          arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/db50d3490f7f4ef23ac2c41ca98e51fa3ad35bdf |     
> > > >     mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/acc28762239d92184b3ff2aff3be801c1a81eb68 |     
> > > >      sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/79a885a12e3f73ff5c20f6e3bdf0cd7908fcb3b4 |     
> > > >          arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1e361ef5c8ee20a9524d6a204c204b3e19bf5641 |       
> > > 
> > > These issues should all be fixed by:
> > > 
> > >   52dcec570e056502c4f9e7b4640bca2bd2db8c23 lxc: fix build with static libcap and shared gnutls  
> > This commit is not is current master as of ba33728bc31.
> 
> Argh indeed, my bad. I applied it locally, didn't push it, and then
> due to a git reset --hard, it got lost. I've now re-applied that
> commit, and pushed this time.

Since you have the commit ID you could restore the original commit with

  git checkout -b lxc-fix 52dcec570e05

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Nov 2016 00:49:34 +0200
Subject: [Buildroot] musl with kernel headers (was: [PATCH]
 bridge-utils: fix build with musl)
In-Reply-To: <20161104091639.1a0285c4@free-electrons.com>
References: <0b4d1e33355f00f915768a2bc3f5c4d997206731.1478152430.git.baruch@tkos.co.il>
 <20161103224656.1e6466a6@free-electrons.com>
 <20161104052244.c2qswgkglbwcod3a@tarshish>
 <20161104091639.1a0285c4@free-electrons.com>
Message-ID: <20161105224934.gwj7wzqawxnovgzs@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Nov 04, 2016 at 09:16:39AM +0100, Thomas Petazzoni wrote:
> On Fri, 4 Nov 2016 07:22:44 +0200, Baruch Siach wrote:
> 
> > > Yes, we probably need to do something like that. I'm sick of all the
> > > patches we need to fix this structure redefinition mess, so if we have
> > > a global solution, it would be nice. I guess it needs to be applied in
> > > both the linux-headers package and the toolchain-external package.  
> > 
> > I was thinking if a sed call in TOOLCHAIN_TARGET_FINALIZE_HOOKS to simplify 
> > the hack. Would that work?
> 
> No, because FINALIZE_HOOKS, like their name suggests, are called at the
> very end of the build, after all packages have been built, and right
> before we create the filesystem images.
> 
> So to fix something that helps in building packages, it's a little bit
> too late :-)

Of course.

> However, you could have it as post-install staging hook of the
> toolchain virtual package I guess.

I experimented with TOOLCHAIN_POST_INSTALL_STAGING_HOOKS, but these hooks 
never run. TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS work as expected, but 
it's limited to external toolchains. What would be the right approach?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

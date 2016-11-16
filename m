From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Nov 2016 22:43:19 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <20161116173605.12aa2e5b@free-electrons.com>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <b08117ad-6edc-245d-0650-0db5eb1775ce@mind.be>
 <20161115233347.107fd31d@free-electrons.com>
 <20161116154516.w2e2wqerideqxsra@sapphire.tkos.co.il>
 <20161116165557.56fda400@free-electrons.com>
 <20161116162520.6quaqjt3fllqphma@sapphire.tkos.co.il>
 <20161116173605.12aa2e5b@free-electrons.com>
Message-ID: <20161116204319.ztno63yowfrqxlls@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 16, 2016 at 05:36:05PM +0100, Thomas Petazzoni wrote:
> On Wed, 16 Nov 2016 18:25:20 +0200, Baruch Siach wrote:
> 
> > > So I believe we should apply your proposed workaround. However, I'm not
> > > sure I want to take the risk of applying this to the master branch
> > > (even though I agree it could fix some build failures). Are you OK with
> > > applying it to the next branch?  
> > 
> > Of course. This is definitely not for master.
> 
> And any thoughts about my concerns to identify the packages that should
> be re-enabled and patches that should be removed?

Over time as packages get version bumps we'll have the chance to revise musl 
patches. Patches that cleanly apply to newer versions should not bother us, 
since they don't add maintenance burden.

As for !BR2_TOOLCHAIN_USES_MUSL dependencies, anyone interested in having a 
specific package building with musl may revise these dependences. Any typical 
package version bump sometimes makes dependencies removal possible, but it's 
not always apparent at bump time.

That being said, there are some low hanging fruits here that I plan to pick as 
time allows.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

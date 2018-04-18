From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Apr 2018 13:13:34 +0300
Subject: [Buildroot] [PATCH v2] procps-ng: bump to version 3.3.14
In-Reply-To: <20180418120400.2845e55c@windsurf.numericable.fr>
References: <130c35b0d58841519c15a94b2730f675fa63192d.1523995096.git.baruch@tkos.co.il>
 <20180418120400.2845e55c@windsurf.numericable.fr>
Message-ID: <20180418101334.wq7wxgd5owwsiona@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 18, 2018 at 12:04:00PM +0200, Thomas Petazzoni wrote:
> On Tue, 17 Apr 2018 22:58:16 +0300, Baruch Siach wrote:
> 
> > Note: procps now uses fopencookie(). musl libc added support for this
> > extension in version 1.1.19. autobuilder musl toolchains currently use
> > version 1.1.16.
> 
> I have started a new build of all the br-* pre-built toolchains with
> the latest Git master. I'll wait for this to finish, deploy the
> toolchains, and then apply this patch, if that's OK for you.

That's perfectly fine with me.

While at it, you might want to look into the issue of libgcc link failure in 
static musl toolchains. This issue currently affects lm-sensors and multicat. 
See http://patchwork.ozlabs.org/patch/883243/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

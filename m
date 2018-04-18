From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Apr 2018 22:56:46 +0300
Subject: [Buildroot] [PATCH v2] procps-ng: bump to version 3.3.14
In-Reply-To: <20180418132251.0d1d735c@windsurf.numericable.fr>
References: <130c35b0d58841519c15a94b2730f675fa63192d.1523995096.git.baruch@tkos.co.il>
 <20180418120400.2845e55c@windsurf.numericable.fr>
 <20180418101334.wq7wxgd5owwsiona@tarshish>
 <20180418132251.0d1d735c@windsurf.numericable.fr>
Message-ID: <20180418195646.mcvsrncysos7xe6t@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 18, 2018 at 01:22:51PM +0200, Thomas Petazzoni wrote:
> On Wed, 18 Apr 2018 13:13:34 +0300, Baruch Siach wrote:
> > While at it, you might want to look into the issue of libgcc link failure 
> > in static musl toolchains. This issue currently affects lm-sensors and 
> > multicat. See http://patchwork.ozlabs.org/patch/883243/.
> 
> I did have a look at this issue two weeks ago or so, and like you, I
> concluded that there was a toolchain issue. I guess it should be
> reported to musl upstream. It may not be a musl issue per-se, perhaps
> more a musl-into-gcc integration issue, but they might be able to help.
> Do you think you could contact the musl folks about this ?

Reverting recent musl libc version bumps does not help. I reproduced this 
issue with versions 1.1.18 and 1.1.16, with gcc 6.x and 7.x. Static only musl 
toolchain might be something that never actually worked. I wonder how the 
presence of shared libc in autobuilder pre-built musl toolchains makes static 
link work.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

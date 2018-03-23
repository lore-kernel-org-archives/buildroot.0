From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Mar 2018 09:16:01 +0300
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <CAB0FRsteemDJgVHUmq-b_v7XjEEv4FMM276eW9pLF1d0n196xg@mail.gmail.com>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180321160329.20768-2-francois.perrad@gadz.org>
 <20180321170413.74jd5vq4ygcgbewp@tarshish>
 <20180321211310.50f6410c@windsurf>
 <20180321201608.jrkkauvpiwcla6js@tarshish>
 <20180321212255.20f2e2bc@windsurf>
 <20180322053605.ffiwm36hj3z2ikmh@sapphire.tkos.co.il>
 <CAB0FRsteemDJgVHUmq-b_v7XjEEv4FMM276eW9pLF1d0n196xg@mail.gmail.com>
Message-ID: <20180323061601.rvohcr7jmuskkvvj@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Fri, Mar 23, 2018 at 05:15:43AM +0100, Fran?ois Perrad wrote:
> 2018-03-22 6:36 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> > On Wed, Mar 21, 2018 at 09:22:55PM +0100, Thomas Petazzoni wrote:
> > > On Wed, 21 Mar 2018 22:16:08 +0200, Baruch Siach wrote:
> > > > Here is my full commit on v2:
> > > >
> > > > Since both libraries are static only, this does not reduce the binary
> > size. On
> > > > the other hand, bundled libraries are more likely to work correctly
> > with any
> > > > give version of dropbear. The only benefit of using external libraries
> > is when
> > > > there is a security update to the libraries. But unless there is a
> > known issue
> > > > now, I'm not sure it's worth it.
> > > >
> > > > Do you see other reasons to prefer unbundling?
> > >
> > > Well, exactly the one you mention: security issues.
> > >
> > > In fact, I think you're putting the problem in the wrong direction. I
> > > would rather say: "Unless there is a good reason to not use external
> > > libraries, we should use external libraries rather than bundled ones".
>
> By default, dropbear prefers unbundled libtom, see
> https://github.com/mkj/dropbear/blob/master/configure.ac#L507-L509

Right. So if that's upstream choice I'm fine with that.

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

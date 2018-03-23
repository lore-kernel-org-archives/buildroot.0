From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 23 Mar 2018 05:15:43 +0100
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180322053605.ffiwm36hj3z2ikmh@sapphire.tkos.co.il>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180321160329.20768-2-francois.perrad@gadz.org>
 <20180321170413.74jd5vq4ygcgbewp@tarshish>
 <20180321211310.50f6410c@windsurf> <20180321201608.jrkkauvpiwcla6js@tarshish>
 <20180321212255.20f2e2bc@windsurf>
 <20180322053605.ffiwm36hj3z2ikmh@sapphire.tkos.co.il>
Message-ID: <CAB0FRsteemDJgVHUmq-b_v7XjEEv4FMM276eW9pLF1d0n196xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-22 6:36 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Thomas,
>
> On Wed, Mar 21, 2018 at 09:22:55PM +0100, Thomas Petazzoni wrote:
> > On Wed, 21 Mar 2018 22:16:08 +0200, Baruch Siach wrote:
> > > Here is my full commit on v2:
> > >
> > > Since both libraries are static only, this does not reduce the binary
> size. On
> > > the other hand, bundled libraries are more likely to work correctly
> with any
> > > give version of dropbear. The only benefit of using external libraries
> is when
> > > there is a security update to the libraries. But unless there is a
> known issue
> > > now, I'm not sure it's worth it.
> > >
> > > Do you see other reasons to prefer unbundling?
> >
> > Well, exactly the one you mention: security issues.
> >
> > In fact, I think you're putting the problem in the wrong direction. I
> > would rather say: "Unless there is a good reason to not use external
> > libraries, we should use external libraries rather than bundled ones".
>
>
By default, dropbear prefers unbundled libtom, see
https://github.com/mkj/dropbear/blob/master/configure.ac#L507-L509

Fran?ois



> I think we should be more careful in this case. Crypto primitives are
> "hazmat"[1]. dropbear is an actively maintained project. I think we can
> trust
> dropbear to react immediately when there is a known issue with the crypto
> libraries that affects the dropbear use case. In my opinion, the danger of
> crypto libraries version mismatch resulting from untested crypto library
> update, outweighs the danger of known vulnerability window in a dropbear
> bundled crypto library.
>
> [1] https://cryptography.io/en/latest/hazmat/primitives/
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180323/b079cba3/attachment.html>

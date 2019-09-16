From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 16 Sep 2019 13:05:54 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libcamera: link with atomic when needed
In-Reply-To: <8f55b843-24a1-d5d2-851e-05cce44bcb08@ideasonboard.com>
References: <20190905165306.2178-1-fontaine.fabrice@gmail.com>
 <20190915221830.162023bb@windsurf.home>
 <8f55b843-24a1-d5d2-851e-05cce44bcb08@ideasonboard.com>
Message-ID: <CAPi7W813-84mSmENffGqJqbQ2c+HamFORvQvvxeyJtqH1zSDXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kieran,
Le dim. 15 sept. 2019 ? 22:45, Kieran Bingham
<kieran.bingham@ideasonboard.com> a ?crit :
>
> Hi Thomas,
>
> On 15/09/2019 21:18, Thomas Petazzoni wrote:
> > On Thu,  5 Sep 2019 18:53:06 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >
> >> Fixes:
> >>  - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
> >>
> >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >> ---
> >> Changes v1 -> v2 (after review of Kieran Bingham):
> >>  - Use an upstreamable solution
> >
> > Applied to master, thanks.
>
> Great, thanks for collecting this.
>
> > Could you send the patch upstream, after
> > taking into account the comments from Kieran ?
>
> This fix has already been integrated into libcamera master :
>
> https://git.linuxtv.org/libcamera.git/commit/?id=5d05418d9b53e1838692f687a6dc373dad45355c
>
>
> I haven't sent a version-bump patch yet, because we've got usages of
> O_TMPFILE in our tests, which even with making our build depend on
> kernel headers > 3.11 - I still saw failures in some toolchains.
>
> Do you know of a 'failsafe' way to build on all (or skip) toolchains
> when we make use of O_TMPFILE?
There is a pretty long thread about O_TMPFILE in the context of runc
here: https://patchwork.ozlabs.org/patch/1044933.
You can also find the commit log for runc's patch here:
https://git.buildroot.net/buildroot/commit/package/runc/?id=905e976a6af224b3ed015c46fcea2d717c155f55

>
> I've tried adding:
>
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 # Still 6 failures
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
>
> But I still get failures related to the O_TMPFILE usage.
>
> (Yes, I know each HEADERS_AT_LEAST brings in the older dependencies as
> well, but I started at 3_11)
>
> Cheers
>
> Kieran
>
>
> > Thanks!
> >
> > Thomas
> >
>
> --
> Regards
> --
> Kieran
Best Regards,

Fabrice

From: Sam Voss <sam.voss@gmail.com>
Date: Sat, 19 Oct 2019 16:59:54 -0500
Subject: [Buildroot] [PATCH] package/util-linux: Add option for enabling
 wipefs
In-Reply-To: <XnsAAEDEF2F2845berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20191018033047.370820-1-sam.voss@gmail.com>
 <98c40882-8f1d-61d6-41fa-74d86a8bf5a8@mind.be>
 <XnsAAEDEF2F2845berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <CAK714xL6RJVDSQ_Qs9Hdn0_BMbm6v6mgKmonBk_6kujF78vH+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 19, 2019 at 4:33 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Arnout Vandecappelle <arnout@mind.be> wrote in
> news:98c40882-8f1d-61d6-41fa-74d86a8bf5a8 at mind.be:
>
> > On 18/10/2019 05:30, sam.voss at gmail.com
> > wrote:
> >> From: Sam Voss <sam.voss@gmail.com>
> >>
> >> Add option to enable wipefs as a standalone app, so that it may be
> >> enabled when the flag --disable-all-packages is set.
> >>
> >> Signed-off-by: Sam Voss
> >> <sam.voss@gmail.com>
> >
> >  Applied to master, thanks.
>
> Hi,
>
> this patch lacks
>
>         UTIL_LINUX_AUTORECONF = yes
>S
> causing build errors:
> http://autobuild.buildroot.net/?reason=util-linux-2.34

I just re-tested this after removing automake from my host, and sure
enough it failed. Sending follow-up patch to clean this up.

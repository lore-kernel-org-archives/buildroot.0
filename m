From: Jed Evnull <jedevnull@gmail.com>
Date: Mon, 17 Oct 2011 15:41:58 -0400
Subject: [Buildroot] buildroot noob help!
In-Reply-To: <j7hdm0$aqa$1@dough.gmane.org>
References: <CAFo83mG5Gx+LoZHP3j8-avDGXoKiHQxKLUcAM2y4rc8Ok1M_rg@mail.gmail.com>
 <201110151606.35102.minimod@morethan.org>
 <CAFo83mEQUkMazfnZLAu=UPn+xgyjY-g4qkYMTmqZDr0JC99vKQ@mail.gmail.com>
 <201110171251.00254.arnout@mind.be> <j7hdm0$aqa$1@dough.gmane.org>
Message-ID: <CAFo83mEBpPwAWYYimCzxRCOAVAWH6n+9SEuefxSNmV6W1miaVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct 17, 2011 10:22 AM, "Grant Edwards" <grant.b.edwards@gmail.com> wrote:
>
> On 2011-10-17, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> > On Saturday 15 October 2011 23:59:07, Jed Evnull wrote:
> >> Sorry, I was probably incoherent. My goal is to produce arm binaries
for my
> >> tablet. I want them as small as possible, so I want statically linked
> >> packages with uclibc, rather than glibc.
> >
> > If you want them as small as possible, you should _not_ link them
> > statically...
> >
> > However, I guess the real problem is that you don't have access to
> > the cross-compilation shared libraries and headers for your tablet.
> > In that case linking statically is indeed a good solution.  Follow
> > Grant's suggestion to use crosstool-NG.  Keep in mind though that for
> > quite a few existing packages, linking statically doesn't work well
> > (GStreamer and it's dependents, for instance).
>
> Yep.  Anything that uses "plugins" (object files that are fouand,
> selected, and loaded dynamically under program control after the
> program is running) is going to be allergic to static linking.
>
> --
> Grant Edwards               grant.b.edwards        Yow! An Italian is
COMBING
>                                  at               his hair in suburban DES
>                              gmail.com            MOINES!
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks for all the replies, it's been a great help. I'm building a toolchain
with ct-ng now.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111017/2adaa764/attachment.html>

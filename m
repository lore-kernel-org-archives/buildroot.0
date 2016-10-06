From: Jean-Michel Hautbois <jean-michel.hautbois@veo-labs.com>
Date: Thu, 6 Oct 2016 07:34:10 +0200
Subject: [Buildroot] Xenomai 3.x
In-Reply-To: <CAH-u=82g7aXEVbe8zqqKvcR4vEH5HKwvPML+BPy+fk51-6gc3A@mail.gmail.com>
References: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
 <20161005095532.683204d0@free-electrons.com>
 <CAH-u=818PtBnsOqsUtSvUwACE9S-oxBsR0q+W3oQb7NRLwG2xg@mail.gmail.com>
 <64d74271-3535-198c-3ec5-b7675d031d34@mind.be>
 <CAH-u=81T3HDse2T0kTttcLmXO-OEFs-TifmQHB-DB=-kyBWpCw@mail.gmail.com>
 <CAH-u=83inyC8cYX=ovP839-C0zARrTuvHC_FMG6igHEY8ZUDGw@mail.gmail.com>
 <CAH-u=80w=DhdBd00D=TdQ=GKsh_wjZhJS5dyOokEzOgVoNuOKg@mail.gmail.com>
 <CAH-u=83sffpomqzQbCpBe=iTHA78vyPSj_+-pidpAHQ2u6vZMQ@mail.gmail.com>
 <CAH-u=82g7aXEVbe8zqqKvcR4vEH5HKwvPML+BPy+fk51-6gc3A@mail.gmail.com>
Message-ID: <CAH-u=81tuHkp93eFtLGGiYQSahGS_GeeZv19SshkB+nT4UPJqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 6 oct. 2016 00:54, "Arnout Vandecappelle" <arnout@mind.be> a ?crit :
>
>
>
> On 05-10-16 10:30, Jean-Michel Hautbois wrote:
> > Hi Thomas,
> >
> > 2016-10-05 9:55 GMT+02:00 Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com>:
> >> Hello,
> >>
> >> On Wed, 5 Oct 2016 09:07:28 +0200, Jean-Michel Hautbois wrote:
> >>
> >>> I am trying to get a working Xenomai 3.x package with buildroot.
> >>> My main objective is to have it running with Mercury (ie. PREEMPT_RT
> >>> and not Adeos), and ideally with the compatibility layer for Xenomai
> >>> 2.x existing applications.
> >>>
> >>> I had a look at this thread :
> >>> http://lists.busybox.net/pipermail/buildroot/2016-January/150791.html
> >>>
> >>> I was wondering if anyone already worked on this stuff, in order to
> >>> combine the efforts ?
> >>> I can do it on my own, of course, but I think it would be better to
> >>> have it integrated upstream :) !
> >>
> >> So far, we haven't received any patch to add Xenomai 3.x support in
> >> Buildroot, and I've not heard (besides you asking questions on IRC)
> >> anyone working on this currently.
> >>
> >> So patches are definitely welcome. It's not clear to me whether we want
> >> to support both Xenomai 2.x and Xenomai 3.x, or if supporting Xenomai
> >> 3.x is sufficient, as a replacement for Xeonmai 2.x.
> >
> > Well, yes, it is not clear for me either.
> > I am not sure that it has to be compiled the same way.
> > Well, if I have anything I can show, I will ask for advices.
>
>  AFAIK the Xenomai 3 API should be fully backward compatible with Xenomai
2, so
> I see no reason to support both. I'd just "bump" Xenomai.

Well I am not so sure about that, there is a complete migration guide and
some applications may need some modifications to work correctly with
Xenomai 3. And there is another reason I would not bump to 3.x instead of
making a different package : some people may want to stay on the 2.6 branch
(which is now 2.6.5) which is a EOL tree but still, some people may not
want to bump to 3.x as they may have a lot of their system depending on
Xenomai 2.6.

>  A first patch would do a bump with just Cobalt, which is more or less
what we
> have now. A second patch would add the option to use Mercury instead of
Cobalt.
>
>  This is also the feedback I gave in the thread that you refer to.

Yes and I started to work on this way, but I don't like having too much
ifeq() in the source code, blame me :-).

I am open to all suggestions but please note I will not test Cobalt as I
don't have a kernel to do so (and no time for it) so the patch proposal
will be a RFC for starting.

Thanks,
JM
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161006/0ef97598/attachment.html>

From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 14 Jun 2019 14:23:14 +0530
Subject: [Buildroot] [PATCH v3 3/3] autobuild-run: do reproducible
 builds tests if BR2_REPRODUCIBLE=y
In-Reply-To: <b7f3b46f-6be2-615a-108e-2197111460d3@mind.be>
References: <20190611123416.11533-1-itsatharva@gmail.com>
 <20190611123416.11533-3-itsatharva@gmail.com>
 <20190613202308.GM2647@scaer>
 <CABM+sgrKRi873Pu3PBpqP-m6JtkHhJRMgvNPus2p+0uEja8YFA@mail.gmail.com>
 <b7f3b46f-6be2-615a-108e-2197111460d3@mind.be>
Message-ID: <CABM+sgrjcMGPoZfQQfVWsB4sp9BZ74HgndVmZZEktC4zHmO-Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Yann considers the '... if ... else ...' construct more pythonese,
> but I kind of like explicit conditions :-)

Haha I do see his point of view. For me, I've only worked with C for the
last 2 years at university and my last internship so it's a bit hard to
'talk' in
pythonese.

Regards,
Atharva Lele


On Fri, Jun 14, 2019 at 2:17 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 14/06/2019 10:46, Atharva Lele wrote:
> >> You need to do (basically):
> >
> >>    with open(os.path.join(outputdir, ".config"), "r") as fconf:
> >>        reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
> >>    build = do_reproducible_build if reproducible else do_build
> >>    ret = build(**kwargs)
> >
> > It would still work if I just unindent the if-else block too right? This
> is what
> > I actually intended to do
> > It's working for me in testing..
> > Like this:
> >
> >     with open(os.path.join(outputdir, ".config"), "r") as fconf:
> >         reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
> >     if reproducible:
> >         ret = do_reproducible_build(**kwargs)
> >     else:
> >         ret = do_build(**kwargs)
>
>  Yes, and I prefer that version. Yann considers the '... if ... else ...'
> construct more pythonese, but I kind of like explicit conditions :-)
>
>  Regards,
>  Arnout
>
>
> [snip]
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190614/e12fa2c2/attachment.html>

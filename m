From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 14 Jun 2019 14:17:08 +0530
Subject: [Buildroot] [PATCH v3 2/3] autobuild-run: initial
 implementation of do_reproducible_build()
In-Reply-To: <ddb67691-4212-9b76-1a34-74622dfe8ee3@mind.be>
References: <20190611123416.11533-1-itsatharva@gmail.com>
 <20190611123416.11533-2-itsatharva@gmail.com>
 <20190613201358.GL2647@scaer> <ddb67691-4212-9b76-1a34-74622dfe8ee3@mind.be>
Message-ID: <CABM+sgr-XXPDAND5qr2Mh5AQRpxEocryZhrwSfwAhZLsnX=QmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I think an explicit O= -C is easier to read and understand.

I do agree with this.

Regards,
Atharva Lele


On Fri, Jun 14, 2019 at 1:28 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 13/06/2019 22:13, Yann E. MORIN wrote:
> > Atharva, All,
> >
> > On 2019-06-11 18:04 +0530, Atharva Lele spake thusly:
> [snip]
> >> +    # Clean up build 1
> >> +    f = open(os.path.join(outputdir, "logfile"), "w+")
> >> +    subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
> "clean"], stdout=f, stderr=f)
> >
> > Since we do create a small Makefile wrapper in $(O), you could simplify
> > this a little with:
> >
> >     subprocess.call(["make", "-C", outputdir, "clean"], stdout=f,
> stderr=f)
> >
> > Ditto in the existing do_build() function. Can be improved upon when you
> > introduce the Builder class.
>
>  This is bikeshedding, obviously, but I don't like that proposal. I think
> an
> explicit O= -C is easier to read and understand.
>
>  Shorter is not better :-)
>
>  Regards,
>  Arnout
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190614/259a3597/attachment.html>

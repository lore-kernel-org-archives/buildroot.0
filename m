From: Pawel Sikora <sikor6@gmail.com>
Date: Mon, 10 Apr 2017 22:21:01 +0200
Subject: [Buildroot] [PATCH 1/1] xenomai: Add choice for Cobalt/Mercury
	core
In-Reply-To: <398a808a-b385-73a5-128e-ad56a4b31d2b@mind.be>
References: <20170406234139.31532-1-sikor6@gmail.com>
 <20170406234139.31532-2-sikor6@gmail.com>
 <20170408153452.54837e4c@free-electrons.com>
 <2fa9e5f3-79a9-090e-76ed-457be2e6e49a@mind.be>
 <CAKfV1CaoGUPmL6W5xT61YECuVvN3_RthyD7sw8Cw54e_RMOYCQ@mail.gmail.com>
 <99d84995-3497-3072-f56a-bea2960327c6@mind.be>
 <20170410135105.6b246fa4@free-electrons.com>
 <398a808a-b385-73a5-128e-ad56a4b31d2b@mind.be>
Message-ID: <CAKfV1CY0wpiDDST8Zv6n9tXRyLbUrnR+maFnXbfvoQ4GEhhHXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2017-04-10 15:33 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 10-04-17 13:51, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Mon, 10 Apr 2017 11:08:21 +0200, Arnout Vandecappelle wrote:
> >
> >>  In fact, I would forego the 'custom Xenomai version' support entirely.
> I don't
> >> see why you would ever want an older version, and if you need a newer
> version
> >> than the one in Buildroot you can just bump the package. Does anyone
> see a
> >> reason to support multiple versions? [Adding ThomasDS in Cc to answer
> that.]
> >
> > I think the main reason is that Xenomai includes kernel patches, but
> > only for specific kernel versions. So if you're using a specific kernel
> > version, you might need to use a specific Xenomai version, and not just
> > "the latest".
>
>  As far as I remember, older versions weren't removed that often, though
> they
> did sometimes get updated to a later release of that branch. But I think in
> these cases you just want to point to a specific version of the ipipe
> patch, and
> don't want to use an older and potentially buggy xenomai version.
>
>  While checking this, by the way, I discovered that the --default option to
> prepare-kernel.sh no longer works (i.e., it no longer autodiscovers the
> patch to
> apply). So linux-ext-xenomai.mk should be updated to disallow an empty
> ipipe
> patch. Pawel, could you look into this? It should either autodiscover the
> patch
> to apply similar to how rtai does it, or it should just $(error) in case
> XENOMAI_ADEOS_PATCH is empty, similar to the handling of
> LINUX_KCONFIG_FILE (but
> remember to check BR_BUILDING in that case...). I think autodiscovering is
> a bit
> fragile, though.
>

Hmm ok, I will look at this, but most probably not until wednesday (quite a
lot to do on university now)

But... when there is no patch provided, you are prompted for it at a stage
of kernel patching, isn't this better than error?
Of course, it would be good to have a working autodiscovery (but not so
urgent, right?)

Regards,
Pawel



>
>  Regards,
>  Arnout
>
> >
> > Best regards,
> >
> > Thomas
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170410/0b4fe759/attachment.html>

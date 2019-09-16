From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 16 Sep 2019 16:00:33 -0300
Subject: [Buildroot] [PATCH] package/cups-filters: fix build without NLS
In-Reply-To: <20190801182901.47e8377f@windsurf.home>
References: <20190722071146.30199-1-unixmania@gmail.com>
 <20190801182901.47e8377f@windsurf.home>
Message-ID: <CAJ4jsae3c-iyg5MCNbO7wgHWzJHZxdvgavqp8W90aow=gfmFWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 1, 2019 at 1:29 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 22 Jul 2019 04:11:46 -0300
> unixmania at gmail.com wrote:
>
> > +# texttotext must be linked to libiconv if !BR2_ENABLE_LOCALE. We could patch
> > +# configure.ac to use AM_ICONV but it would require iconv.m4, increasing the
> > +# patch size by at least 130 lines. Let's keep it simple and just patch
> > +# Makefile.am to append -liconv to the link command line.
>
> Why is this AM_ICONV solution taking at least 130 lines ? This would be
> upstreamable, and looks a lot nicer. Could you propose a patch with an
> AM_ICONV base solution instead ?
>
> Thanks!

A change solving this was accepted upstream so I will submit a
follow-up with that fix:

   https://github.com/OpenPrinting/cups-filters/pull/155

-- 
Carlos Santos <unixmania@gmail.com>

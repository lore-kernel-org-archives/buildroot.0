From: Alexander Khryukin <alexander@mezon.ru>
Date: Wed, 14 Nov 2012 12:50:52 +0300
Subject: [Buildroot] libgomp.so.1.0.0 not in target image
In-Reply-To: <20121114092103.5f057441@skate>
References: <CABtOAfzcjFWUVELMn0X4fRF8fcdqBL5HsBzo7sw1wt8JJc+Ghw@mail.gmail.com>
 <50A284A8.9070304@mind.be> <20121113231021.6995bd28@skate>
 <50A2D27A.5000706@mind.be> <20121114092103.5f057441@skate>
Message-ID: <CABtOAfx=fYpokmXoRd84=QAn=iutCTbVj0ycC64nCqz3B4rj7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/14 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Arnout,
>
> On Wed, 14 Nov 2012 00:06:34 +0100, Arnout Vandecappelle wrote:
> > On 13/11/12 23:10, Thomas Petazzoni wrote:
> > > Arnout,
> > >
> > > On Tue, 13 Nov 2012 18:34:32 +0100, Arnout Vandecappelle wrote:
> > >
> > >>    Thomas, I think this should be fixed by adding libgomp to
> > >> LIB_EXTERNAL_LIBS in ext-tool.mk.  Is that right?  Will that also
> > >> work if libgomp doesn't exist?
> > >
> > > Do we really need to be linked against libgomp? Under what
> > > conditions does that happen? Can't we avoid that even if the
> > > toolchain has OpenMP support?
> >
> >   beecrypt links agains libgomp if libgomp is available; rpm uses
> > beecrypt.
> >
> >   The point is not avoiding to link with libgomp (you have to do that
> > explicitly), the point is that if somebody links against libgomp, it
> > has to be in target.
>
> My point is precisely to avoid linking with libgomp. OpenMP in beecrypt
> is only used in one location, the RSA algorithm, and OpenMP support can
> be disabled by passing --disable-openmp.
>
> So instead of unconditionally copying a 232 KB library just to
> parallelize a single RSA algorithm in beecrypt, I'd rather advocate to
> disable OpenMP support in beecrypt.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


If you want to disable openmp in beecrypt
next step it is disabling openmp in rpm package like

--disable-openmp
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121114/42d46b76/attachment.html>

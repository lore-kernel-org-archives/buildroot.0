From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 21 Aug 2012 20:07:37 +0300
Subject: [Buildroot] BR2_SOURCEFORGE_MIRROR issue in package .mk files
In-Reply-To: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
References: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
Message-ID: <5033C059.9060603@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

21.8.2012 18:51, Aras Vaichas kirjoitti:
> I was rebuilding my Buildroot when I noticed that the
> kent.dl.sourceforge.net mirror is down and my build fails.
>
> I encountered this same problem the other day with crosstool-ng, and
> soon afterwards a patch was posted:
> http://sourceware.org/ml/crossgcc/2012-08/msg00066.html
>
> I looked at changing BR2_SOURCEFORGE_MIRROR but unfortunately
> Buildroot only allows BR2_SOURCEFORGE_MIRROR to replace *part* of the
> Sourceforge URL
>
> e.g. in buildroot/package/boost/boost.mk:
> BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
>
> Should it be changed to:
> http://$(BR2_SOURCEFORGE_MIRROR).sourceforge.net/sourceforge/boost
>
> Comments?

Yeah, kent is definetely down.
Checked with this:

http://kent.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2

But this works:

http://tenet.dl.sourceforge.net/project/boost/boost/1.49.0/boost_1_49_0.tar.bz2

If that South African mirror is too far away/slow  then you could change
the BR2_SOURCEFORGE_MIRROR
to some other, short name value from
http://sourceforge.net/apps/trac/sourceforge/wiki/Mirrors

In related note: Maybe this BR2_SOURCEFORGE_MIRROR stuff could be
automated somehow ?

Like using some mirrorselect tool (or something like that) if
BR2_SOURCEFORGE_MIRROR is empty and picking the fastest/closest mirror.
And if BR2_SOURCEFORGE_MIRROR is set in Config.in then use that value no
matter what.

Just thoughts....

Stefan

>
> regards,
>
> Aras Vaichas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

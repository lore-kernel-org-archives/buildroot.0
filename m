From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 25 Mar 2019 22:20:35 +0100
Subject: [Buildroot] [PATCH v2 2/2] pkg-generic: Cleanup some redundant
 checks
In-Reply-To: <20190319220315.GG2702@scaer>
References: <20190317212014.3831-1-nolange79@gmail.com>
 <20190317212014.3831-2-nolange79@gmail.com>
 <20190319220315.GG2702@scaer>
Message-ID: <CADYdroPj2+X1GobjL870_Zrai9SzGBDNJ7k2T+DpQz5FDdWsjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Di., 19. M?rz 2019 um 23:03 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2019-03-17 22:20 +0100, Norbert Lange spake thusly:
> > With the last change, packages will depend
> > only on host-{xz,lzip} if the source archives
> > have filenames requesting the corresponding compressor.
> >
> > This allows using a single guard.
>
> This commit log is an improvement agaisnt the previous one, yet I still
> had to think a bit too hard to understand the reason that works.
>
> And I think there is an issue with that. Not today, but that opens up a
> case where we can introduce a subtil bug in the future.
>
> If, say, xz changes its distribution archive from .bz2 to .lz, iand lzip
> changes theirs from .gz to .xz, then we'd introduce a circular
> dependency at the make level, and make silently and arbitrarily drops
> one of the dependencies.

What would you do in that case anyway?
(besides I dont think lzip is getting any traction, or that a sane compressor
package should use anything but gzip for "boostrapping").

> However, now that I think about it, that is of not big consequence: in
> either case, the build woulld break on the first one we try to extract,
> and we would notice quite early and quite easily.
>
> Still, I'd like we think a bit harder about those special cases.

I really don't think the patch makes things worse.

Norbert

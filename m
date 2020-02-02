From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 2 Feb 2020 01:42:04 -0700
Subject: [Buildroot] [PATCH v2,
 1/1] package/bitcoin: bump to version 0.19.0.1
In-Reply-To: <20200202090709.2c9afa39@windsurf>
References: <20200122212637.1008692-1-fontaine.fabrice@gmail.com>
 <20200202090709.2c9afa39@windsurf>
Message-ID: <CADvTj4q1xNEsaU3sj5xiV+RiEF_6mHdKOVasNLkPV8KPYzr-Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 2, 2020 at 1:07 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 22 Jan 2020 22:26:37 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > - Retrieve official tarball instead of using github as specified in
> >   https://github.com/bitcoin/bitcoin/releases/tag/v0.19.0.1
> > - Remove patch (already in version)
> > - Update hash of COPYING (update in year:
> >   https://github.com/bitcoin/bitcoin/commit/ae5594d51b489826f2f2315c92e8df5ee0267efc)
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> > Changes v1 -> v2:
> >  - Fix version in title
>
> Applied to master, thanks.
Any bitcoin core updates really need to be backported as well even
if they are a major version bump.

I should probably add that there are special security considerations
that need to be taken into account when packaging bitcoin core.
See:
https://bitcoinmagazine.com/articles/linux-distribution-packaging-and-bitcoin-1374549783
https://bugzilla.redhat.com/show_bug.cgi?id=1020292

There are very few Linux distributions that package bitcoin core
as very few have a suitable release model for properly handling
updates. In general if a distribution can not keep Bitcoin Core on
the latest version for all supported releases then it really should
not be packaged at all.

One way to mitigate the risk is to explicitly remove the bitcoin core
package or replace it with a non-functional dummy package for
any stable branches where it can't be kept fully up to date. This
should probably be done as the final step when a stable branch is
no longer supported as well.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

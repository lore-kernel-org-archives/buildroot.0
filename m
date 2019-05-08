From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 8 May 2019 11:38:09 +0200
Subject: [Buildroot] [PATCH 1/2] allow build infrastructure to pick up
 installed meson tool
In-Reply-To: <20190507225625.31f5c8d8@windsurf>
References: <20190503131851.12315-1-norbert.lange@andritz.com>
 <20190503185721.18b2c3a4@gmx.net> <20190507225625.31f5c8d8@windsurf>
Message-ID: <CADYdroNJuRvW5S+8apbir9K3qJwYEkkJgH46khqws--AkGhBrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Di., 7. Mai 2019 um 22:56 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Fri, 3 May 2019 18:57:21 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > The major concern is no distribution will ship meson with the still needed
> > buildroot patch, see [4]...
>
> Indeed, that makes it impractical/impossible to use a system-provided
> meson. If we want to get there at some point, the
> 0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch patch needs to
> be upstreamed in a form or another.

I see why you would not want to depend on a system provided meson,
but it does work for target libraries.
So my proposal would be to incorporate the changes now,
with min-version set to a value that always evaluates to false.

So a user like me can enable the system meson easily,
even if its not officially supported or tested.

Norbert

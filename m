From: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Date: Tue, 6 Oct 2020 10:00:42 -0500
Subject: [Buildroot] [PATCH 1/1] package/patchelf: Pull in upstream
 bugfixes
In-Reply-To: <20201006163354.4c6ea501@windsurf.home>
References: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
 <20201006163354.4c6ea501@windsurf.home>
Message-ID: <CADDqnyLa4TxhrktC4bM19BaS6X84E6m+-U-UCraCUt3U8gg8ZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Oct 6, 2020 at 9:34 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon,  5 Oct 2020 13:50:34 -0500
> Conrad Ratschan <conrad.ratschan@rockwellcollins.com> wrote:
>
> > On Buildroot 2020.02.6 when building iputils for powerpc with
> > BR2_PIC_PIE enabled, the arping/rdisc/tftpd binaries will segfault at
> > runtime. This can be traced back to a few bugs in patchelf corrupting
> > the ELFs when resizing the RPATH to replace "$ORIGIN/" with "/usr/sbin".
> >
> > This patch pulls in upstream fixes to prevent the binaries from being
> > needlessly inflated, prevent the startPage from always being adjusted,
> > fix a few minor bugs, and fix incorrect endianness handling.
> >
> > Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
>
> So the idea of backporting all those changes for patchelf 0.9 instead
> of bumping to patchelf 0.12 is to minimize the changes for Buildroot's
> LTS 2020.02.x branch ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Yes, there are a number of open issues on patchelf's issue tracker
that I did not necessarily want to run into on the LTS branch. The
0.12 approach may be better for master, but as a minimum, the
0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch would
need to be updated to apply on the latest version as the related PR
has not merged yet, and my
0010-Fix-endianness-issues-for-powerpc-PIE.patch would need to be
pulled in as that just merged yesterday.

--
Conrad Ratschan | Software Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Road NE, Cedar Rapids, IA 52498, USA

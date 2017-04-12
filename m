From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 12 Apr 2017 15:45:06 -0500
Subject: [Buildroot] [PATCH 3/4] libselinux: allow compiling python
 wrapper module for target
In-Reply-To: <CANQCQpaqVNzP=2hwRexdP4pz0VU=P3x3gaUMch62RMsOi618uA@mail.gmail.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-3-Adamduskett@outlook.com>
 <20170411144012.10215812@free-electrons.com>
 <CANQCQpbF44HCb_RumriS6u846YAg2GezULwsc0mDFBmGg3mVew@mail.gmail.com>
 <CANQCQpZVb3PEEDaBkn0u57Z-FU97YtyWUeMwpi1SHj1829hjhA@mail.gmail.com>
 <CANQCQpaqVNzP=2hwRexdP4pz0VU=P3x3gaUMch62RMsOi618uA@mail.gmail.com>
Message-ID: <CANQCQpYcXdnuOqcAhMzrTyc3Tp_WRns-4QXA3Hk89RXYZxt3Fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Apr 12, 2017 at 9:00 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas
>
> On Wed, Apr 12, 2017 at 8:54 AM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
> > Thomas,
> >
> > On Wed, Apr 12, 2017 at 7:53 AM, Matthew Weber
> > <matthew.weber@rockwellcollins.com> wrote:
> >> Thomas
> >>
> >> On Tue, Apr 11, 2017 at 7:40 AM, Thomas Petazzoni
> >> <thomas.petazzoni@free-electrons.com> wrote:
> >>>
> >>> Hello,
> >>>
> >>> On Thu,  2 Feb 2017 17:45:04 -0500, Adam Duskett wrote:
> >>> > libselinux currently does not compile it's python wrapper module
> >>> > for the target.  This is needed for audit2allow to function properly.
> >>> >
> >>> > This patch allows for the python wrapper to be built.  The current
> >>> > makefile will try to install the python wrapper to the host directory
> >>> > unless the PYSITEDIR variable is set.  I wrapped the build of the
> >>> > python wrapper in a check for AUDIT2ALLOW because of the extra python
> >>> > dependency, as I am sure many users don't want to have to install
> >>> > python if they don't have to.
> >>> >
> >>> > Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> >>> > ---
> >>> >  package/libselinux/libselinux.mk | 32 ++++++++++++++++++++++++++++++++
> >>> >  1 file changed, 32 insertions(+)
> >>>
> >>> This causes some build failures:
> >>>
> >>> http://autobuild.buildroot.net/results/db1/db1e6f3054092fc5576ccab8e04a3b9d74ca9a8c/build-end.log.
> >>>
>

Proposing this fix.
https://patchwork.ozlabs.org/patch/750170/

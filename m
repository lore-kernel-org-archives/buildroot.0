From: David Skok <blanco.ether@gmail.com>
Date: Thu, 15 Aug 2013 10:30:12 -0400
Subject: [Buildroot] Fwd:  [PATCH 1/1] ola: new package
In-Reply-To: <CALy4uEU8nED=gPosezp_5dK79BQ8Q18ZtogJhPComrO+kHkJZA@mail.gmail.com>
References: <1376330715-20047-1-git-send-email-blanco.ether@gmail.com>
 <20130814003211.0c9bdaa7@skate>
 <30D3ECD4-98BF-4A89-A156-5A5D2A7EE1AB@gmail.com>
 <CALy4uEU8nED=gPosezp_5dK79BQ8Q18ZtogJhPComrO+kHkJZA@mail.gmail.com>
Message-ID: <CALy4uEWtQiLAfbe8VRQ1iJX1TQxbZ=HSTXN+De7DKumsH2sWrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I checked with maintainer and karate and spi plugins build by mistake even
with --disable to configure.  Will have to either live with that or take
selection out and user assumes that it will be built.  The milinst plugin
is new and I added it to the list as well as ordered all alphabetically.
 Also found error with a plug in requiring python dependency in original
patch and added python binding dependency comment for said plugin.

A general buildroot question...
When plugin selections added after first build, ./configure is not re-run.
 As such dependencies are built but not new plugins.  Is there something I
need to put in package patch to make this work?

I realize that the .stamp_configured needs to be deleted and if selections
are added this works fine.  If selections removed the already built pieces
will remain in staging and target.  Am I right?

Dave




On Tue, Aug 13, 2013 at 8:51 PM, Blanco <blanco.ether@gmail.com> wrote:

>
> Hi Thomas,
>
> No, plugins should not be built if not selected.  I took out autoreconfig
> when I switched from git repo to tarred release.  It is possible that is
> the cause.  I will check.
>
> Dave
>
> On Aug 13, 2013, at 6:32 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
> > Dear Dave Skok,
> >
> > On Mon, 12 Aug 2013 14:05:15 -0400, Dave Skok wrote:
> >> Signed-off-by: Dave Skok <blanco.ether@gmail.com>
> >> ---
> >> package/Config.in     |   1 +
> >> package/ola/Config.in | 144
> +++++++++++++++++++++++++++++++++++++++++++++++
> >> package/ola/ola.mk    | 153
> ++++++++++++++++++++++++++++++++++++++++++++++++++
> >> 3 files changed, 298 insertions(+)
> >> create mode 100644 package/ola/Config.in
> >> create mode 100644 package/ola/ola.mk
> >
> > Thanks, it now builds successfully.
> >
> > However, I've found another issue: even if I keep most plugins
> > disabled, they are still all built and installed. For example, with a
> > configuration that has:
> >
> > # BR2_PACKAGE_OLA_PLUGIN_KARATE is not set
> >
> > I get the karate plugin built and installed:
> >
> > $ ls -1 output/target/usr/lib/olad/*karate*
> > output/target/usr/lib/olad/libolakarate.so
> > output/target/usr/lib/olad/libolakarate.so.0
> > output/target/usr/lib/olad/libolakarate.so.0.0.0
> >
> > Same goes for:
> >
> > # BR2_PACKAGE_OLA_PLUGIN_SPI is not set
> >
> > $ ls -1 output/target/usr/lib/olad/*spi*
> > output/target/usr/lib/olad/libolaspicore.so
> > output/target/usr/lib/olad/libolaspicore.so.0
> > output/target/usr/lib/olad/libolaspicore.so.0.0.0
> > output/target/usr/lib/olad/libolaspi.so
> > output/target/usr/lib/olad/libolaspi.so.0
> > output/target/usr/lib/olad/libolaspi.so.0.0.0
> >
> > Is this expected?
> >
> > Thanks,
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130815/e3053949/attachment.html>

From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 05:13:56 -0500
Subject: [Buildroot] [PATCH v2 1/1] check-package: add version format
 check
In-Reply-To: <CANQCQpa_Z9SeM7dyp7MethO=ZEf23AT-=a_4jbLPhfq--VjaLQ@mail.gmail.com>
References: <20191025092104.1164-1-heiko.thiery@gmail.com>
 <20191026155754.38eade84@windsurf.home>
 <CANQCQpa_Z9SeM7dyp7MethO=ZEf23AT-=a_4jbLPhfq--VjaLQ@mail.gmail.com>
Message-ID: <CANQCQpbnhx_OKQNAP18xi+jpwtOtZr+rZdkCWTjAB2edCE1+ig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Oct 27, 2019 at 1:57 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Heiko, Thomas,
>
> On Sat, Oct 26, 2019 at 8:58 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Heiko,
> >
> > On Fri, 25 Oct 2019 11:21:04 +0200
> > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > > From: Heiko Thiery <heiko.thiery@kontron.com>
> > >
> > > To meet the requirement of "Anitya", the tool used by
> > > https://release-monitoring.org/, the <pkg>_VERSION variable
> > > should not contain a prefix 'v'.
> > >
> > > Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
> >
> > The implementation looks good, but we cannot apply this patch now,
> > because a number of packages cause this check to fail:
> >
>
> I've sent all but the GIT site method pkgs (mcelog / dt-utils /
> gst1-shark / linux-zigbee) as I need to find an example or look at the
> pkg logic to see how we're updating those.
>

Once http://patchwork.ozlabs.org/project/buildroot/list/?series=138984
is applied, we're left with these GIT site method pkgs to fix.  Yann
and I tested the proposed approach to support GIT
(http://code.bulix.org/9l2dfi-927848?raw) but we run into a variable
expansion issue which would require pkg-generic.mk to inplace expand
the $(PKG)_DL_VERSION.....

package/dt-utils/dt-utils.mk:7: remove 'v' prefix from v2019.01.0 of
variable DT_UTILS_VERSION and add to DT_UTILS_SITE
package/gstreamer1/gst1-shark/gst1-shark.mk:7: remove 'v' prefix from
v0.6.1 of variable GST1_SHARK_VERSION and add to GST1_SHARK_SITE
package/portaudio/portaudio.mk:7: remove 'v' prefix from
v190600_20161030 of variable PORTAUDIO_VERSION and add to
PORTAUDIO_SITE

Regards,
Matt

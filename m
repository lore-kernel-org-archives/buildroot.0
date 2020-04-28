From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Apr 2020 08:31:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version
 1.3.2
In-Reply-To: <20200428073812.29aa32ee@windsurf.home>
References: <20200421114849.855332-1-julien.grossholtz@openest.io>
 <20200428073812.29aa32ee@windsurf.home>
Message-ID: <CAPi7W83AsH8BEvr7yiUZAt=JdLnDQg+wL2K_bpbR-FuSM1RiVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le mar. 28 avr. 2020 ? 07:38, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 21 Apr 2020 13:48:49 +0200
> Julien Grossholtz <julien.grossholtz@openest.io> wrote:
>
> > paho-c-mqtt 1.3.2 is a maintenance release. It fixes many bugs
> > including memory leaks and segmentation faults.
> >
> > Release notes: https://github.com/eclipse/paho.mqtt.c/milestone/7?closed=1
> >
> > Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
> > ---
> >  package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
> >  package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> This has been causing build issues since it was merged:
>
>   http://autobuild.buildroot.net/?reason=paho-mqtt-c%
>
> It tries to link with libanl:
>
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find -lanl
>
> which I believe is only provided by glibc. Not sure what the fix is.
> Making paho-mqtt-c depend on glibc would not be really nice.
I fixed it upstream with:
https://github.com/eclipse/paho.mqtt.c/commit/517e8659ab566b15cc409490a432e8935b164de8.
I'll send a patch.
It should be noted that that upstream has the "interesting" idea of
deleting and recreating git release. For example, 1.3.2 has been
"re-released" 20 hours ago. It could explain why the hash was wrong
when this package was bumped.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

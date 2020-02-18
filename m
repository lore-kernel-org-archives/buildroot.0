From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 18 Feb 2020 19:10:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseview: depends on host gcc
 >= 4.9
In-Reply-To: <20200218183822.2f6a8e33@windsurf>
References: <20200216180613.908370-1-fontaine.fabrice@gmail.com>
 <20200218183822.2f6a8e33@windsurf>
Message-ID: <CAPi7W81bL=0TH=gJykPnyCuRPbCyPaH+f+gPkaGpm0qF9Qiizg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 18 f?vr. 2020 ? 18:38, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun, 16 Feb 2020 19:06:13 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Commit 88bb278d5ac790bee0c3a438464da82ee7625cff forgot to propagate the
> > new host gcc >= 4.9 dependency from BR2_PACKAGE_LIBSIGROKCXX
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/5dc9dc95d0534b35e2443c120162b5176edafe0b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/pulseview/Config.in | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Applied to master, thanks. However, what would be really good is to
> remove the dependency of libsigrok on host-doxygen. It's a bit annoying
> that generating the documentation cannot be disabled.
doxygen is not only used to generate the documentation.
sigrok C++ bindings use it to parse libsigrok symbols instead of the
python pygccxml module since commit
https://sigrok.org/gitweb/?p=libsigrok.git;a=commit;h=3532ed01256b986ecaf37ea5bb29d81465e2aa89
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

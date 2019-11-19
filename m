From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Nov 2019 08:47:52 +0100
Subject: [Buildroot] [PATCH v2,1/4] package/spice: disable tests
In-Reply-To: <20191118224703.3fb65955@windsurf.home>
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
 <20191118224703.3fb65955@windsurf.home>
Message-ID: <CAPi7W82J2ehtREVFUkdMcn9rwy2pvBEmAhDzmCcCkbD3=vWGGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le lun. 18 nov. 2019 ? 22:47, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun, 17 Nov 2019 17:44:49 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > By disabling tests, we'll remove the optional gdk-pixbuf dependency
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> > Changes v1 -> v2 (after review of Yann E. Morin):
> >  - Disable tests instead of adding and fixing gdk-pixbuf optional
> >    dependency
>
> I've applied to next. However, your patch to upstream is not really
> complete, or at least an additional patch is needed: when tests are
> enabled, their configure.ac script should check if gdk-pixbuf is
> available. And if it's not available, it should bail out, or disable
> tests, but not allow the configure process to complete, and then have a
> build failure when compiling.
You applied only the first patch of the serie and you applied it on
next even if it fixes a build failure on master. Was it intentional?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

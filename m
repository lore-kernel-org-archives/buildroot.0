From: Vadym Kochan <vadim4j@gmail.com>
Date: Wed, 6 Mar 2019 12:19:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: Fix build with mesa
In-Reply-To: <d5faea0f-3445-4039-4dcb-5815d66d15bb@smile.fr>
References: <20190305001943.18631-1-vadim4j@gmail.com>
 <d5faea0f-3445-4039-4dcb-5815d66d15bb@smile.fr>
Message-ID: <20190306101924.GA14041@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Wed, Mar 06, 2019 at 11:12:40AM +0100, Romain Naour wrote:
> Hi Vadim,
> 
> Le 05/03/2019 ? 01:19, Vadim Kochan a ?crit?:
> > efl does not compile with mesa without OpenGL ES because it checks for
> > GL_ES_VERSION_2_0 and declares own GLintptr and GLsizeiptr types if such
> > version is not defined, but mesa declares them too for OpenGL version
> > 1.5, so fix it by add check also for OpenGL 1.5 where these types are
> > defined.
> > 
> > Use patch from:
> > 	https://git.enlightenment.org/core/efl.git/commit/?id=0d2b624f1e24240a1c4e651aa1cfe9a8dd10a573
> > 
> > Fixes:
> > 	http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007
> > 
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >  ...e-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch | 34 ++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch
> > 
> > diff --git a/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch b/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch
> > new file mode 100644
> > index 0000000000..453b9f47b2
> > --- /dev/null
> > +++ b/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch
> > @@ -0,0 +1,34 @@
> > +From d045dd99acdd47be238642d4f9384dccacde2b42 Mon Sep 17 00:00:00 2001
> > +From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
> > +Date: Sat, 15 Dec 2018 16:19:01 +0000
> > +Subject: [PATCH] evas gl - make GLintptr etc. also ndefed for GL_VERSION_1_5
> > + fix typedef
> > +
> > +It seems that GL_VERSION_1_5 define == these provided by gl already. At
> > +least reading the mesa headers I do, so this should fix T7502
> > +
> > + at fix
> 
> Your SoB line is missing here.
> Also it would be great to add the upstream status of this patch.
> 
> Otherwise, the patch is ok.
> 
> Best regards,
> Romain
> 

I directly applied the original commit (as patch) from URI which you provided, and
there was no SoB, so should I put there myself (I was not sure with this
because I did not touched the original patch) ?

Regards,
Vadim Kochan

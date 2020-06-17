From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Jun 2020 22:18:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinydtls: security bump to
 version 0.9-rc1
In-Reply-To: <20200617220843.416f77be@windsurf.home>
References: <20200615203150.1052024-1-fontaine.fabrice@gmail.com>
 <20200617220843.416f77be@windsurf.home>
Message-ID: <CAPi7W80vaeBw8o=4NuKyJrNCVcNO0F4eB-DWThVXKWgE4pyTEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le mer. 17 juin 2020 ? 22:08, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Mon, 15 Jun 2020 22:31:50 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > - Switch site to github
> > - License is now EPL-1.0 or EDLv1.0 as specified in the new LICENSE file
> > - Update indentation of hash file (two spaces)
> > - Drop first patch (already in version) and second patch (not needed since
> >   https://github.com/eclipse/tinydtls/commit/f1ff324a4d1cc14dc6e1c3a88ea16f0242e106de)
> > - Fix CVE-2017-7243 as specified in
> >   https://github.com/eclipse/tinydtls/issues/12 as well as other
> >   security issues:
> >   https://github.com/eclipse/tinydtls/commit/68a1cdaff9e329e13ea59529f1eb61b05632c297
> >   https://github.com/eclipse/tinydtls/commit/494a40dfbb174930ca616e560532d52549736b42
> >   https://github.com/eclipse/tinydtls/commit/2d9f0a82377277af1be8d559d18e30477d63e8ec
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> I've applied to master. See below some comments.
>
> > -TINYDTLS_REL = r5
> > -TINYDTLS_VERSION = 0.8.2
> > -TINYDTLS_SITE = http://downloads.sourceforge.net/project/tinydtls/$(TINYDTLS_REL)
> > -TINYDTLS_LICENSE = MIT
> > -TINYDTLS_LICENSE_FILES = tinydtls.h
> > +TINYDTLS_VERSION = 0.9-rc1
>
> A bit annoying that we have to point to a release candidate version.
I know, I asked for a release and you can find upstream's feedback
here: https://github.com/eclipse/tinydtls/issues/35.
>
> > +TINYDTLS_SITE = $(call github,eclipse,tinydtls,v$(TINYDTLS_VERSION))
> > +TINYDTLS_LICENSE = EPL-1.0 or EDLv1.0
>
> I've changed EDLv1.0 to EDL-1.0. Even though there is no official SPDX
> tag for this license, SPDX always uses <initials>-<version>, so we're
> trying to stick to that as well;
>
> Applied, thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

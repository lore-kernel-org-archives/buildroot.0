From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 17 Oct 2019 18:57:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix static build
 with openssl
In-Reply-To: <20191016231008.41fa8287@windsurf.home>
References: <20191016204128.27360-1-fontaine.fabrice@gmail.com>
 <20191016224816.3ed0e602@windsurf.home>
 <CAPi7W804=Ba=kUBRQ7EhZuKf=ypAnyaPoWFMXv1F6EzLw=fqng@mail.gmail.com>
 <20191016231008.41fa8287@windsurf.home>
Message-ID: <CAPi7W81sWZ2yD00gnaBA+VV6vviNXc5zn8GsvFiTves0+ckTuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 16 oct. 2019 ? 23:10, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Wed, 16 Oct 2019 23:08:34 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > > +             if (NOT LWS_WITH_ESP32)
> > > > ++                    find_package(PkgConfig QUIET)
> > > > ++                    pkg_check_modules(PC_OPENSSL openssl QUIET)
> > > > +                     find_package(OpenSSL REQUIRED)
> > >
> > > Isn't the find_package() then redundant with pkg_check_modules() ?
> > I don't think upstream will accept to add a mandatory dependency on
> > pkg-config so I'll have to keep find_package as fallback.
> > Moreover, CMakeLists.txt sets OPENSSL_INCLUDE_DIRS to
> > OPENSSL_INCLUDE_DIR so I'll also have to update this line as
> > OPENSSL_INCLUDE_DIR won't be set by pkg_check_modules.
> > I think we should wait for the upstream's review.
>
> Then:
>
>         find_package(PkgConfig QUIET)
>         if(whatever is the right way to check if pkg-config was found)
>           pkg_check_modules(PC_OPENSSL openssl QUIET)
>           ... adjust LIBS/CFLAGS ...
>         else()
>           find_package(OpenSSL REQUIRED)
>         endif()
Upstream merged the patch as is, should I sent them a new PR with your updates?
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

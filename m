From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Mar 2020 23:41:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/libcpprestsdk: zlib is optional,
 not mandatory
In-Reply-To: <20200315224751.41147871@windsurf>
References: <20200314222027.2317520-1-fontaine.fabrice@gmail.com>
 <20200315224751.41147871@windsurf>
Message-ID: <CAPi7W82vBGCwQXoEVxOxM3pJipWkg=JnGQW36x5O8dKRyLL21g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le dim. 15 mars 2020 ? 22:47, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 14 Mar 2020 23:20:26 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +LIBCPPRESTSDK_DEPENDENCIES += zlib
> > +LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=OFF
> > +# brotli needs compression
>
> What makes you think brotli needs zlib ? I had a quick look at the
> CMake logic and didn't find that.
From https://github.com/microsoft/cpprestsdk/blob/master/Release/src/CMakeLists.txt:

if(CPPREST_EXCLUDE_COMPRESSION)
if(NOT CPPREST_EXCLUDE_BROTLI)
message(FATAL_ERROR "Use of Brotli requires compression to be enabled")
endif()
>
> Also, how did you test that? zlib is a dependency of openssl, and
> openssl is a mandatory dependency of libcpprestsdk. Did you test with
> libressl ?
Yes, I build-tested it with libressl.
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

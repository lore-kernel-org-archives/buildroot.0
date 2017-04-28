From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Apr 2017 09:24:54 +0300
Subject: [Buildroot] [PATCH] protobuf: fix musl build
In-Reply-To: <CAKKQwLSUE_Th7oV=PW4wUWDo+W+kZSE9LZ5yRE4AnKmM18mXaA@mail.gmail.com>
References: <703712d685c4c0e1459af8b8d3a0fcbd80a87c85.1493324348.git.baruch@tkos.co.il>
 <CAKKQwLSUE_Th7oV=PW4wUWDo+W+kZSE9LZ5yRE4AnKmM18mXaA@mail.gmail.com>
Message-ID: <20170428062454.zitjjufo44yeq4ip@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mario,

On Thu, Apr 27, 2017 at 06:12:14PM -0300, Mario Rugiero wrote:
> Looks good to me.

Thanks.

Care to send a formal Acked-by for patchwork to note?

baruch

> 2017-04-27 17:19 GMT-03:00 Baruch Siach <baruch@tkos.co.il>:
> > Add upstream patch fixing conflict with musl defined major/minor macros.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/fc5/fc5ea266eecb6ecab011ea3542f0bb680fb8fb3b/
> > http://autobuild.buildroot.net/results/3b3/3b3fe16978f19e65a6c6dc1712d72cb349eed0d5/
> > http://autobuild.buildroot.net/results/1da/1dac9d5e49342700036c90ed4785fff7398b8966/
> >
> > Cc: Mario J. Rugiero <mrugiero@gmail.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/protobuf/protobuf.hash | 1 +
> >  package/protobuf/protobuf.mk   | 2 ++
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> > index 9ec6bc759d8f..8c2ade37e7cd 100644
> > --- a/package/protobuf/protobuf.hash
> > +++ b/package/protobuf/protobuf.hash
> > @@ -1,2 +1,3 @@
> >  # Locally calculated
> >  sha256 51d773e4297238b282eaa4c1dd317099675b12eef2b414732b851c00459225c6 protobuf-cpp-3.2.0.tar.gz
> > +sha256 da80c39838515913633f4cbd875fdd4ad711be95c83a50ff5096b9f1254033b3 416f90939d4de58fe1a4e2489120010313183291.patch
> > diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> > index a3e96d4f898c..610da8c04a94 100644
> > --- a/package/protobuf/protobuf.mk
> > +++ b/package/protobuf/protobuf.mk
> > @@ -19,6 +19,8 @@ PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
> >
> >  PROTOBUF_INSTALL_STAGING = YES
> >
> > +PROTOBUF_PATCH = https://github.com/google/protobuf/commit/416f90939d4de58fe1a4e2489120010313183291.patch
> > +
> >  ifeq ($(BR2_PACKAGE_ZLIB),y)
> >  PROTOBUF_DEPENDENCIES += zlib
> >  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

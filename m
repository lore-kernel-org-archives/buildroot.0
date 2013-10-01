From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Tue, 1 Oct 2013 15:04:47 -0500
Subject: [Buildroot] [PATCH v3 10/16] libcgroup: new package
In-Reply-To: <20131001214853.62a871b3@skate>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>	<1380137571-688-11-git-send-email-clshotwe@rockwellcollins.com>
 <20131001214853.62a871b3@skate>
Message-ID: <OF65F0E18D.9A0E7DE2-ON86257BF7.006E0B8B-86257BF7.006E4047@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 10/01/2013 
02:48:53 PM:

> I believe this line is slightly too long. Also, the upstream URL is
> missing. It should probably be:
> 
>      http://libcg.sourceforge.net/

I can fix both of those.

> > diff --git a/package/libcgroup/libcgroup.mk 
b/package/libcgroup/libcgroup.mk
> > new file mode 100644
> > index 0000000..06f1e60
> > --- /dev/null
> > +++ b/package/libcgroup/libcgroup.mk
> > @@ -0,0 +1,38 @@
> > 
> 
+################################################################################
> > +#
> > +# libcgroup
> > +#
> > 
> 
+################################################################################
> > +
> > +LIBCGROUP_VERSION = 0.38
> > +LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
> > +LIBCGROUP_SITE = http://sourceforge.net/projects/libcg/files/
> latest/download
> > +LIBCGROUP_LICENSE = LGPLv2.1
> > +LIBCGROUP_LICENSE_FILES = COPYING
> > +
> > +LIBCGROUP_INSTALL_STAGING = YES
> > +
> > +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc 
fts.h 
> > +# large file support. See https://bugzilla.redhat.com/
> show_bug.cgi?id=574992 
> > +# for more information.
> > +LIBCGROUP_CONF_ENV = \
> > +   CXXFLAGS+="-U_FILE_OFFSET_BITS" \
> > +   CFLAGS+="-U_FILE_OFFSET_BITS"
> > +
> > +LIBCGROUP_CONF_OPT = \
> > +   --disable-tools \
> > +   --disable-daemon \
> > +   --disable-initscript-install
> > +
> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +   LIBCGROUP_CONF_OPT += --enable-static --disable-shared
> > +endif
> 
> This part is not needed, as it is passed by the autotools
> infrastructure already.

I'll remove it.

> Maybe you want to resend just this patch with those fixes, so we can
> get it merged quickly, independently of the other SELinux changes.

Should I do that with all of the simple patches?

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 

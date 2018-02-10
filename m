From: Alex Baldwin <alexbaldwinmusic@gmail.com>
Date: Sat, 10 Feb 2018 17:19:16 +0100
Subject: [Buildroot] [PATCH v2 1/1] LIBLO : bump version to 0.29
In-Reply-To: <20180208230400.06741487@windsurf.lan>
References: <1518118669-24714-1-git-send-email-alexbaldwinmusic@gmail.com>
 <20180208230400.06741487@windsurf.lan>
Message-ID: <CA+bRTvCnigi1UKbkhQv2zGy0vCshgDfzGuOnvv_PjVMXq-_Qgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I  am not sure the best place to address this so please correct me :) I
noticed that this patch failed with your submission as well as Matt
Webber's, but for different reasons.

It seems that on yours
http://autobuild.buildroot.net/results/71a6d7e02a50f6cb53c70c38e82e2a2ae8af13ea/build-end.log
there is a warning about having to redirect <sys/poll.h> to <poll.h> in the
file "server.c:54". This could be sorted with a simple patch, is it
acceptable to patch for this?

On Matt's
http://autobuild.buildroot.net/results/c8b/c8bed3a3fa7d2b2258f573cbfcb01af07419e0bf/build-end.log
we fail because undefined reference to  __atomic_fetch_add_4 . I think a
possible fix could be manually linking to libatomic. I am not entirely sure
why, seems that some compilers are happy to find libatomic on their own and
others aren't. Is this something that buildroot would normally patch for?

Thanks,

Alex


On 8 February 2018 at 23:04, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:
>
> Hello,
>
> On Thu,  8 Feb 2018 20:37:48 +0100, Alex B wrote:
>
> > diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
> > index a4e01a6..862b6fb 100644
> > --- a/package/liblo/liblo.hash
> > +++ b/package/liblo/liblo.hash
> > @@ -1,3 +1,7 @@
> > -# From http://sourceforge.net/projects/liblo/files/liblo/0.26/
> > -sha1 21942c8f19e9829b5842cb85352f98c49dfbc823  liblo-0.26.tar.gz
> > -md5  5351de14262560e15e7f23865293b16f  liblo-0.26.tar.gz
> > +# From http://sourceforge.net/projects/liblo/files/liblo/0.29/
> > +sha1    6aa69456787d3d6ef915281b4a0f8f2c79548ce3  liblo-0.29.tar.gz
> > +md5  b0e70bc0fb2254addf94adddf85cffd3  liblo-0.29.tar.gz
> > +
> > +# Locally computed
> > +sha1    caeb68c46fa36651acf592771d09de7937926bb3  COPYING
> > +md5 fbc093901857fcd118f065f900982c24  COPYING
>
> A single sha256 hash was sufficient here.
>
> > diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
> > index 3c852be..856b437 100644
> > --- a/package/liblo/liblo.mk
> > +++ b/package/liblo/liblo.mk
> > @@ -4,11 +4,12 @@
> >  #
> >
 ################################################################################
> >
> > -LIBLO_VERSION = 0.26
> > +LIBLO_VERSION = 0.29
> >  LIBLO_SITE =
http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
> >
> >  LIBLO_LICENSE = LGPL-2.1+
> >  LIBLO_LICENSE_FILES = COPYING
> >  LIBLO_INSTALL_STAGING = YES
> > +LIBLO_CONF_OPTS += --disable-ipv6
>
> A comment above this line (in addition to the commit log) would have
> been nice.
>
> I've fixed both issues, and applied your patch to next. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180210/87f2c79d/attachment.html>

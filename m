From: xlcwu <xlcwu.taiwan@gmail.com>
Date: Thu, 10 Aug 2017 11:48:27 +0000
Subject: [Buildroot] [PATCH v3] libcgi: bump to version 1.1
In-Reply-To: <c3b8eed9-889c-5893-c9e1-7d8d063cc597@mind.be>
References: <1502351127-21326-1-git-send-email-xlcwu.taiwan@gmail.com>
 <c3b8eed9-889c-5893-c9e1-7d8d063cc597@mind.be>
Message-ID: <CAGtPAdUAUdettj-O0gMUt4m_X8dCj_3y8gnDb3K1NFsBtVcLzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

I build the libcgi by follow steps in
https://github.com/rafaelsteil/libcgi/blob/master/README.md


On Thu, Aug 10, 2017 at 4:20 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>  Hi Joe,
>
> On 10-08-17 09:45, Joe Lin wrote:
> > Cleanup the libcgi package,
> > by using https://github.com/rafaelsteil/libcgi as an upstream.
> > Remove old patch and use cmake to build new version.
> >
> > Signed-off-by: Joe Lin <xlcwu.taiwan@gmail.com>
> [snip]
> > -LIBCGI_VERSION = 1.0
> > -LIBCGI_SITE =
> http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VERSION)
> > +LIBCGI_VERSION = 1.1
> > +LIBCGI_SITE =
> https://github.com/rafaelsteil/libcgi/releases/download/v$(LIBCGI_VERSION)
> > +
> >  LIBCGI_INSTALL_STAGING = YES
> > -# use cross CC/AR rather than host
> > -LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)" \
> > -     $(if $(BR2_STATIC_LIBS),STATIC=1)
> >  LIBCGI_LICENSE = LGPL-2.1+
> >
> > -$(eval $(autotools-package))
> > +LIBCGI_SUPPORTS_IN_SOURCE_BUILD = NO
>
>  Mario (added in Cc) submitted a similar patch and it didn't have this
> _IN_SOURCE_BUILD line. Is it really needed?
>
I am not sure and I will trigger a build to check it.

>
>  Regards,
>  Arnout
>
> > +
> > +$(eval $(cmake-package))
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170810/2153b631/attachment.html>

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Feb 2014 22:16:15 +0100
Subject: [Buildroot] [PATCH v1 5/6] vlc: fix sdl support
In-Reply-To: <1391870095-3738-6-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 8 Feb 2014 15:34:54 +0100")
References: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
 <1391870095-3738-6-git-send-email-s.martin49@gmail.com>
Message-ID: <87bnyh5mqo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > sdl video output module includes xlib headers, so it requires
 > xlib_libx11 to be available.

 > Fixes:
 >   http://autobuild.buildroot.org/results/d41/d41d2f36a4384289e300a3cf91d51960df9fab00/build-end.log

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > ---
 >  package/vlc/vlc.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
 > index 65aab36..871373e 100644
 > --- a/package/vlc/vlc.mk
 > +++ b/package/vlc/vlc.mk
 > @@ -224,9 +224,9 @@ else
 >  VLC_CONF_OPT += --disable-qt
 >  endif
 
 > -ifeq ($(BR2_PACKAGE_SDL),y)
 > +ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_SDL),yy)

A more correct test is probably for SDL's X11 backend (which also
implies XLIB_LIBX11), so I've changed it to test for that.

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard

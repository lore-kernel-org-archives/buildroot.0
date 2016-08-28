From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 00:05:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/sconeserver: needs host-pkgconf
In-Reply-To: <1472408394-20573-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 28 Aug 2016 20:19:53 +0200")
References: <1472408394-20573-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <871t188s88.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > sconeserver uses pkg-config macros, so it needs host-pkgconf.
 > Reported-by: Matthew Weber <matt@thewebers.ws>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/sconeserver/sconeserver.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
 > index e02c1a6..42901c6 100644
 > --- a/package/sconeserver/sconeserver.mk
 > +++ b/package/sconeserver/sconeserver.mk
 > @@ -10,7 +10,7 @@ SCONESERVER_LICENSE = GPLv2+
 >  SCONESERVER_LICENSE_FILES = COPYING
 >  # fetching from Git, we need to generate the configure script
 >  SCONESERVER_AUTORECONF = YES
 > -SCONESERVER_DEPENDENCIES += pcre
 > +SCONESERVER_DEPENDENCIES = host-pkgconf pcre

It already pulled in host-pkgconf for the image and location suboption,
so I've dropped those, updated the commit message and committed, thanks.

-- 
Bye, Peter Korsgaard

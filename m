From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 08:11:36 +0200
Subject: [Buildroot] [PATCH] package/axel: fix link order
In-Reply-To: <1471182669-4429-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 14 Aug 2016 15:51:09 +0200")
References: <1471182669-4429-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87pop9w8dj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libintl may use thread-related functions, so -lpthread must come after
 > -lintl.

 > Fixes:
 >     http://autobuild.buildroot.org/results/e9d/e9d89fd5b24a76a3c5ab9dc8f01f4643f7c13396/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/axel/axel.mk | 5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/package/axel/axel.mk b/package/axel/axel.mk
 > index 6328d99..b60af0e 100644
 > --- a/package/axel/axel.mk
 > +++ b/package/axel/axel.mk
 > @@ -9,13 +9,14 @@ AXEL_SITE = http://sources.buildroot.net
 >  AXEL_LICENSE = GPLv2+
 >  AXEL_LICENSE_FILES = COPYING
 
 > -AXEL_LDFLAGS = -lpthread
 > -
 >  ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 >  AXEL_DEPENDENCIES += gettext
 >  AXEL_LDFLAGS += -lintl
 >  endif
 
 > +# -lintl may use symbols from -pthread
 > +AXEL_LDFLAGS += -lpthread

Committed after s/pthread/lpthread/ as suggested by Arnout, thanks.

-- 
Bye, Peter Korsgaard

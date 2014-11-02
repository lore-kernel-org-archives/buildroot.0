From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Nov 2014 21:16:19 +0100
Subject: [Buildroot] [git commit] avahi: fix avahi-ui build with libgtk3
In-Reply-To: <1414959095.1061.1.camel@posteo.de> (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 02 Nov 2014 21:11:35 +0100")
References: <20141031115353.56D52B23C4@busybox.osuosl.org>
 <1414799165.15213.1.camel@posteo.de> <20141101191304.GG10189@free.fr>
 <1414959095.1061.1.camel@posteo.de>
Message-ID: <87ppd55pf0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

Hi,

 > Yann, Peter, All,

 >> It seems it requires gettext.
 >> 
 >> J?rg, care to test adding this to avahi.mk (just below AUTORECONF):
 >> 
 >> AVAHI_GETTEXTIZE = YES

 > this doesn't help. The problem is the AM_GLIB_GNU_GETTEXT macro at
 > configure.ac:419. If I enable glibc avahi builds without errors.

glib, not glibc.

 > I've also found some old posts about this issue, e.g:
 > http://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-instead-the-glib-one/

 > I followed this suggestions and replaced AM_GLIB_GNU_GETTEXT with:
 >         AM_GNU_GETTEXT_VERSION([0.19.3])
 >         AM_GNU_GETTEXT([external])
 > and it works for me.

 > I am not sure about the version number I should use for gettext. The
 > most recent one?

Sorry, don't know.

 > I am not an expert about autotools. So what do you think about this? May
 > I submit a patch for this issue?

Either that, or we simply forget about patching Makefile.am / running
autoreconf and just strip the CFLAGS arguments in Makefile.in instead.

-- 
Venlig hilsen,
Peter Korsgaard 

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:37:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: security bump
 to version 2.64.3
In-Reply-To: <20200531084902.3909694-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 31 May 2020 10:49:02 +0200")
References: <20200531084902.3909694-1-fontaine.fabrice@gmail.com>
Message-ID: <87k10qfron.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-13645: In GNOME glib-networking through 2.64.2, the
 >   implementation of GTlsClientConnection skips hostname verification of
 >   the server's TLS certificate if the application fails to specify the
 >   expected server identity. This is in contrast to its intended
 >   documented behavior, to fail the certificate verification.
 >   Applications that fail to provide the server identity, including Balsa
 >   before 2.5.11 and 2.6.x before 2.6.1, accept a TLS certificate if the
 >   certificate is valid for any host.
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/glib-networking/glib-networking.hash | 6 +++---
 >  package/glib-networking/glib-networking.mk   | 4 ++--
 >  2 files changed, 5 insertions(+), 5 deletions(-)

 > diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
 > index 061b7af695..336e0aa07b 100644
 > --- a/package/glib-networking/glib-networking.hash
 > +++ b/package/glib-networking/glib-networking.hash
 > @@ -1,3 +1,3 @@
 > -# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.61/glib-networking-2.61.1.sha256sum
 > -sha256  a3acbe8953ba80e408bdc4a3e8c240fd9447181c7e800a175c3105604c38bad5 glib-networking-2.61.1.tar.xz
 > -sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
 > +# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.64/glib-networking-2.64.3.sha256sum
 > +sha256  937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168  glib-networking-2.64.3.tar.xz
 > +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 > diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
 > index 39133371f5..295c7516cc 100644
 > --- a/package/glib-networking/glib-networking.mk
 > +++ b/package/glib-networking/glib-networking.mk
 > @@ -4,8 +4,8 @@
 >  #
 >  ################################################################################
 
 > -GLIB_NETWORKING_VERSION_MAJOR = 2.61
 > -GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
 > +GLIB_NETWORKING_VERSION_MAJOR = 2.64
 > +GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).3

The same fix is available in 2.62.4, so I've bumped to that version
instead considering how close we are to 2020.05 / easier backport to
LTS.

https://ftp.gnome.org/pub/gnome/sources/glib-networking/2.62/glib-networking-2.62.4.news

Feel free to send another patch (for next) bumping to the 2.64.x series.

-- 
Bye, Peter Korsgaard

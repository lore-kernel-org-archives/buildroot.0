From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 8 Oct 2013 10:11:53 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] libcap: fix static linking issue
In-Reply-To: <20131006232954.71da4d75@skate>
Message-ID: <420407879.8180852.1381219913546.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

----- Mail original -----
| De: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
| ?: "Romain Naour" <romain.naour@openwide.fr>
| Cc: "buildroot" <buildroot@busybox.net>
| Envoy?: Dimanche 6 Octobre 2013 23:29:54
| Objet: Re: [Buildroot] [PATCH 1/1] libcap: fix static linking issue
| 
| Dear Romain Naour,
| 
| On Sun, 06 Oct 2013 22:10:24 +0200, Romain Naour wrote:
| > Add -fPIC flag
| > 
| > Fixes:
| > http://autobuild.buildroot.net/results/619bceb3491ecd2ed4e1ae552fdb237a0ed2fa47/
| > 
| > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
| > ---
| >  package/libcap/libcap.mk | 7 ++++++-
| >  1 file changed, 6 insertions(+), 1 deletion(-)
| > 
| > diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
| > index 16afaef..6248fed 100644
| > --- a/package/libcap/libcap.mk
| > +++ b/package/libcap/libcap.mk
| > @@ -25,10 +25,15 @@ endif
| >  # we don't have host-attr
| >  HOST_LIBCAP_DEPENDENCIES =
| > 
| > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
| > +LIBCAP_LDFLAGS=-fPIC
| > +endif
| 
| This seems really weird, because normally, we would expect exactly
| the
| opposite: position independent code is needed for shared libraries,
| not
| for static libraries.

Ok, I'll take the problem from the beginning.
Sorry for that mistake.

Best regards,
Romain
| 
| Thomas
| --
| Thomas Petazzoni, Free Electrons
| Embedded Linux, Kernel and Android engineering
| http://free-electrons.com
| 

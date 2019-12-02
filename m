From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 2 Dec 2019 20:19:01 +0100
Subject: [Buildroot] [PATCH/next 1/3] package/solarus: bump to version
 1.6.2
In-Reply-To: <c80bd416-8dfd-9fb1-4e4a-965dac2e5ed1@gmail.com>
References: <20191201092823.1288313-1-fontaine.fabrice@gmail.com>
 <c80bd416-8dfd-9fb1-4e4a-965dac2e5ed1@gmail.com>
Message-ID: <CAPi7W81GH9yFgSR64u4fFL3LyFBjBn_2KeypDCu=dowKZA4KNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Le dim. 1 d?c. 2019 ? 11:05, Romain Naour <romain.naour@gmail.com> a ?crit :
>
> Hi Fabrice,
>
> Le 01/12/2019 ? 10:28, Fabrice Fontaine a ?crit :
> > Switch to gitlab to retrieve latest version
>
> Here is a discussion about downloading archive from gitlab:
> https://gitlab.com/solarus-games/solarus/issues/1410
>
> Are you sure that the archive hash will be the same over the time?
Nope, I'm not sure but this issue was opened three months ago so I
think we should move forward and retrieve this archive like we already
do with some github projects that don't provide official tarball
either.
If the archive hash changes, then I assume that we'll fallback on our
own cached tarball.
>
> Also, there is no official release archive in gitlab:
> https://gitlab.com/solarus-games/solarus/releases
>
> The issue has been reported:
> https://gitlab.com/solarus-games/solarus-website-pages/issues/37
> https://gitlab.com/solarus-games/solarus-website-pages/issues/38
>
> Best regards,
> Romain
>
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/solarus/solarus.hash | 2 +-
> >  package/solarus/solarus.mk   | 6 +++---
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
> > index dab8d1a1fa..596c0e3bdf 100644
> > --- a/package/solarus/solarus.hash
> > +++ b/package/solarus/solarus.hash
> > @@ -1,4 +1,4 @@
> >  # Locally calculated
> > -sha256 d800fdf388f860732f2d40c8dd635c34fd1c452857f75bf9b3a421e3ef5ee751  solarus-1.6.0-src.tar.gz
> > +sha256 a752c26ef9d7a22c8b054d5e22967f5e24519b9b3b22aaff265224e8088c833f  solarus-1.6.2.tar.gz
> >
> >  sha256 309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
> > diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
> > index fd7bbea2c7..6f65a53fea 100644
> > --- a/package/solarus/solarus.mk
> > +++ b/package/solarus/solarus.mk
> > @@ -4,9 +4,9 @@
> >  #
> >  ################################################################################
> >
> > -SOLARUS_VERSION = 1.6.0
> > -SOLARUS_SITE = http://www.solarus-games.org/downloads/solarus
> > -SOLARUS_SOURCE = solarus-$(SOLARUS_VERSION)-src.tar.gz
> > +SOLARUS_VERSION = 1.6.2
> > +SOLARUS_SITE = \
> > +     https://gitlab.com/solarus-games/solarus/archive/v$(SOLARUS_VERSION)
> >
> >  SOLARUS_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
> >       CC-BY-SA-3.0 (GUI icons)
> >
>
Best Regards,

Fabrice

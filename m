From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2020 08:24:25 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.79
In-Reply-To: <CAB0FRsve+Jsqyf-fPdwV6=WJLObETo=v5k9JtP-9c9csvPP1OQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Mon, 22 Jun 2020
 20:48:57 +0200")
References: <20200622073933.236001-1-francois.perrad@gadz.org>
 <87eeq78o4n.fsf@dell.be.48ers.dk>
 <20200622105151.rrcjmjdqxiy5pcgp@falbala.internal.home.lespocky.de>
 <CAB0FRsve+Jsqyf-fPdwV6=WJLObETo=v5k9JtP-9c9csvPP1OQ@mail.gmail.com>
Message-ID: <871rm68fl2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > Le lun. 22 juin 2020 ? 12:52, Alexander Dahl <post@lespocky.de> a ?crit :
 >> Hei hei,
 >> 
 >> On Mon, Jun 22, 2020 at 11:07:36AM +0200, Peter Korsgaard wrote:
 >> > >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
 >> >
 >> >  > CBC ciphers, 3DES and hmac-sha1-96 are now disabled by default.
 >> >
 >> > Do we expect that to cause compatibility issues?
 >> 
 >> I just looked in package/dropbear/dropbear.mk and those options are
 >> explicitly disabled if DROPBEAR_DISABLE_LEGACY_CRYPTO is set. From a
 >> quick glance I would say now there's no possibility to activate those
 >> anymore.
 >> 
 >> 
 > BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE allows to build any custom configuration.

 > maybe we can remove BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO (which is less
 > versatile) ?

 > see https://git.busybox.net/buildroot/commit/package/dropbear/Config.in?id=72d4d098b0dbb10d3904868acc11c97acafa8d80
 > see https://git.busybox.net/buildroot/commit/package/dropbear/Config.in?id=26708469adc3f5e4194f176fa51f1ce280b0b357

We could, but then we would end up changing the configuration for
everyone not using such a file (E.G. DROPBEAR_DSS /
DROPBEAR_DH_GROUP1).

We already do a bunch of fixups in localoptions.h, so I think just
correcting BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO to do what it is supposed
to do after the version bump is nicer.

-- 
Bye, Peter Korsgaard

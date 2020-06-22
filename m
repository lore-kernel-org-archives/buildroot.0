From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 22 Jun 2020 20:48:57 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.79
In-Reply-To: <20200622105151.rrcjmjdqxiy5pcgp@falbala.internal.home.lespocky.de>
References: <20200622073933.236001-1-francois.perrad@gadz.org>
 <87eeq78o4n.fsf@dell.be.48ers.dk>
 <20200622105151.rrcjmjdqxiy5pcgp@falbala.internal.home.lespocky.de>
Message-ID: <CAB0FRsve+Jsqyf-fPdwV6=WJLObETo=v5k9JtP-9c9csvPP1OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 22 juin 2020 ? 12:52, Alexander Dahl <post@lespocky.de> a ?crit :

> Hei hei,
>
> On Mon, Jun 22, 2020 at 11:07:36AM +0200, Peter Korsgaard wrote:
> > >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
> >
> >  > CBC ciphers, 3DES and hmac-sha1-96 are now disabled by default.
> >
> > Do we expect that to cause compatibility issues?
>
> I just looked in package/dropbear/dropbear.mk and those options are
> explicitly disabled if DROPBEAR_DISABLE_LEGACY_CRYPTO is set. From a
> quick glance I would say now there's no possibility to activate those
> anymore.
>
>
BR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE allows to build any custom configuration.

maybe we can remove BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO (which is less
versatile) ?

see https://git.busybox.net/buildroot/commit/package/dropbear/Config.in?id=72d4d098b0dbb10d3904868acc11c97acafa8d80
see https://git.busybox.net/buildroot/commit/package/dropbear/Config.in?id=26708469adc3f5e4194f176fa51f1ce280b0b357


Fran?ois

Greets
> Alex
>
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200622/8b9d6a48/attachment.html>
